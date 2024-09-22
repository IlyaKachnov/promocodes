package com.promocodes.promocodes.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.promocodes.promocodes.api.GPTApiService;
import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.facade.StartParsingFacade;
import com.promocodes.promocodes.service.CompanyService;
import com.promocodes.promocodes.service.execution.AddCompanyDataService;
import com.promocodes.promocodes.service.execution.PromocodeMappingService;
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
    private final CompanyService companyService;
    private final PromocodeMappingService promocodeMappingService;
    private final GPTApiService gptApiService;
    private final StartParsingFacade startParsingFacade;

    private final AddCompanyDataService addCompanyDataService;

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

    @GetMapping("/add-company-data")
    public ResponseEntity<?> addCompanyData() throws Exception {
        addCompanyDataService.execute(2L);
        return ResponseEntity.ok().build();
    }

    @GetMapping("/fill-company-category")
    public ResponseEntity<List<CompanyEntity>> fillCompanyCategory() throws JsonProcessingException {
        return ResponseEntity.ok(companyService.fillCompanyWithCategory());
    }
}
