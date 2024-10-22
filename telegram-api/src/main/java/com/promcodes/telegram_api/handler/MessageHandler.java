package com.promcodes.telegram_api.handler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;

@Component
@RequiredArgsConstructor
@Slf4j
public class MessageHandler {

    private final ButtonParameters buttonParameters;


    public BotApiMethod<?> answerMessage(Message message) {
        String chatId = message.getChatId().toString();

        String inputText = message.getText();
        log.info("Got message  = {} chatId = {}", message.getText(), message.getChatId());
        if (inputText == null) {
            throw new IllegalArgumentException();
        } else if (inputText.equals("/start")) {
            log.info("Call start message, chatId = {}", chatId);
            SendMessage sendMessage = new SendMessage(chatId, "Выбери одну из опций:");
            sendMessage.setReplyMarkup(buttonParameters.getInlineKeyboardMarkup());
            return sendMessage;
        } else {
            return new SendMessage(chatId, "No hanlder defined");
        }
    }
}
