package com.promcodes.telegram_api.dao;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDateTime;
import java.util.Objects;

@Table(name = "execution")
@Getter
@Setter
public class ExecutionEntity {
    @Id
    private Long id;

    @Column("created_at")
    private LocalDateTime createdAt;

    @Column("status")
    private ExecutionStatus status;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ExecutionEntity that)) return false;
        return Objects.equals(id, that.id) && status == that.status;
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, status);
    }
}
