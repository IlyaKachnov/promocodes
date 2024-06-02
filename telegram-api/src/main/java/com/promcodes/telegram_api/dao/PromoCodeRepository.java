package com.promcodes.telegram_api.dao;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PromoCodeRepository extends CrudRepository<PromoCodeEntity, Long> {

    @Query("select * from promo_code limit 10")
    List<PromoCodeEntity> findFirst10();
}
