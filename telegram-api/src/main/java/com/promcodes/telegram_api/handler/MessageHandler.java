package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.dao.PromoCodeEntity;
import com.promcodes.telegram_api.dao.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;

import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class MessageHandler {
    private final PromoCodeRepository promoCodeRepository;

    public BotApiMethod<?> answerMessage(Message message) {
        String chatId = message.getChatId().toString();

        String inputText = message.getText();

        if (inputText == null) {
            throw new IllegalArgumentException();
        } else if (inputText.equals("/start")) {
            return new SendMessage(chatId, " Привкт, напиши /promo чтобы получить все промокоды");
        } else if (inputText.equals("/promo")) {
            List<PromoCodeEntity> first10 = promoCodeRepository.findFirst10();
            return new SendMessage(chatId, first10.stream().map(PromoCodeEntity::getPromoCode)
                    .collect(Collectors.joining("\n")));
        } else {
            return new SendMessage(chatId, "не знаю такова");
        }
    }
}
