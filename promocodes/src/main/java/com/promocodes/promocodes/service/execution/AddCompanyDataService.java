package com.promocodes.promocodes.service.execution;

import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import com.promocodes.promocodes.dao.repository.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Locale;
import java.util.Objects;

@Service("FILL_COMPANY_NAMES")
@RequiredArgsConstructor
@Slf4j
public class AddCompanyDataService implements ExecutionService {

    private final CompanyRepository companyRepository;
    private final PromoCodeRepository promoCodeRepository;

    @Override
    public void execute(Long executionId) throws Exception {
        List<PromoCodeEntity> promoCodeEntities = promoCodeRepository.findAllByExecutionId(executionId);
        List<CompanyEntity> companies = (List<CompanyEntity>) companyRepository.findAll();
        for (PromoCodeEntity promoCodeEntity : promoCodeEntities) {
            try {
                final String url = promoCodeEntity.getUrl();
                if (url == null) {
                    continue;
                }
                String segment = transformUrl(url);
                log.info("Segment with host = {}", segment);
                if (Objects.nonNull(segment)) {
                    promoCodeEntity.setCompanyName(segment.toUpperCase(Locale.ROOT));
                    for (CompanyEntity company : companies) {
                        promoCodeEntity.setCompanyName(getResultCompanyName(company, segment));
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

    private String getResultCompanyName(CompanyEntity company, String promoCompanyName) {
        if (company.getUrl() == null) {
            log.info("Url for company = {} is null", company.getName());
            return promoCompanyName;
        }
        String transformedCompanyUrl = transformUrl(company.getUrl().replace("www.", ""));
        log.info("Comparing value = {} with segment = {}", transformedCompanyUrl, promoCompanyName);
        if (promoCompanyName.equals(transformedCompanyUrl)
                || promoCompanyName.contains(transformedCompanyUrl)
                || transformedCompanyUrl.contains(promoCompanyName)) {
            return company.getName();
        }
        return promoCompanyName;
    }

//    private String splitByDot(String url) {
//        String[] segments = url.split("\\.");
//        return
//    }
}
