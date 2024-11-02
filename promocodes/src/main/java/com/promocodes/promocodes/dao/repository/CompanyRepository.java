package com.promocodes.promocodes.dao.repository;

import com.promocodes.promocodes.dao.entity.CompanyEntity;
import org.springframework.data.jdbc.repository.query.Modifying;
import org.springframework.data.jdbc.repository.query.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface CompanyRepository extends CrudRepository<CompanyEntity, Long> {

    List<CompanyEntity> findAllByCategoryIdIsNull();

    Optional<CompanyEntity> findByName(String name);

    @Query("select c.* from company as c where lower(c.url) like lower(concat('%', :likeUrl, '%')) limit 1")
    Optional<CompanyEntity> getLikeUrl(@Param("likeUrl") String likeUrl);


    Optional<CompanyEntity> findByUrlIsLikeIgnoreCase(@Param("url") String url);

}
