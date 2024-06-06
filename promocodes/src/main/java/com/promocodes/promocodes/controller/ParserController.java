package com.promocodes.promocodes.controller;

import com.google.api.client.json.GenericJson;
import com.gptapi.response.ResponseGpt;
import com.promocodes.promocodes.api.GPTApiService;
import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import com.promocodes.promocodes.dao.entity.RawVideoDataEntity;
import com.promocodes.promocodes.service.CompanyDataParser;
import com.promocodes.promocodes.service.PromocodeMappingService;
import com.promocodes.promocodes.service.YoutubeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/parse")
public class ParserController {
    private final CompanyDataParser companyDataParser;
    private final YoutubeService youtubeService;
    private final PromocodeMappingService promocodeMappingService;
    private final GPTApiService gptApiService;

    @GetMapping
    public String getPage() throws IOException {
        return companyDataParser.connect();
    }

    @GetMapping("/youtube/v1")
    public GenericJson getYoutubePageV1() throws IOException {
        return youtubeService.getApi();
    }

    @GetMapping("/youtube")
    public List<RawVideoDataEntity> getYoutubePageV2() throws IOException {
        return youtubeService.getApiV2();
    }

    @GetMapping("/map-youtube-data")
    public List<PromoCodeEntity> mapYoutubeData() {
        return promocodeMappingService.mapRawDataToPromocodes();
    }

    @GetMapping("/get-gpt-response")
    public ResponseEntity<ResponseGpt> getGptResponse() throws IOException {
        return gptApiService.getGptResponse();
    }
}
