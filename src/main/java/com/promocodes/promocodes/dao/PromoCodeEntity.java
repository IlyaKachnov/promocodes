package com.promocodes.promocodes.dao;

import jakarta.annotation.Generated;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;

@Table(name = "promo_code", schema = "public")
@Data
public class PromoCodeEntity {
    @Id
    private Long id;

    @Column("promo_code")
    private String promoCode;

    @Column("name")
    private String name;

    @Column("description")
    private String description;

    @Column("published_date")
    private String publishedDate;
}
