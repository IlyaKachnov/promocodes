package com.promocodes.promocodes.service.execution;

import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.repository.PromoCodeRepository;
import com.promocodes.promocodes.utils.YoutubeDataUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("GETTING_PROMOS_V3")
@RequiredArgsConstructor
@Slf4j
public class PromocodeMappingServiceV3 implements ExecutionService {
    private final PromoCodeRepository promoCodeRepository;
    private final List<String> needles = List.of("промокодом", "промокоду", "промокод");

    @Override
    public void execute(Long executionId) throws Exception {
        final List<PromoCodeEntity> promoCodeEntities = promoCodeRepository.findAllByExecutionIdAndPromoCodeValueIsNull(executionId);
        for (var promoCodeEntity : promoCodeEntities) {
            final PromoCodeEntity createdPromo = YoutubeDataUtils.createPromoEntity(promoCodeEntity.getDescription(), needles);
            promoCodeEntity.setPromoCode(createdPromo.getPromoCode());
            promoCodeEntity.setUrl(createdPromo.getUrl());
            promoCodeEntity.setAlgVersion("v1");
        }
        promoCodeRepository.saveAll(promoCodeEntities);
    }
}
