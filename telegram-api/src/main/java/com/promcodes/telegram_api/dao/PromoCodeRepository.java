package com.promcodes.telegram_api.dao;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PromoCodeRepository extends CrudRepository<PromoCodeEntity, Long> {

    @Query("select * from promo_code where promo_code.promo_code is not null order by promo_code.execution_id desc limit :limit ")
    List<PromoCodeEntity> getActualPromos(Integer limit);

    @Query("select count(*) from promo_code where promo_code.execution_id = 2 group by category_id")
    int countAll();

    List<PromoCodeEntity> findTop15ByCategoryOrderByExecutionIdDesc(String category);

    @Query("select * from promo_code where (promo_code.promo_code is not null and promo_code.execution_id in (:ids)) " +
            "order by execution_id desc limit :limit")
    List<PromoCodeEntity> getLastPromos(List<Long> ids, Integer limit);
}
