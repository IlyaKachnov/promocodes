package com.promocodes.promocodes;

import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.YouTubeRequestInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class YouTubeConfig {
    public static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();

    public static final JacksonFactory JSON_FACTORY = new JacksonFactory();

    @Bean
    public YouTube youtubeService() {
        return new YouTube.Builder(HTTP_TRANSPORT, JSON_FACTORY, request -> {
        }).setApplicationName("YoutubeVideoInfo")
                .setYouTubeRequestInitializer
                        (new YouTubeRequestInitializer("")).build();
    }
}
