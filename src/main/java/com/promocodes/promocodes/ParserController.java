package com.promocodes.promocodes;

import com.google.api.client.json.GenericJson;
import com.google.api.services.youtube.model.PlaylistItemSnippet;
import com.promocodes.promocodes.dao.PromoCodeEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/parse")
public class ParserController {
    private final ParserService parserService;
    private final YoutubeService youtubeService;

    @GetMapping
    public String getPage() throws IOException {
        return parserService.connect();
    }

    @GetMapping("/youtube/v1")
    public GenericJson getYoutubePageV1() throws IOException {
        return youtubeService.getApi();
    }

    @GetMapping("/youtube")
    public List<PromoCodeEntity> getYoutubePageV2() throws IOException {
        return youtubeService.getApiV2();
    }

}
