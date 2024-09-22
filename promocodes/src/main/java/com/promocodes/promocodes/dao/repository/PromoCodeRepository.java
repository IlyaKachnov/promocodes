package com.promocodes.promocodes.dao.repository;

import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PromoCodeRepository extends CrudRepository<PromoCodeEntity, Long> {

    @Modifying
    @Query("update Promocode p set p.category = :category where p.url =: url")
    PromoCodeEntity updatePromoCode(@Param("category") String category, @Param("url") String url);

    List<PromoCodeEntity> findAllByExecutionId(Long executionId);
}
