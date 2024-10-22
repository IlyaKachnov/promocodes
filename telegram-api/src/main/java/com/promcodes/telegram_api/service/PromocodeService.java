package com.promcodes.telegram_api.service;

import com.promcodes.telegram_api.dao.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

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
        List<ExecutionEntity> executionEntityList = executionRepository.findAllByStatusIsOrderByIdDesc(ExecutionStatus.FINISHED);
        List<Long> list = executionEntityList.stream().map(ExecutionEntity::getId).toList();
        return promoCodeRepository.getLastPromos(list, limit);
    }


}
