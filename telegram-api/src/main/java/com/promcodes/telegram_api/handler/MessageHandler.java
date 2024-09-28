package com.promcodes.telegram_api.handler;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;

import java.util.ArrayList;
import java.util.List;

@Component
@RequiredArgsConstructor
@Slf4j
public class MessageHandler {

    private final static InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();

    static {
        InlineKeyboardButton inlineKeyboardButton4 = new InlineKeyboardButton();
        inlineKeyboardButton4.setText("Получить последние 15");
        inlineKeyboardButton4.setCallbackData("Последние 15");
        List<InlineKeyboardButton> keyboardButtonsRow4 = new ArrayList<>();
        keyboardButtonsRow4.add(inlineKeyboardButton4);
        List<List<InlineKeyboardButton>> rowList = new ArrayList<>();
        rowList.add(keyboardButtonsRow4);
        inlineKeyboardMarkup.setKeyboard(rowList);
    }


    public BotApiMethod<?> answerMessage(Message message) {
        String chatId = message.getChatId().toString();

        String inputText = message.getText();
        log.info("Got message  = {} chatId = {}", message.getText(), message.getChatId());
        if (inputText == null) {
            throw new IllegalArgumentException();
        } else if (inputText.equals("/start")) {
            log.info("Call start message, chatId = {}", chatId);
            SendMessage sendMessage = new SendMessage(chatId, "Выбери одну из опций:");
            sendMessage.setReplyMarkup(inlineKeyboardMarkup);
            return sendMessage;
        } else {
            return new SendMessage(chatId, "No hanlder defined");
        }
    }
}
