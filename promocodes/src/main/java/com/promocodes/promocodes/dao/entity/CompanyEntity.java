package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "company")
@Data
@Builder
public class CompanyEntity {
    @Id
    private Long id;

    @Column("name")
    private String name;

    @Column("category_id")
    private Long categoryId;
}
