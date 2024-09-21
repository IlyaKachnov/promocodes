package com.promocodes.promocodes.service.execution;

import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.ChannelListResponse;
import com.google.api.services.youtube.model.PlaylistItem;
import com.google.api.services.youtube.model.PlaylistItemListResponse;
import com.google.api.services.youtube.model.PlaylistItemSnippet;
import com.promocodes.promocodes.dao.entity.RawVideoDataEntity;
import com.promocodes.promocodes.dao.entity.YoutubeChannelEntity;
import com.promocodes.promocodes.dao.repository.RawVideoDataRepository;
import com.promocodes.promocodes.dao.repository.YoutubeChannelRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@Service("PARSE_RAW_DATA")
@RequiredArgsConstructor
public class YoutubeService implements ExecutionService {
    private static final Logger log = LoggerFactory.getLogger(YoutubeService.class);
    //todo move to config file
    public static final long RESULTS = 5L;
    private final YouTube youtubeApiService;
    private final RawVideoDataRepository rawVideoDataRepository;
    private final YoutubeChannelRepository youtubeChannelRepository;

    private static final Set<String> needls = Set.of("промокод", "промо");


    public void execute(Long executionId) throws Exception {
        log.info("Start getting video data");
        List<YoutubeChannelEntity> channelEntities = (List<YoutubeChannelEntity>) youtubeChannelRepository.findAll();
        List<RawVideoDataEntity> promos = new ArrayList<>();
        for (YoutubeChannelEntity channel : channelEntities) {
            log.info("Getting data for channel name = {}, id = {}", channel.getName(), channel.getChannelId());
            promos.addAll(getPromosByChannelId(channel.getChannelId(), executionId));
        }
        rawVideoDataRepository.saveAll(promos);

    }

    private List<RawVideoDataEntity> getPromosByChannelId(String channelId, Long executionId) throws IOException {
        log.info("Query youtube API for channel id = {}", channelId);
        final ChannelListResponse channelListResponse = youtubeApiService.channels().list("snippet").setId(channelId)
                .setPart("contentDetails")
                .execute();
        final String uploadsPlaylistId = channelListResponse.getItems().get(0).getContentDetails().getRelatedPlaylists().getUploads();
        log.info("Getting data for channel id = {}, uploadsPlaylistId = {}", channelId, uploadsPlaylistId);
        final PlaylistItemListResponse playlistItemListResponse = youtubeApiService.playlistItems()
                .list("snippet")
                .setPlaylistId(uploadsPlaylistId).setMaxResults(RESULTS).execute();
        final List<PlaylistItem> items = playlistItemListResponse.getItems();
        log.info("Getting items = {}, size = {}", items, items.size());
        List<RawVideoDataEntity> promoCodeEntities = new ArrayList<>();
        for (PlaylistItem playlistItem : items) {
            final PlaylistItemSnippet snippet = playlistItem.getSnippet();
            final String description = snippet.getDescription();
            log.debug("Description: {}", description);
            RawVideoDataEntity rawVideoDataEntity = RawVideoDataEntity.builder()
                    .description(description)
                    .name(snippet.getTitle())
                    .publishedDate(LocalDate.parse(snippet.getPublishedAt().toString(),
                            DateTimeFormatter.ISO_DATE_TIME))
                    .channelName(snippet.getChannelTitle())
                    .channelId(channelId)
                    .playListId(playlistItem.getId())
                    .createdAt(LocalDateTime.now())
                    .executionId(executionId)
                    .build();

            boolean match = needls.stream().anyMatch(description::contains);
            if (match) {
                rawVideoDataEntity.setPromoCode(description);
                log.info("Promocode line = {}", description);
            }
            promoCodeEntities.add(rawVideoDataEntity);
        }
        return promoCodeEntities;
    }
}
