package com.promcodes.telegram_api.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.Map;

@ConfigurationProperties(prefix = "service")
@Getter
@Setter
public class ServiceProperties {

    private Map<String, String> buttons;
}
