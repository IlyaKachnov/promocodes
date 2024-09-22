package com.promcodes.telegram_api.service;

import com.promcodes.telegram_api.dao.PromoCodeEntity;
import com.promcodes.telegram_api.dao.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class PromocodeService {
    private final PromoCodeRepository promoCodeRepository;
    private static final Integer LIMIT = 10;

    public List<PromoCodeEntity> getPromos() {
        return promoCodeRepository.getActualPromos(LIMIT);
    }

    public List<PromoCodeEntity> getPromos(Integer limit) {
        return promoCodeRepository.getActualPromos(limit);
    }

    public List<PromoCodeEntity> getPromos(String category) {
        return promoCodeRepository.findAllByCategory(category);
    }


}
