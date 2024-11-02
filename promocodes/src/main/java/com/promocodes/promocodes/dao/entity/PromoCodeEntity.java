package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Objects;

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

    @Column("category_id")
    private Long categoryId;

    @Column("published_date")
    private LocalDate publishedDate;

    @Column("expires_at")
    private String expiresAt;

    @Column("promo_code_value")
    private String promoCodeValue;

    @Column("alg_version")
    private String algVersion;

    @Column("gpt_message")
    private String gptMessage;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof PromoCodeEntity that)) return false;
        return Objects.equals(id, that.id) && Objects.equals(description, that.description) && Objects.equals(companyName, that.companyName) && Objects.equals(promoCode, that.promoCode) && Objects.equals(url, that.url) && Objects.equals(category, that.category) && Objects.equals(executionId, that.executionId) && Objects.equals(publishedDate, that.publishedDate) && Objects.equals(expiresAt, that.expiresAt) && Objects.equals(promoCodeValue, that.promoCodeValue) && Objects.equals(algVersion, that.algVersion) && Objects.equals(gptMessage, that.gptMessage);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, description, companyName, promoCode, url, category, executionId, publishedDate, expiresAt, promoCodeValue, algVersion, gptMessage);
    }

    @Override
    public String toString() {
        return "PromoCodeEntity{" +
                "id=" + id +
                ", description='" + description + '\'' +
                ", companyName='" + companyName + '\'' +
                ", promoCode='" + promoCode + '\'' +
                ", url='" + url + '\'' +
                ", category='" + category + '\'' +
                ", createdAt=" + createdAt +
                ", executionId=" + executionId +
                ", publishedDate=" + publishedDate +
                ", expiresAt='" + expiresAt + '\'' +
                ", promoCodeValue='" + promoCodeValue + '\'' +
                ", algVersion='" + algVersion + '\'' +
                ", gptMessage='" + gptMessage + '\'' +
                '}';
    }
}
