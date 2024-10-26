package com.promocodes.promocodes.service.execution;

import com.promocodes.promocodes.dao.entity.CategoryEntity;
import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.repository.CategoryRepository;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import com.promocodes.promocodes.dao.repository.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Service("FILL_COMPANY_NAMES")
@RequiredArgsConstructor
@Slf4j
public class AddCompanyDataService implements ExecutionService {

    public static final String DEFAULT_VALUE = "Общие Промокоды";
    private final CompanyRepository companyRepository;
    private final PromoCodeRepository promoCodeRepository;
    private final CategoryRepository categoryRepository;

    @Override
    public void execute(Long executionId) throws Exception {
        List<PromoCodeEntity> promoCodeEntities = promoCodeRepository.findAllByExecutionId(executionId);
        List<CompanyEntity> companies = (List<CompanyEntity>) companyRepository.findAll();

        Map<Long, String> categoryMap = ((List<CategoryEntity>) categoryRepository.findAll())
                .stream().collect(Collectors.toMap(CategoryEntity::getId, CategoryEntity::getName));
        for (PromoCodeEntity promoCodeEntity : promoCodeEntities) {
            try {
                final String url = promoCodeEntity.getUrl();
                if (url == null) {
                    continue;
                }
                String segment = transformUrl(url);
                log.info("Segment with host = {}", segment);
                if (Objects.nonNull(segment)) {
                    for (CompanyEntity company : companies) {
                        if (company.getUrl() == null) {
                            log.info("Url for company = {} is null", company.getName());
                            promoCodeEntity.setCategory(DEFAULT_VALUE);
                            continue;
                        }
                        String transformedCompanyUrl = transformUrl(company.getUrl().replace("www.", ""));
                        log.debug("Comparing value = {} with segment = {}", transformedCompanyUrl, segment);
                        if (segment.equals(transformedCompanyUrl)
                                || segment.contains(transformedCompanyUrl)
                                || transformedCompanyUrl.contains(segment)) {
                            promoCodeEntity.setCompanyName(companyIfNotExists(promoCodeEntity, company.getName()));
                            promoCodeEntity.setCategory(categoryMap.getOrDefault(company.getCategoryId(), DEFAULT_VALUE));
                            break;
                        }
                        promoCodeEntity.setCompanyName(companyIfNotExists(promoCodeEntity, segment));
                        promoCodeEntity.setCategory(DEFAULT_VALUE);
                    }
                }
            } catch (RuntimeException e) {
                log.error("Exception occurred while getting company name for id = {}", promoCodeEntity.getId(), e);
            }
        }

        promoCodeRepository.saveAll(promoCodeEntities);
    }

    private String transformUrl(String url) {
        String[] segments = url.split("/");
        return segments[2];
    }

    private void getResultCompanyName(CompanyEntity company, String promoCompanyName, PromoCodeEntity promoCodeEntity, Map<Long, String> categoryMap) {
        if (company.getUrl() == null) {
            log.info("Url for company = {} is null", company.getName());
            promoCodeEntity.setCompanyName(promoCompanyName);
            promoCodeEntity.setCategory(DEFAULT_VALUE);
            return;
        }
        String transformedCompanyUrl = transformUrl(company.getUrl().replace("www.", ""));
        log.info("Comparing value = {} with segment = {}", transformedCompanyUrl, promoCompanyName);
        if (promoCompanyName.equals(transformedCompanyUrl)
                || promoCompanyName.contains(transformedCompanyUrl)
                || transformedCompanyUrl.contains(promoCompanyName)) {
            promoCodeEntity.setCompanyName(company.getName());
            promoCodeEntity.setCategory(categoryMap.getOrDefault(company.getCategoryId(), DEFAULT_VALUE));
        }
    }


    private String companyIfNotExists(PromoCodeEntity promoCodeEntity, String defaultValue) {
        return Objects.isNull(promoCodeEntity.getCompanyName()) ? defaultValue : promoCodeEntity.getCompanyName();
    }

}
