package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Data
@Builder
@Table("promo_code")
public class PromoCodeEntity {
    @Id
    private Long id;

    @Column("description")
    private String description;

    @Column("company_name")
    private String companyName;
}
