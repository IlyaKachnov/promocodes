package com.promcodes.telegram_api.dao;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PromoCodeRepository extends CrudRepository<PromoCodeEntity, Long> {

    @Query("select * from promo_code where promo_code.promo_code is not null order by promo_code.execution_id desc limit :limit ")
    List<PromoCodeEntity> getActualPromos(Integer limit);
}
