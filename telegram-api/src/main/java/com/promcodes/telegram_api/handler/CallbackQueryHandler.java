package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.dao.PromoCodeEntity;
import com.promcodes.telegram_api.service.PromocodeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.CallbackQuery;

import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
@Slf4j
public class CallbackQueryHandler {

    private final PromocodeService promocodeService;

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");


    public BotApiMethod<?> processCallbackQuery(CallbackQuery buttonQuery) {
        final String chatId = buttonQuery.getMessage().getChatId().toString();
        String data = buttonQuery.getData();
        log.info("Call button with data = {}", data);
        if (data.equals("Последние")) {
            return generateMessage(generateSendMessage(promocodeService.getLastNPromos(100)), chatId);
        }

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
        if (promoCodeEntity.getAlgVersion().equals("v1")) {
            return new StringBuilder()
                    .append("❤\uFE0F").append(promoCodeEntity.getCompanyName() == null ? "ПРОМОКОД" : "Промокод для:" + promoCodeEntity.getCompanyName())
                    .append("\n")
                    .append("\uD83C\uDF1F").append(promoCodeEntity.getPromoCode()).append("\n")
                    .append("\uD83D\uDC47\uD83C\uDFFD")
                    .append("Ссылка на сайт: ").append(promoCodeEntity.getUrl()).append("\n")
                    .append("Дата начала действия: ").append(resolveDate(promoCodeEntity))
                    .toString();
        }
        if (promoCodeEntity.getAlgVersion().equals("v2")) {
            return new StringBuilder()
                    .append("❤\uFE0F").append(promoCodeEntity.getCompanyName() == null ? "ПРОМОКОД" : "Промокод для: " + promoCodeEntity.getCompanyName())
                    .append("\n")
                    .append("\uD83C\uDF1F ПРОМОКОД: ").append(promoCodeEntity.getPromoCodeValue()).append("\n")
                    .append("\uD83D\uDC47\uD83C\uDFFD")
                    .append("Ссылка на сайт: ").append(promoCodeEntity.getUrl()).append("\n")
                    .append("✔\uFE0F")
                    .append("Срок действия: ").append(resolveDate(promoCodeEntity))
                    .toString();

        }
        return "";
    }

    private String resolveDate(PromoCodeEntity promoCodeEntity) {
        if (promoCodeEntity.getExpiresAt() != null) {
            return promoCodeEntity.getExpiresAt();
        }

        if (promoCodeEntity.getPublishedDate() != null) {
            return promoCodeEntity.getPublishedDate().plusMonths(1).format(formatter);
        }
        return StringUtils.EMPTY;
    }
}
