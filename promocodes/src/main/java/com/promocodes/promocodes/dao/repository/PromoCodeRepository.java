package com.promocodes.promocodes.dao.repository;

import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PromoCodeRepository extends CrudRepository<PromoCodeEntity, Long> {

    List<PromoCodeEntity> findAllByExecutionId(Long executionId);

    List<PromoCodeEntity> findAllByExecutionIdAndPromoCodeValueIsNull(Long executionId);
}
