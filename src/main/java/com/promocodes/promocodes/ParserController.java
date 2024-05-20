package com.promocodes.promocodes;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/parse")
public class ParserController {
    private final ParserService parserService;

    @GetMapping
    public String getPage() throws IOException {
        return parserService.connect();
    }

}
