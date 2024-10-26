package com.promcodes.telegram_api.dao;

import org.springframework.data.repository.CrudRepository;

import java.util.List;
import java.util.Optional;

public interface ExecutionRepository extends CrudRepository<ExecutionEntity, Long> {
    List<ExecutionEntity> findAllByStatusIsOrderByIdDesc(ExecutionStatus status);

    Optional<ExecutionEntity> findFirstByStatusIsOrderByIdDesc(ExecutionStatus status);
}
