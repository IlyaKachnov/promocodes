package com.promocodes.promocodes.utils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;

@Component
@RequiredArgsConstructor
@Slf4j
public class FileReaderUtils {
    private final ResourceLoader resourceLoader;
    private final static String PROMPT_FOLDER = "classpath:prompts/";

    public String readFromFile(String fileName) {
        try {
            Resource resource = resourceLoader.getResource(PROMPT_FOLDER + fileName);
            if (resource.exists()) {
                return Files.readString(resource.getFile().toPath());
            }
        } catch (IOException e) {
            log.error(e.getMessage());
            return null;
        }
        return null;
    }

    public String readFromFile() {
        try {
            Resource resource = resourceLoader.getResource("classpath:prompts/company_to_url");
            if (resource.exists()) {
                return Files.readString(resource.getFile().toPath());
            }
        } catch (IOException e) {
            log.error(e.getMessage());
            return null;
        }
        return null;
    }
}
