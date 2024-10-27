package com.promocodes.promocodes.utils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

@Component
@RequiredArgsConstructor
@Slf4j
public class FileReaderUtils {
    private final ResourceLoader resourceLoader;
    private final static String PROMPT_FOLDER = "classpath:prompts/";
    private final static String PROMPTS = "prompts/";

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

    public String getResource(String fileName) {
        try {
            ClassPathResource classPathResource = new ClassPathResource(PROMPTS + fileName);
            byte[] binaryData = FileCopyUtils.copyToByteArray(classPathResource.getInputStream());
            return new String(binaryData, StandardCharsets.UTF_8);
        } catch (IOException e) {
            log.error(e.getMessage());
            return null;
        }
    }
}
