package com.promcodes.telegram_api.dao;

import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PromoCodeRepository extends CrudRepository<PromoCodeEntity, Long> {

    List<PromoCodeEntity> findTop15ByCategoryOrderByExecutionIdDesc(String category);

    @Query("select * from promo_code where (promo_code.execution_id = :executionId) " +
            " limit :limit")
    List<PromoCodeEntity> getNPromosByExecutionId(Long executionId, Integer limit);

    @Query("select p.* from promo_code as p where lower(p.company_name) like lower(concat('%', :companyName, '%'))")
    List<PromoCodeEntity> getPromosByCompanyName(String companyName);
}
