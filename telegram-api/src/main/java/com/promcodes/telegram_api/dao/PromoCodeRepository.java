package com.promcodes.telegram_api.dao;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PromoCodeRepository extends CrudRepository<PromoCodeEntity, Long> {

    @Query("select * from promo_code where promo_code.promo_code is not null limit 10")
    List<PromoCodeEntity> findFirst100();
}
