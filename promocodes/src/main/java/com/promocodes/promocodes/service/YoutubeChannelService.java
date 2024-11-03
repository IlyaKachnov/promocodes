package com.promocodes.promocodes.service;

import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.ChannelListResponse;
import com.promocodes.promocodes.dao.repository.YoutubeChannelRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
@RequiredArgsConstructor
@Slf4j
public class YoutubeChannelService {
    private final YoutubeChannelRepository youtubeChannelRepository;
    private final YouTube youtubeApiService;

    public void getChannels() throws IOException {
        var videoListResponse = youtubeApiService.videos().list("snippet").setChart("mostPopular").set("regionCode", "RU")
                .setMaxResults(50L).execute();

        var items = videoListResponse.getItems();
        for (var item : items) {
            var channelId = item.getSnippet().getChannelId();
            final ChannelListResponse channelListResponse = youtubeApiService.channels()
                    .list("snippet")
                    .setId(channelId)
                    .setPart("contentDetails")
                    .setPart("snippet")
                    .setMaxResults(50L)
                    .execute();
            var channelList = channelListResponse.getItems();
            for (var channel : channelList) {
                log.info("Channel: {}", channel.getSnippet().getTitle());
            }
        }
        log.info("1");
    }
}
