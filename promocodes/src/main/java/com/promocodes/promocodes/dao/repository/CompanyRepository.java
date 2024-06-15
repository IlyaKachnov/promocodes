package com.promocodes.promocodes.dao.repository;

import com.promocodes.promocodes.dao.entity.CompanyEntity;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CompanyRepository extends CrudRepository<CompanyEntity, Long> {
    @Query("select * from company limit 10 offset :offset")
    List<CompanyEntity> getFirstN(@Param("offset") Integer offset);

    @Modifying
    @Query("update company set url =:url where name = :name")
    Optional<CompanyEntity> updateCompany(@Param("url") String url, @Param("name") String name);
}
