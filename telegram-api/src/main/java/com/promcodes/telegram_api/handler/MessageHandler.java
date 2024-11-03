package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.service.PromocodeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;

import java.util.Collections;
import java.util.concurrent.ConcurrentHashMap;

@Component
@RequiredArgsConstructor
@Slf4j
public class MessageHandler {

    private final ButtonParameters buttonParameters;
    private final ConcurrentHashMap<String, String> chatMode;
    private final PromocodeService promocodeService;
    private final MessageContentBuilder messageContentBuilder;

    public BotApiMethod<?> answerMessage(Message message) {
        String chatId = message.getChatId().toString();
        var chatModeValue = chatMode.getOrDefault(chatId, ChatMode.INPUT.toString());
        String inputText = message.getText();
        log.info("Got message  = {} chatId = {}", message.getText(), message.getChatId());
        if (inputText == null) {
            throw new IllegalArgumentException();
        }
        if (inputText.equals("/start")) {
            log.info("Call start message, chatId = {}", chatId);
            SendMessage sendMessage = new SendMessage(chatId, "Выбери одну из опций:");
            sendMessage.setReplyMarkup(buttonParameters.getInlineKeyboardMarkup());

            chatMode.put(chatId, ChatMode.INPUT.toString());
            return sendMessage;
        }
        switch (chatModeValue) {
            case ("INPUT") -> {
                log.info("Use INPUT mode for chatID = {}", chatId);
                return new SendMessage(chatId, "No hanlder defined");
            }
            case ("SEARCH") -> {
                chatMode.put(chatId, ChatMode.INPUT.toString());
                var promoCodeEntities = promocodeService.searchByCompany(inputText);
                if (CollectionUtils.isEmpty(promoCodeEntities)) {
                    return new SendMessage(chatId, "No data found");
                }
                return generateMessage(messageContentBuilder.build(promoCodeEntities), chatId);
            }
            default -> {
                log.error("No mode found for chatID = {}", chatId);
                chatMode.put(chatId, ChatMode.INPUT.toString());
                throw new IllegalArgumentException();
            }
        }
    }

    private SendMessage generateMessage(String message, String chatId) {
        SendMessage sendMessage = new SendMessage(chatId, message);
        sendMessage.setDisableWebPagePreview(true);
        return sendMessage;
    }
}
