package com.promocodes.promocodes.dao.repository;

import com.promocodes.promocodes.dao.entity.RawVideoDataEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface RawVideoDataRepository extends CrudRepository<RawVideoDataEntity, Long> {
    List<RawVideoDataEntity> findAllByPromoCodeIsNotNull();
}
