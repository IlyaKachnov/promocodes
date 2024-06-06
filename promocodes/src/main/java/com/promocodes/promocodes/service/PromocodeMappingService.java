package com.promocodes.promocodes.service;

import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.entity.RawVideoDataEntity;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import com.promocodes.promocodes.dao.repository.PromoCodeRepository;
import com.promocodes.promocodes.dao.repository.RawVideoDataRepository;
import com.promocodes.promocodes.utils.YoutubeDataUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
public class PromocodeMappingService {
    private final RawVideoDataRepository rawVideoDataRepository;
    private final CompanyRepository companyRepository;
    private final PromoCodeRepository promoCodeRepository;

    private final List<String> needles = List.of("промокодом","промокоду", "промокод");

    /**
     * TODO из синхронайзд листа берем элементы из сырых данных ютуба. В неск
     *     потоков обходим список и сопостовляем текст с названиями компаний (для начала 50-100 компаний)
     *     через contains() о названию компании, если не нашли, пробуем искать по ссылке
     *     https://www.baeldung.com/string-contains-multiple-words например через contains - версия 1 алгоритма, потом можно взять
     *     более сложный алгоритм
     */
    public List<PromoCodeEntity> mapRawDataToPromocodes() {
        List<String> promocodes = rawVideoDataRepository.findAllByPromoCodeIsNotNull().stream()
                .map(RawVideoDataEntity::getPromoCode).toList();
        List<String> companyNames = ((List<CompanyEntity>) companyRepository.findAll()).stream()
                .map(CompanyEntity::getName)
                .toList();

        List<PromoCodeEntity> promoCodeEntities = new ArrayList<>();
        for (String promoCode : promocodes) {
            if (promoCode != null) {
                promoCodeEntities.add(YoutubeDataUtils.buildStringV3(promoCode, needles));
            }
        }

        return (List<PromoCodeEntity>) promoCodeRepository.saveAll(promoCodeEntities);
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
