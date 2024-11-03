package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.dao.PromoCodeEntity;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Component
@Slf4j
public class MessageContentBuilder {


    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd.MM.yyyy");

    public String build(List<PromoCodeEntity> actualPromos) {
        return generateSendMessage(actualPromos);
    }

    private String generateSendMessage(List<PromoCodeEntity> actualPromos) {
        return actualPromos.stream()
                .map(this::generateMessageText)
                .collect(Collectors.joining("\n\n"));
    }

    private String generateMessageText(PromoCodeEntity promoCodeEntity) {
        try {
            if (promoCodeEntity.getAlgVersion().equals("v1")) {
                return new StringBuilder()
                        .append("❤\uFE0F").append(promoCodeEntity.getCompanyName() == null ? "ПРОМОКОД" : "Промокод для: " + promoCodeEntity.getCompanyName())
                        .append("\n")
                        .append("\uD83C\uDF1F").append(promoCodeEntity.getShortDescription()).append("\n")
                        .append("\uD83D\uDC47\uD83C\uDFFD")
                        .append("Ссылка на сайт: ").append(promoCodeEntity.getUrl()).append("\n")
                        .append("Дата начала действия: ").append(getStartDate(promoCodeEntity.getPublishedDate())).append("\n")
                        .append("✔\uFE0F")
                        .append("Действует до: ").append(resolveDate(promoCodeEntity))
                        .toString();
            }

            if (promoCodeEntity.getAlgVersion().equals("v2")) {
                return new StringBuilder()
                        .append("❤\uFE0F").append(promoCodeEntity.getCompanyName() == null ? "ПРОМОКОД" : "Промокод для: " + promoCodeEntity.getCompanyName())
                        .append("\n")
                        .append("\uD83C\uDF1F ПРОМОКОД: ").append(promoCodeEntity.getPromoCodeValue()).append("\n")
                        .append("⚡\uFE0F")
                        .append("Описание: ").append(promoCodeEntity.getShortDescription()).append("\n")
                        .append("\uD83D\uDC47\uD83C\uDFFD")
                        .append("Ссылка на сайт: ").append(promoCodeEntity.getUrl()).append("\n")
                        .append("✔\uFE0F")
                        .append("Дата начала действия: ").append(getStartDate(promoCodeEntity.getPublishedDate())).append("\n")
                        .append("✔\uFE0F")
                        .append("Действует до: ").append(resolveDate(promoCodeEntity))
                        .toString();

            }
        } catch (RuntimeException e) {
            log.error("Exception during generating promo text", e);
        }
        return "No data found";
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

    private String getStartDate(LocalDate date) {
        if (date != null) {
            return date.format(formatter);
        }
        return StringUtils.EMPTY;
    }
}
