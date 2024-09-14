package com.promocodes.promocodes.service;

import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.PlaylistItem;
import com.google.api.services.youtube.model.PlaylistItemListResponse;
import com.google.api.services.youtube.model.PlaylistItemSnippet;
import com.google.api.services.youtube.model.PlaylistListResponse;
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
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class YoutubeService {
    private static final Logger log = LoggerFactory.getLogger(YoutubeService.class);
    private final YouTube youtubeApiService;
    private final RawVideoDataRepository rawVideoDataRepository;
    private final YoutubeChannelRepository youtubeChannelRepository;


    public List<RawVideoDataEntity> getApiV2() throws IOException {
        List<YoutubeChannelEntity> youtubeChannelEntityList = (List<YoutubeChannelEntity>) youtubeChannelRepository.findAll();
        Set<String> channels = youtubeChannelEntityList.stream().map(YoutubeChannelEntity::getChannelId).collect(Collectors.toSet());

        List<RawVideoDataEntity> promos = new ArrayList<>();
        for (String channelId : channels) {
            promos.addAll(getPromosByChannelId(channelId));
        }
        return (List<RawVideoDataEntity>) rawVideoDataRepository.saveAll(promos);
    }

    private List<RawVideoDataEntity> getPromosByChannelId(String channelId) throws IOException {
        PlaylistListResponse playlistsResponse = youtubeApiService.playlists().list("snippet")
                .setChannelId(channelId)
                .execute();

        List<String> playlistIds = new ArrayList<>();
        if (playlistsResponse.getItems() != null && !playlistsResponse.getItems().isEmpty()) {
            for (com.google.api.services.youtube.model.Playlist playlist : playlistsResponse.getItems()) {
                playlistIds.add(playlist.getId());
            }
        }
        //todo берем где больше всего items
        List<PlaylistItem> itemsList = new ArrayList<>();
        for (String playlistId : playlistIds) {
            PlaylistItemListResponse playlistItemListResponse = youtubeApiService.playlistItems()
                    .list("snippet")
                    .setPlaylistId(playlistId).setMaxResults(50L).execute();
            List<PlaylistItem> items = playlistItemListResponse.getItems();
            itemsList.addAll(items);
        }
        //TODO вынести список нидлов
        String needle = "промокод";
        String needle2 = "промо";
        List<RawVideoDataEntity> promoCodeEntities = new ArrayList<>();
        for (PlaylistItem playlistItem : itemsList) {
            PlaylistItemSnippet snippet = playlistItem.getSnippet();
            String description = snippet.getDescription();
            LocalDateTime publishedAt = LocalDateTime.parse(snippet.getPublishedAt().toString(),
                    DateTimeFormatter.ISO_DATE_TIME);
//            if (publishedAt.isBefore(LocalDateTime.now().minusMonths(2))) {
//                log.info("Video is too old = {}, published = {}", snippet.getTitle(), snippet.getPublishedAt());
//                continue;
//            }
            RawVideoDataEntity rawVideoDataEntity = RawVideoDataEntity.builder()
                    .description(description)
                    .name(snippet.getTitle())
                    .publishedDate(LocalDate.parse(snippet.getPublishedAt().toString(),
                            DateTimeFormatter.ISO_DATE_TIME))
                    .channelId(snippet.getChannelTitle())
                    .playListId(playlistItem.getId())
                    .createdAt(LocalDateTime.now())
                    .build();
            log.debug("Description: {}", description);

            if (description.contains(needle) || description.contains(needle2)) {
                rawVideoDataEntity.setPromoCode(description);
                log.info("Promocode line = {}", description);
            }
            promoCodeEntities.add(rawVideoDataEntity);
        }
        return promoCodeEntities;
    }

}
