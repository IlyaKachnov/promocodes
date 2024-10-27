package com.promocodes.promocodes.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gptapi.request.Message;
import com.gptapi.request.RequestGpt;
import com.gptapi.response.AccessTokenResponse;
import com.gptapi.response.ResponseGpt;
import com.promocodes.promocodes.dao.entity.AccessTokenEntity;
import com.promocodes.promocodes.dao.entity.GptMessage;
import com.promocodes.promocodes.dao.repository.AccessTokenRepository;
import com.promocodes.promocodes.dao.repository.RawGptCompanyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

@Service
@RequiredArgsConstructor
@Slf4j
public class GPTApiService {
    public static final String GIGA_CHAT_API = "https://gigachat.devices.sberbank.ru/api/v1/chat/completions";
    @Value("${gpt.auth-token}")
    private String token;
    private final RestTemplate restTemplate;
    public final AccessTokenRepository accessTokenRepository;
    private final ObjectMapper objectMapper;

    private final RawGptCompanyRepository rawGptCompanyRepository;

    public ResponseEntity<ResponseGpt> callGpt(String promptTextTemplate, List<String> replaceStrings) throws JsonProcessingException {
        AccessTokenEntity authToken = getAuthToken();
        log.info("Use params for prompt = {}", replaceStrings);
        String companyPrompt = String.format(promptTextTemplate, replaceStrings);
        log.info("Create prompt  = {}", companyPrompt);
        RequestGpt requestGpt = new RequestGpt();
        requestGpt.setModel("GigaChat");
        requestGpt.setTemperature(1.0);
        requestGpt.setTopP(0.1);
        requestGpt.setN(1);
        requestGpt.setStream(false);
        requestGpt.setMaxTokens(512);
        requestGpt.setRepetitionPenalty(1);

        Message message = new Message();
        message.setContent(companyPrompt);
        message.setRole("user");
        requestGpt.setMessages(List.of(message));
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(authToken.getToken());
        HttpEntity<RequestGpt> entity = new HttpEntity<>(requestGpt, headers);
        ResponseEntity<ResponseGpt> responseGptResponseEntity = restTemplate.postForEntity(GIGA_CHAT_API,
                entity,
                ResponseGpt.class);
        log.info("Got response = {}", responseGptResponseEntity.getBody());
        rawGptCompanyRepository.save(GptMessage.builder()
                .data(objectMapper.writeValueAsString(responseGptResponseEntity.getBody()))
                .request(objectMapper.writeValueAsString(requestGpt))
                .build());
        return responseGptResponseEntity;
    }

    private AccessTokenEntity getAuthToken() {
        return accessTokenRepository.findFirstByOrderByExpiresAtDesc()
                .stream().filter(accessTokenEntity -> accessTokenEntity.getExpiresAt() > Instant.now().plus(20, ChronoUnit.SECONDS).toEpochMilli())
                .findFirst().orElseGet(() -> {
                    MultiValueMap<String, String> requestBody = new LinkedMultiValueMap<>();
                    requestBody.add("scope", "GIGACHAT_API_PERS");

                    HttpHeaders headers = new HttpHeaders();
                    headers.add("Accept", "*/*");
                    headers.add("Content-Type", "application/x-www-form-urlencoded");
                    headers.add("RqUID", UUID.randomUUID().toString());
                    headers.setBearerAuth(token);

                    log.debug("Headers = {}", headers);
                    log.debug("Token = {}", token);
                    HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(requestBody, headers);
                    ResponseEntity<AccessTokenResponse> accessTokenResponseResponseEntity = restTemplate.postForEntity("https://ngw.devices.sberbank.ru:9443/api/v2/oauth",
                            entity,
                            AccessTokenResponse.class);
                    if (accessTokenResponseResponseEntity.getStatusCode() != HttpStatus.OK || !accessTokenResponseResponseEntity.hasBody()) {
                        return null;
                    }
                    AccessTokenResponse accessTokenResponse = accessTokenResponseResponseEntity.getBody();
                    if (Objects.isNull(accessTokenResponse)) {
                        return null;
                    }
                    AccessTokenEntity accessTokenEntity = AccessTokenEntity.builder()
                            .token(accessTokenResponse.getAccessToken())
                            .expiresAt(accessTokenResponse.getExpiresAt())
                            .build();
                    return accessTokenRepository.save(accessTokenEntity);
                });
    }
}
