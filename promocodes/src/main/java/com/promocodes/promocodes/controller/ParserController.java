package com.promocodes.promocodes.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.gptapi.response.ResponseGpt;
import com.promocodes.promocodes.api.GPTApiService;
import com.promocodes.promocodes.facade.StartParsingFacade;
import com.promocodes.promocodes.service.CompanyService;
import com.promocodes.promocodes.service.execution.PromocodeMappingService;
import com.promocodes.promocodes.service.execution.YoutubeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/parse")
public class ParserController {
    private final CompanyService companyService;
    private final YoutubeService youtubeService;
    private final PromocodeMappingService promocodeMappingService;
    private final GPTApiService gptApiService;
    private final StartParsingFacade startParsingFacade;

    @GetMapping
    public String getPage() throws IOException {
        return companyService.getCompaniesFromSite();
    }

    @GetMapping("/youtube")
    public ResponseEntity<Void> getYoutubePageV2() throws IOException {
        startParsingFacade.startParsing();
        return ResponseEntity.ok().build();
    }

    @GetMapping("/map-youtube-data")
    public ResponseEntity<Void> mapYoutubeData() throws JsonProcessingException {
        promocodeMappingService.execute(1L);
//        promocodeMappingService.fillWithCompanyNames(promoCodeEntities);
//        promocodeMappingService.fillCategoryInfo(promoCodeEntities);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/get-gpt-response")
    public ResponseEntity<ResponseGpt> getGptResponse() throws IOException {
        return gptApiService.getGptResponse();
    }

    @GetMapping("/find-company-url")
    public ResponseEntity<?> findCompanyUrl() throws IOException {
        return gptApiService.fillCompanyUrl();
    }
}
