package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.config.ServiceProperties;
import jakarta.annotation.PostConstruct;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;

import java.util.ArrayList;
import java.util.List;

@Component
@Getter
@RequiredArgsConstructor
@Slf4j
public class ButtonParameters {

    private final ServiceProperties serviceProperties;
    private InlineKeyboardMarkup inlineKeyboardMarkup;

    @Value("${service.pilot-mode}")
    private boolean mode;

    @PostConstruct
    public void init() {

        List<InlineKeyboardButton> buttons = new ArrayList<>();
        if (mode) {
            //test mode for check parsing
            log.info("Use test mode, one button");
            var inlineKeyboardButton = new InlineKeyboardButton();
            inlineKeyboardButton.setText("Последние");
            inlineKeyboardButton.setCallbackData("Последние");
            buttons.add(inlineKeyboardButton);
            inlineKeyboardMarkup = new InlineKeyboardMarkup();
            inlineKeyboardMarkup.setKeyboard(List.of(buttons));
            return;
        }
        serviceProperties.getButtons().forEach((k, v) -> {
            var inlineKeyboardButton = new InlineKeyboardButton();
            inlineKeyboardButton.setText(v);
            inlineKeyboardButton.setCallbackData(v);
            buttons.add(inlineKeyboardButton);
        });

        inlineKeyboardMarkup = new InlineKeyboardMarkup();
        inlineKeyboardMarkup.setKeyboard(List.of(buttons));
    }
}