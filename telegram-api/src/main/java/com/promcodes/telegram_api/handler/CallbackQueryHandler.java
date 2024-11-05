package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.service.PromocodeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.CallbackQuery;

import java.util.concurrent.ConcurrentHashMap;

@Component
@RequiredArgsConstructor
@Slf4j
public class CallbackQueryHandler {

    private final PromocodeService promocodeService;

    private final ConcurrentHashMap<String, String> chatMode;
    private final MessageContentBuilder messageContentBuilder;
    private final ButtonParameters buttonParameters;


    public BotApiMethod<?> processCallbackQuery(CallbackQuery buttonQuery) {
        final String chatId = buttonQuery.getMessage().getChatId().toString();
        String data = buttonQuery.getData();
        log.info("Call button with data = {}", data);
        switch (data) {
            case ("Последние") -> {
                chatMode.put(chatId, ChatMode.INPUT.toString());
                var sendMessage = generateMessage(messageContentBuilder.build(promocodeService.getLastNPromos(10)), chatId);
                sendMessage.setReplyMarkup(buttonParameters.getInlineKeyboardMarkup());
                return sendMessage;
            }
            case ("search") -> {
                chatMode.put(chatId, ChatMode.SEARCH.toString());
                return generateMessage("Введите имя компании", chatId);
            }
            case ("close-search") -> {
                chatMode.put(chatId, ChatMode.INPUT.toString());
                var sendMessage = generateMessage("Выбери одну из опций:", chatId);
                sendMessage.setReplyMarkup(buttonParameters.getInlineKeyboardMarkup());
                return sendMessage;
            }
            default -> log.error("No handler for button found = {}, chatId= {}", buttonQuery.getData(), chatId);
        }
        return generateMessage("No handler for button found", chatId);
    }

    private SendMessage generateMessage(String message, String chatId) {
        SendMessage sendMessage = new SendMessage(chatId, message);
        sendMessage.setDisableWebPagePreview(true);
        return sendMessage;
    }
}
