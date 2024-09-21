package com.promocodes.promocodes.dao.entity;

import lombok.Builder;
import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Table(name = "raw_video_data", schema = "public")
@Data
@Builder
public class RawVideoDataEntity {
    @Id
    private Long id;

    @Column("promo_code")
    private String promoCode;

    @Column("name")
    private String name;

    @Column("description")
    private String description;

    @Column("channel_id")
    private String channelId;

    @Column("channel_name")
    private String channelName;

    @Column("play_list_id")
    private String playListId;

    @Column("published_date")
    private LocalDate publishedDate;

    @Column("created_at")
    private LocalDateTime createdAt = LocalDateTime.now();
}
