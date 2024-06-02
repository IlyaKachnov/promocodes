package com.promocodes.promocodes.dao.entity;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.relational.core.mapping.Column;
import org.springframework.data.relational.core.mapping.Table;

@Table(name = "youtube_channel")
@Data
public class YoutubeChannelEntity {
    @Id
    private Long id;

    @Column("name")
    private String name;

    @Column("channel_id")
    private String channelId;
}
