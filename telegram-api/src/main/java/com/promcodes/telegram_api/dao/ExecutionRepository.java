package com.promcodes.telegram_api.dao;

import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ExecutionRepository extends CrudRepository<ExecutionEntity, Long> {
    List<ExecutionEntity> findAllByStatusIsOrderByIdDesc(ExecutionStatus status);
}
