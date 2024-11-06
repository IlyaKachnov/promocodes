package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.service.PromocodeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;

import java.util.concurrent.ConcurrentHashMap;

@Component
@RequiredArgsConstructor
@Slf4j
public class MessageHandler {

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
        switch (inputText) {
            case ("/start") -> {
                chatMode.put(chatId, ChatMode.INPUT.toString());
                log.info("Call start message, chatId = {}", chatId);
                return new SendMessage(chatId, MessageConstants.startMessageText);
            }
            case ("/new") -> {
                chatMode.put(chatId, ChatMode.INPUT.toString());
                return generateMessage(messageContentBuilder.build(promocodeService.getLast()), chatId);
            }
            case ("/search") -> {
                chatMode.put(chatId, ChatMode.SEARCH.toString());
                return generateMessage("Введите имя компании", chatId);
            }
            case ("/closesearch") -> {
                chatMode.put(chatId, ChatMode.INPUT.toString());
                return generateMessage("Поиск завершен", chatId);
            }
            default -> {
                if (ChatMode.valueOf(chatModeValue) == ChatMode.SEARCH) {
                    var promoCodeEntities = promocodeService.searchByCompany(inputText);
                    if (CollectionUtils.isEmpty(promoCodeEntities)) {
                        return new SendMessage(chatId, "По вашему запросу ничего не найдено - остановить поиск: /closesearch");
                    }
                    return generateMessage(messageContentBuilder.build(promoCodeEntities), chatId);
                }
                return new SendMessage(chatId, "Команда не найдена");
            }
        }
    }

    private SendMessage generateMessage(String message, String chatId) {
        SendMessage sendMessage = new SendMessage(chatId, message);
        sendMessage.setDisableWebPagePreview(true);
        return sendMessage;
    }
}
