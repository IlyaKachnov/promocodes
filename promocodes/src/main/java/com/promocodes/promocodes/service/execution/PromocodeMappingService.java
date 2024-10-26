package com.promocodes.promocodes.service.execution;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.promocodes.promocodes.api.CategoryGptDto;
import com.promocodes.promocodes.api.GPTApiService;
import com.promocodes.promocodes.dao.entity.CategoryEntity;
import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.entity.RawVideoDataEntity;
import com.promocodes.promocodes.dao.repository.CategoryRepository;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import com.promocodes.promocodes.dao.repository.PromoCodeRepository;
import com.promocodes.promocodes.dao.repository.RawVideoDataRepository;
import com.promocodes.promocodes.service.CompanyService;
import com.promocodes.promocodes.utils.YoutubeDataUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service("GETTING_PROMOS")
@RequiredArgsConstructor
@Slf4j
public class PromocodeMappingService implements ExecutionService {
    private final RawVideoDataRepository rawVideoDataRepository;
    private final PromoCodeRepository promoCodeRepository;

    private final List<String> needles = List.of("промокодом", "промокоду", "промокод");

    private final Set<String> excludeUrlParts = Set.of("clc", "clck", "goo");

    private final CompanyService companyService;

    public void execute(Long executionId) {
        List<RawVideoDataEntity> rawVideoDataEntities = rawVideoDataRepository.findAllByPromoCodeIsNotNullAndExecutionId(executionId).stream()
                .toList();
        List<PromoCodeEntity> promoCodeEntities = new ArrayList<>();
        for (RawVideoDataEntity rawVideoDataEntity : rawVideoDataEntities) {
            if (rawVideoDataEntity.getPromoCode() != null) {
                try {
                    PromoCodeEntity promoEntity = YoutubeDataUtils.createPromoEntity(rawVideoDataEntity.getPromoCode(), needles);
                    promoEntity.setExecutionId(executionId);
                    promoEntity.setPublishedDate(rawVideoDataEntity.getPublishedDate());
                    promoCodeEntities.add(promoEntity);
                } catch (RuntimeException e) {
                    log.error("Exception during creating promo code", e);
                }
            }
        }
        promoCodeRepository.saveAll(promoCodeEntities);
    }

    //todo первоочередно брать из Базы по урлу находить компанию, если ее нет то парсим и добавляем компанию в БД например тег <meta og:site_name
    public void fillWithCompanyNames(List<PromoCodeEntity> promoCodeEntities) {
        for (var promoCodeEntity : promoCodeEntities) {
            if (promoCodeEntity.getUrl() != null) {
                try {
                    String companyName = companyService.followCompanyUrl(promoCodeEntity.getUrl());
                    promoCodeEntity.setCompanyName(companyName);
                    promoCodeRepository.save(promoCodeEntity);
                } catch (IOException e) {
                    log.error("Error during parsing company site", e);
                }
            }
        }
    }

}
