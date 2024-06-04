package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.dao.PromoCodeEntity;
import com.promcodes.telegram_api.dao.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.CallbackQuery;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class CallbackQueryHandler {

    private final PromoCodeRepository promoCodeRepository;

    public BotApiMethod<?> processCallbackQuery(CallbackQuery buttonQuery) throws IOException {
        final String chatId = buttonQuery.getMessage().getChatId().toString();

        String data = buttonQuery.getData();
        List<PromoCodeEntity> promoCodeEntities = (List<PromoCodeEntity>) promoCodeRepository.findAll();

        return new SendMessage(chatId, promoCodeEntities.stream().map(PromoCodeEntity::getDescription)
                .collect(Collectors.joining("\n\n", "{", "}")));
    }
}
