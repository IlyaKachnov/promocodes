package com.promocodes.promocodes.utils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FileUtils;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@Component
@RequiredArgsConstructor
@Slf4j
public class FileReaderUtils {
    private final ResourceLoader resourceLoader;

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
