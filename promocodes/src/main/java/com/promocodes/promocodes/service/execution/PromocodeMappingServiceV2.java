package com.promocodes.promocodes.service.execution;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.promocodes.promocodes.api.GPTApiService;
import com.promocodes.promocodes.api.PromocodeGptDto;
import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.entity.RawVideoDataEntity;
import com.promocodes.promocodes.dao.repository.PromoCodeRepository;
import com.promocodes.promocodes.dao.repository.RawVideoDataRepository;
import com.promocodes.promocodes.utils.FileReaderUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service("GETTING_PROMOS_V2")
@RequiredArgsConstructor
@Slf4j
public class PromocodeMappingServiceV2 implements ExecutionService {

    private final FileReaderUtils fileReaderUtils;
    private final GPTApiService gptApiService;

    private final RawVideoDataRepository rawVideoDataRepository;

    private final ObjectMapper objectMapper;

    private final PromoCodeRepository promoCodeRepository;

    @Override
    public void execute(Long executionId) throws Exception {

        final var getPromoPrompt = fileReaderUtils.getResource("get_promo_prompt");
        final var entityList = rawVideoDataRepository.findAllByPromoCodeIsNotNullAndExecutionId(executionId);

        List<PromoCodeEntity> promoCodeEntities = new ArrayList<>();

        for (RawVideoDataEntity rawVideoDataEntity : entityList) {
            if (rawVideoDataEntity.getPromoCode() != null) {
                try {
                    final var modifiedDescription = modifyDescription(rawVideoDataEntity.getDescription());
                    log.info("Truncated description: {}", modifiedDescription);
                    final var response = gptApiService.callGpt(getPromoPrompt, List.of(modifiedDescription));

                    final var message = response.getBody().getChoices().get(0).getMessage();
                    try {
                        final var promocodeGptDto = objectMapper.readValue(message.getContent(), PromocodeGptDto.class);
                        PromoCodeEntity promoEntity = PromoCodeEntity.builder()
                                .description(rawVideoDataEntity.getDescription())
                                .url(promocodeGptDto.getSite())
                                .createdAt(LocalDateTime.now())
                                .expiresAt(promocodeGptDto.getExpiresAt())
                                .companyName(promocodeGptDto.getCompany())
                                .promoCodeValue(promocodeGptDto.getPromocode())
                                .algVersion("v2")
                                .executionId(executionId)
                                .publishedDate(rawVideoDataEntity.getPublishedDate())
                                .gptMessage(message.getContent())
                                .build();
                        promoCodeEntities.add(promoEntity);
                    } catch (JsonProcessingException e) {
                        log.error("Exception during processing message", e);
                        PromoCodeEntity promoEntity = PromoCodeEntity.builder()
                                .description(rawVideoDataEntity.getDescription())
                                .createdAt(LocalDateTime.now())
                                .algVersion("v2")
                                .executionId(executionId)
                                .publishedDate(rawVideoDataEntity.getPublishedDate())
                                .gptMessage(message.getContent())
                                .build();
                        promoCodeEntities.add(promoEntity);
                    }

                } catch (RuntimeException e) {
                    log.error("Exception during creating promo code", e);
                }
            }

        }
        promoCodeRepository.saveAll(promoCodeEntities);
    }

    public String modifyDescription(String description) {
        String str = description.replace("\n\n", "\n");
        return str.length() <= 300 ? str : str.substring(0, 300);
    }
}
