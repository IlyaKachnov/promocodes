package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.config.ServiceProperties;
import jakarta.annotation.PostConstruct;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;

import java.util.ArrayList;
import java.util.List;

@Component
@Getter
@RequiredArgsConstructor
public class ButtonParameters {

    private final ServiceProperties serviceProperties;
    private InlineKeyboardMarkup inlineKeyboardMarkup;

    @PostConstruct
    public void init() {
        List<InlineKeyboardButton> buttons = new ArrayList<>();
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
