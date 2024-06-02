package com.promcodes.telegram_api.config;

import com.promcodes.telegram_api.bot.TelegramBot;
import com.promcodes.telegram_api.handler.CallbackQueryHandler;
import com.promcodes.telegram_api.handler.MessageHandler;
import lombok.Getter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.telegram.telegrambots.meta.api.methods.updates.SetWebhook;

@Configuration
@Getter
public class TelegramApiConfig {

    @Value("${telegram.webhook-path}")
    private String webhookPath;
    @Value("${telegram.bot-name}")
    private String botName;
    @Value("${telegram.bot-token}")
    private String botToken;

    @Bean
    public SetWebhook setWebhookInstance() {
        return SetWebhook.builder().url(webhookPath).build();
    }

    @Bean
    public TelegramBot springWebhookBot(SetWebhook setWebhook,
                                        MessageHandler messageHandler,
                                        CallbackQueryHandler callbackQueryHandler) {
        TelegramBot bot = new TelegramBot(setWebhook, messageHandler, callbackQueryHandler);

        bot.setBotPath(webhookPath);
        bot.setBotUsername(botName);
        bot.setBotToken(botToken);
        return bot;
    }

}
