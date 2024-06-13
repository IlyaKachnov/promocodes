package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table("access_token")
@Data
@Builder
public class AccessTokenEntity {
    @Id
    private Long id;

    @Column("token")
    private String token;

    @Column("expires_at")
    private Long expiresAt;
}
