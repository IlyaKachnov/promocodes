package com.promocodes.promocodes.dao.repository;

import com.promocodes.promocodes.dao.entity.AccessTokenEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface AccessTokenRepository extends CrudRepository<AccessTokenEntity, Long> {
    Optional<AccessTokenEntity> findFirstByOrderByExpiresAtDesc();
}
