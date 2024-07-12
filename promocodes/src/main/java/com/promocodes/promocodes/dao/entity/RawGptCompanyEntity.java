package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "raw_gpt_company")
@Data
@Builder
public class RawGptCompanyEntity {
    @Id
    private Long id;

    @Column("data")
    private String data;
}
