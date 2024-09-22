package com.promcodes.telegram_api.dao;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

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

    @Column("promo_code")
    private String promoCode;

    @Column("url")
    private String url;

    @Column("category")
    private String category;

    @Column("created_at")
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column("execution_id")
    private Long executionId;
}
