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
    private final CompanyRepository companyRepository;
    private final PromoCodeRepository promoCodeRepository;

    private final List<String> needles = List.of("промокодом", "промокоду", "промокод");

    private final Set<String> excludeUrlParts = Set.of("clc", "clck", "goo");

    private final CompanyService companyService;
    private final CategoryRepository categoryRepository;
    private final GPTApiService gptApiService;

    private final ObjectMapper objectMapper;

    public void execute(Long executionId) {
        //todo hardcode execId
        List<String> promocodes = rawVideoDataRepository.findAllByPromoCodeIsNotNullAndExecutionId(executionId).stream()
                .map(RawVideoDataEntity::getPromoCode).toList();
//        List<String> companyNames = ((List<CompanyEntity>) companyRepository.findAll()).stream()
//                .map(CompanyEntity::getName)
//                .toList();

        List<PromoCodeEntity> promoCodeEntities = new ArrayList<>();
        for (String promoCode : promocodes) {
            if (promoCode != null) {
                try {
                    PromoCodeEntity promoEntity = YoutubeDataUtils.createPromoEntity(promoCode, needles);
                    promoEntity.setExecutionId(executionId);
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

    //TODO: 1. поиск сыылке в списке компаний, если нет то 2. запрос в gpt
    public List<PromoCodeEntity> fillCategoryInfo(List<PromoCodeEntity> promoCodeEntities) throws JsonProcessingException {
        List<String> resultUrls = promoCodeEntities.stream()
                .map(PromoCodeEntity::getUrl).filter(url -> {
                    if (url == null) {
                        return false;
                    }
                    for (var excludeUrl : excludeUrlParts) {
                        if (url.contains(excludeUrl)) {
                            return false;
                        }
                    }
                    return true;
                }).toList();

        var categoryList = ((List<CategoryEntity>) categoryRepository.findAll()).stream().map(CategoryEntity::getName).toList();
        var response = gptApiService.getGptResponse("category_prompt2", categoryList, resultUrls);
        var message = response.getBody().getChoices().get(0).getMessage();

        List<CategoryGptDto> categoryGptDtos = objectMapper.readValue(message.getContent(), new TypeReference<>() {
        });

        List<PromoCodeEntity> updateEntities = new ArrayList<>();
        for (var categoryGptDto : categoryGptDtos) {
            var promoCodeEntity = promoCodeRepository.updatePromoCode(categoryGptDto.getCategory(), categoryGptDto.getUrl());
            updateEntities.add(promoCodeEntity);
        }

        return updateEntities;

    }

    //todo смотреть маппинг по ссылкам (https://company.ru) -> segment1 if seg1.seg2 -> seg2
    // забирать все вкдючая по ссылку
    private String containsWords(String inputString, List<String> items) {
        for (String item : items) {
            if (inputString.contains(item)) {
                return item;
            }
        }
        return "NOT_FOUND";
    }
}
