package com.promocodes.promocodes.service.execution;

import com.promocodes.promocodes.dao.entity.CategoryEntity;
import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.repository.CategoryRepository;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import com.promocodes.promocodes.dao.repository.PromoCodeRepository;
import com.promocodes.promocodes.dao.repository.RawGptCompanyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service("FILL_COMPANY_NAMES")
@RequiredArgsConstructor
@Slf4j
public class AddCompanyDataService implements ExecutionService {

    private final CompanyRepository companyRepository;
    private final PromoCodeRepository promoCodeRepository;

    private static final Set<String> excludeParts = Set.of("go", "link", "onelink", "clck", "bit", "l", "live", "u", "shop");


    @Override
    public void execute(Long executionId) throws Exception {
        List<PromoCodeEntity> promoCodeEntities = promoCodeRepository.findAllByExecutionId(executionId);
        for (var promoCodeEntity : promoCodeEntities) {
            updatePromocodesWithCompanyData(promoCodeEntity);
        }
        promoCodeRepository.saveAll(promoCodeEntities);
    }

    private void updatePromocodesWithCompanyData(PromoCodeEntity promoCodeEntity) {
        try {
            final Optional<CompanyEntity> optionalCompany = companyRepository.findByName(promoCodeEntity.getCompanyName());

            if (optionalCompany.isPresent()) {
                var companyEntity = optionalCompany.get();
                log.info("Found company by name = {} for promocodeId = {}", companyEntity.getName(), promoCodeEntity.getId());
                promoCodeEntity.setCompanyName(companyEntity.getName());
                promoCodeEntity.setCategoryId(companyEntity.getCategoryId());
                return;
            }
            if (Objects.nonNull(promoCodeEntity.getUrl())) {
                var modifiedUrl = getMainUrlPart(promoCodeEntity.getUrl());
                log.info("Searching company by url = {}", modifiedUrl);
                var companyOpt = companyRepository.getLikeUrl(modifiedUrl);
                if (companyOpt.isPresent()) {
                    log.info("Found company by url = {} for promocodeId = {}", modifiedUrl, promoCodeEntity.getId());
                    var companyEntity = companyOpt.get();
                    promoCodeEntity.setCompanyName(companyEntity.getName());
                    promoCodeEntity.setCategoryId(companyEntity.getCategoryId());
                }
            }
        } catch (RuntimeException e) {
            log.error("Exception during setting company to promocode = {}", promoCodeEntity.getId(), e);
        }
    }

    private String getMainUrlPart(String url) {
        var replacedUrl = url.replace("www.", "").replace("https://", "");
        if (!replacedUrl.contains(".")) {
            return replacedUrl;
        }
        var parts = replacedUrl.split("\\.");
        var mainPart = parts[0];
        for (int i = 0; i < parts.length - 1; i++) {
            if (!excludeParts.contains(parts[i])) {
                mainPart = parts[i];
                break;
            }
        }
        return mainPart.trim().toLowerCase(Locale.ROOT);
    }

}
