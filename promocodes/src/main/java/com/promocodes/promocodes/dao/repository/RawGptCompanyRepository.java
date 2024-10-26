package com.promocodes.promocodes.dao.repository;

import com.promocodes.promocodes.dao.entity.GptMessage;
import org.springframework.data.repository.CrudRepository;

public interface RawGptCompanyRepository extends CrudRepository<GptMessage, Long> {
}
