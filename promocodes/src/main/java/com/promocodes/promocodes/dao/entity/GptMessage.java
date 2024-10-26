package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "gpt_message")
@Data
@Builder
public class GptMessage {
    @Id
    private Long id;

    @Column("data")
    private String data;

    @Column("request")
    private String request;
}
