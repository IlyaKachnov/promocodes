package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "category")
@Data
@Builder
public class CategoryEntity {
    @Id
    private Long id;

    @Column("name")
    private String name;
}
