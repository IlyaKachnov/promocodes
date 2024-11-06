package com.promcodes.telegram_api.service;

import com.promcodes.telegram_api.dao.ExecutionRepository;
import com.promcodes.telegram_api.dao.ExecutionStatus;
import com.promcodes.telegram_api.dao.PromoCodeEntity;
import com.promcodes.telegram_api.dao.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Locale;

@Service
@RequiredArgsConstructor
@Slf4j
public class PromocodeService {
    private final PromoCodeRepository promoCodeRepository;
    private final ExecutionRepository executionRepository;


    public List<PromoCodeEntity> getPromos(String category) {
        return promoCodeRepository.findTop15ByCategoryOrderByExecutionIdDesc(category);
    }

    public List<PromoCodeEntity> getLastNPromos(Integer limit) {
        final var executionEntity = executionRepository.findFirstByStatusIsOrderByIdDesc(ExecutionStatus.FINISHED);
        if (executionEntity.isEmpty()) {
            return Collections.emptyList();
        }
        return promoCodeRepository.getNPromosByExecutionId(executionEntity.get().getId(), limit);
    }

    public List<PromoCodeEntity> getLast() {
        return promoCodeRepository.findTop15ByOrderByExecutionIdDesc();
    }

    public List<PromoCodeEntity> searchByCompany(String company) {
        var searchString = company.trim().toLowerCase(Locale.ROOT);
        return promoCodeRepository.getPromosByCompanyNameV2(searchString);
    }
}
