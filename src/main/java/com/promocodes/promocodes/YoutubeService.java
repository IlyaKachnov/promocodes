package com.promocodes.promocodes;

import com.google.api.client.json.GenericJson;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.*;
import com.promocodes.promocodes.dao.PromoCodeEntity;
import com.promocodes.promocodes.dao.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class YoutubeService {
    private static final Logger log = LoggerFactory.getLogger(YoutubeService.class);
    private final YouTube youtubeApiService;
    private final PromoCodeRepository promoCodeRepository;

    public GenericJson getApi() throws IOException {
        YouTube.Channels.List request = youtubeApiService.channels().list("contentDetails");
        request.setForUsername("UCMCgOm8GZkHp8zJ6l7_hIuA");
        ChannelListResponse response = request.execute();

        String uploads = response.getItems().get(0).getContentDetails().getRelatedPlaylists().getUploads();
        YouTube.Playlists.List playlistsListRequest = youtubeApiService.playlists().list("snippet");
        return playlistsListRequest.execute();

    }

    public List<PromoCodeEntity> getApiV2() throws IOException {
        List<String> channels = List.of("UCRQPJnq3IFviqmIxb9_5FaQ", "UCeKCxQDv6lWDSzuqUXGtMRA");

        List<PromoCodeEntity> promos = new ArrayList<>();
        for (String channelId : channels) {
            promos.addAll(getPromosByChannelId(channelId));
        }
        return (List<PromoCodeEntity>) promoCodeRepository.saveAll(promos);
    }

    private List<PromoCodeEntity> getPromosByChannelId(String channelId) throws IOException {
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
        String needle = "промокод";
        String endNewline = "\n\n";
        int endIndex = 120;
        List<PromoCodeEntity> promoCodeEntities = new ArrayList<>();
        for (PlaylistItem playlistItem : itemsList) {
            PlaylistItemSnippet snippet = playlistItem.getSnippet();
            String description = snippet.getDescription();
            PromoCodeEntity promoCodeEntity = new PromoCodeEntity();
            promoCodeEntity.setDescription(description);
            promoCodeEntity.setName(snippet.getTitle());
            promoCodeEntity.setPublishedDate(snippet.getPublishedAt().toString());
            log.info("Description: {}", description);
            if (description.contains(needle)) {
                if (description.contains(endNewline) && description.indexOf(endNewline) < 250) {
                    endIndex = description.indexOf(endNewline);
                }
                if (description.length() < endIndex) {
                    endIndex = description.length() - 1;
                }
                int startIndex = description.indexOf(needle);
                String before = description.substring(0, startIndex);
                String after = description.substring(startIndex, startIndex + endIndex);
                String e = before + after;
                log.info("String with promo = {}", e);


                promoCodeEntity.setPromoCode(e);


            }
            promoCodeEntities.add(promoCodeEntity);
        }
        return promoCodeEntities;
    }

}
