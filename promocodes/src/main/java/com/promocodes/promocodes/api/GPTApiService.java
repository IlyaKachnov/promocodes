package com.promocodes.promocodes.api;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gptapi.request.Message;
import com.gptapi.request.RequestGpt;
import com.gptapi.response.AccessTokenResponse;
import com.gptapi.response.ResponseGpt;
import com.promocodes.promocodes.dao.entity.AccessTokenEntity;
import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.dao.entity.RawGptCompanyEntity;
import com.promocodes.promocodes.dao.repository.AccessTokenRepository;
import com.promocodes.promocodes.dao.repository.CategoryRepository;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import com.promocodes.promocodes.dao.repository.RawGptCompanyRepository;
import com.promocodes.promocodes.utils.FileReaderUtils;
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
import java.util.*;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class GPTApiService {
    private final CompanyRepository companyRepository;
    private final CategoryRepository categoryRepository;
    @Value("${gpt.auth-token}")
    private String token;
    private final RestTemplate restTemplate;
    public final AccessTokenRepository accessTokenRepository;
    private final FileReaderUtils fileReaderUtils;
    private final ObjectMapper objectMapper;

    private final RawGptCompanyRepository rawGptCompanyRepository;

    public ResponseEntity<ResponseGpt> getGptResponse() {
        AccessTokenEntity authToken = getAuthToken();
        RequestGpt requestGpt = new RequestGpt();
        requestGpt.setModel("GigaChat");
        requestGpt.setTemperature(1.0);
        requestGpt.setTopP(0.1);
        requestGpt.setN(1);
        requestGpt.setStream(false);
        requestGpt.setMaxTokens(512);
        requestGpt.setRepetitionPenalty(1);

        Message message = new Message();
        message.setContent("определить по списку url наименование компании и определить их в одну из указанных категорий:\n" +
                "Онлайн-кинотеатр,\n" +
                "Товары для сна,\n" +
                "Электроника\n" +
                "Если не подходит не под одну категорию, отнеси в категорию Иное\n" +
                "список url:\n" +
                "https://somiasleep.ru/\n" +
                "https://okko.tv/s/drc\n" +
                "https://khitrovamed.com/\n" +
                "https://go.sky.pro\n" +
                "\n" +
                "верни ответ в формате json:\n" +
                "{\n" +
                "  \"companies\": [\n" +
                "    {\n" +
                "      \"name\": \"Company Name\",\n" +
                "      \"url\": \"https://url.ru/\",\n" +
                "      \"category\": \"Электроника\"\n" +
                "    }\n" +
                "  ]\n" +
                "}");
        message.setRole("user");
        requestGpt.setMessages(List.of(message));
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(authToken.getToken());
        HttpEntity<RequestGpt> entity = new HttpEntity<>(requestGpt, headers);
        ResponseEntity<ResponseGpt> responseGptResponseEntity = restTemplate.postForEntity("https://gigachat.devices.sberbank.ru/api/v1/chat/completions",
                entity,
                ResponseGpt.class);
        return responseGptResponseEntity;
    }

    public ResponseEntity<String> fillCompanyUrl() throws JsonProcessingException {
        long count = companyRepository.count();
        int offset = 0;
        int limit = (int) Math.ceil((double) count / 80);
        List<CompanyEntity> companiesAfterUpdate = new ArrayList<>();
        StringBuilder gptResponseMessage = new StringBuilder();
        String readFromFile = fileReaderUtils.readFromFile();
        List<CompanyGptDto> companyGptDtos = new ArrayList<>();

        while (offset < count) {
            StringBuilder companyUrlPromptBuilder = new StringBuilder(readFromFile).append("\n");
            List<CompanyEntity> companyEntities = (List<CompanyEntity>) companyRepository.getOffsetN(limit, offset);

            for (CompanyEntity companyEntity : companyEntities) {
                companyUrlPromptBuilder.append(companyEntity.getName()).append("\n");
            }
            ResponseEntity<ResponseGpt> batchGptRequest = getBatchGptRequest(companyUrlPromptBuilder);
            com.gptapi.response.Message message = batchGptRequest.getBody().getChoices().get(0).getMessage();
            //todo save gpt response then map to cpmpany
            List<CompanyGptDto> readValue = objectMapper.readValue(message.getContent(),
                    new TypeReference<>() {
                    });
            log.info("Read value = {}", readValue.toString());
            companyGptDtos.addAll(readValue);
            RawGptCompanyEntity rawGptCompanyEntity = RawGptCompanyEntity.builder()
                    .data(objectMapper.writeValueAsString(message.getContent()))
                    .build();
            rawGptCompanyRepository.save(rawGptCompanyEntity);
            offset += limit;
        }

        for (CompanyGptDto companyGptDto : companyGptDtos) {
            log.info("Updating company name = {}, url = {}", companyGptDto.getCompanyName(), companyGptDto.getUrl());
            companyRepository.updateCompany(companyGptDto.getUrl(), companyGptDto.getCompanyName());
        }
        return ResponseEntity.ok(gptResponseMessage.toString());
    }

    private ResponseEntity<ResponseGpt> getBatchGptRequest(StringBuilder companyUrlPromptBuilder) {
        String companyPrompt = companyUrlPromptBuilder.toString().trim();
        AccessTokenEntity authToken = getAuthToken();
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
        ResponseEntity<ResponseGpt> responseGptResponseEntity = restTemplate.postForEntity("https://gigachat.devices.sberbank.ru/api/v1/chat/completions",
                entity,
                ResponseGpt.class);
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

    public ResponseEntity<ResponseGpt> getGptResponse(String promptFile, List<String> categoryList, List<String> toFillFields) throws JsonProcessingException {
        AccessTokenEntity authToken = getAuthToken();

        String readFromFile = fileReaderUtils.readFromFile(promptFile);

        var categoryString = categoryList.stream().collect(Collectors.joining("\n"));
        var toFillString = toFillFields.stream().collect(Collectors.joining("\n"));
        String companyPrompt = String.format(readFromFile,categoryString,  toFillString);
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
        ResponseEntity<ResponseGpt> responseGptResponseEntity = restTemplate.postForEntity("https://gigachat.devices.sberbank.ru/api/v1/chat/completions",
                entity,
                ResponseGpt.class);
        rawGptCompanyRepository.save(RawGptCompanyEntity.builder()
                        .data(objectMapper.writeValueAsString(responseGptResponseEntity.getBody()))
                .build());
        return responseGptResponseEntity;
    }


}
