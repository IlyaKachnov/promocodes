package com.promcodes.telegram_api.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.ConcurrentHashMap;

@Configuration
public class ChatParamsConfig {


    //todo ограниченное рещение, нужен кэш типа редиса
    @Bean
    public ConcurrentHashMap<String, String> chatMode() {
        return new ConcurrentHashMap<>();
    }
}
