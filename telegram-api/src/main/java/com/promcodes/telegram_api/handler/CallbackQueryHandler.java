package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.dao.PromoCodeEntity;
import com.promcodes.telegram_api.dao.PromoCodeRepository;
import com.promcodes.telegram_api.service.PromocodeService;
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

    private final PromocodeService promocodeService;

    public BotApiMethod<?> processCallbackQuery(CallbackQuery buttonQuery) {
        final String chatId = buttonQuery.getMessage().getChatId().toString();
        String data = buttonQuery.getData();
        return generateMessage(generateSendMessage(promocodeService.getPromos(data)), chatId);
    }

    private SendMessage generateMessage(String message, String chatId) {
        SendMessage sendMessage = new SendMessage(chatId, message);
        sendMessage.setDisableWebPagePreview(true);
        return sendMessage;
    }

    private String generateSendMessage(List<PromoCodeEntity> actualPromos) {
        return actualPromos.stream()
                .map(this::generateMessageText)
                .collect(Collectors.joining("\n\n"));
    }

    private String generateMessageText(PromoCodeEntity promoCodeEntity) {
        return new StringBuilder()
                .append("❤\uFE0F").append(promoCodeEntity.getCompanyName() == null ? "ПРОМОКОД" : promoCodeEntity.getCompanyName())
                .append("\n")
                .append("\uD83C\uDF1F").append(promoCodeEntity.getPromoCode()).append("\n")
                .append("\uD83D\uDC47\uD83C\uDFFD")
                .append("Ссылка на сайт:").append(promoCodeEntity.getUrl())
                .toString();
    }
}
