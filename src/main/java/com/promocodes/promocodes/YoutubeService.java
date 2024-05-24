package com.promocodes.promocodes;

import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.GenericJson;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.*;
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
    private final YouTube youtubeService;

    public GenericJson getApi() throws IOException {
        YouTube.Channels.List request = youtubeService.channels().list("contentDetails");
        request.setForUsername("UCMCgOm8GZkHp8zJ6l7_hIuA");
        ChannelListResponse response = request.execute();

        String uploads = response.getItems().get(0).getContentDetails().getRelatedPlaylists().getUploads();
        YouTube.Playlists.List playlistsListRequest = youtubeService.playlists().list("snippet");
        return playlistsListRequest.execute();

    }

    public List<String> getApiV2() throws IOException {
        List<String> channels = List.of("UCRQPJnq3IFviqmIxb9_5FaQ", "UCeKCxQDv6lWDSzuqUXGtMRA");

        List<String> promos = new ArrayList<>();
        for (String channelId : channels) {
            promos.addAll(getPromosByChannelId(channelId));
        }
        return promos;
    }

    private List<String> getPromosByChannelId(String channelId) throws IOException {
        PlaylistListResponse playlistsResponse = youtubeService.playlists().list("snippet")
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
            PlaylistItemListResponse playlistItemListResponse = youtubeService.playlistItems()
                    .list("snippet")
                    .setPlaylistId(playlistId).execute();
            List<PlaylistItem> items = playlistItemListResponse.getItems();
            itemsList.addAll(items);
        }
        String needle = "промокод";
        String endNewline = "\n\n";
        int endIndex = 120;
        List<String> descWithPromos = new ArrayList<>();
        for (PlaylistItem playlistItem : itemsList) {
            PlaylistItemSnippet snippet = playlistItem.getSnippet();
            String description = snippet.getDescription();
            log.info("Description: {}", description);
            if (description.contains(needle)) {
                if (description.contains(endNewline)) {
                    endIndex = description.indexOf(endNewline);
                }
                int startIndex = description.indexOf(needle);
                String before = description.substring(0, startIndex);
                String after = description.substring(startIndex, endIndex);
                String e = before + after;
                log.info("String with promo = {}", e);
                descWithPromos.add(e);
            }

        }
        return descWithPromos;
    }

}
