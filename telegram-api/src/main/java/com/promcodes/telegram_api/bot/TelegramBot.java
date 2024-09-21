package com.promcodes.telegram_api.bot;

import com.promcodes.telegram_api.handler.CallbackQueryHandler;
import com.promcodes.telegram_api.handler.MessageHandler;
import lombok.Setter;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.updates.SetWebhook;
import org.telegram.telegrambots.meta.api.objects.CallbackQuery;
import org.telegram.telegrambots.meta.api.objects.Message;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;
import org.telegram.telegrambots.starter.SpringWebhookBot;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
@Setter
public class TelegramBot extends SpringWebhookBot {

    private MessageHandler messageHandler;
    private CallbackQueryHandler callbackQueryHandler;
    private String botPath;
    private String botUsername;
    private String botToken;

    public TelegramBot(SetWebhook setWebhook, MessageHandler messageHandler,
                       CallbackQueryHandler callbackQueryHandler) {
        super(setWebhook);
        this.messageHandler = messageHandler;
        this.callbackQueryHandler = callbackQueryHandler;
    }



    @Override
    public BotApiMethod<?> onWebhookUpdateReceived(Update update) {
        try {
            return handleUpdate(update);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public String getBotPath() {
        return "";
    }


    private BotApiMethod<?> handleUpdate(Update update) throws IOException {
        if (update.hasCallbackQuery()) {
            CallbackQuery callbackQuery = update.getCallbackQuery();
            return callbackQueryHandler.processCallbackQuery(callbackQuery);
        } else {
            Message message = update.getMessage();
            if (message != null) {
                return messageHandler.answerMessage(update.getMessage());
            }
        }
        return null;
    }

    @Override
    public String getBotUsername() {
        return "";
    }


}
