package com.promocodes.promocodes.utils;

import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
public class YoutubeDataUtils {
    public static PromoCodeEntity buildString(String description, List<String> needles) {
        String needle = needles.get(0);
        for (String needleItem : needles) {
            if (description.contains(needleItem)) {
                needle = needleItem;
                break;
            }
        }
        if (description.contains(needle)) {
            String partAfterNeedle = description.substring(description.indexOf(needle) + needle.length() + 1, description.length() - 1);
            String promo = partAfterNeedle.substring(0, partAfterNeedle.contains(" ") ? partAfterNeedle.indexOf(" ") : partAfterNeedle.length() - 1);
            String partFromNeedle = description.substring(description.indexOf(needle), description.length() - 1);
            if (!partFromNeedle.contains("http")) {
                String promoCodeDesc = partFromNeedle.substring(0, partFromNeedle.contains("\n") ? partFromNeedle.indexOf("\n") : partFromNeedle.length() - 1);
                log.info("Result = {}", promoCodeDesc);
                return PromoCodeEntity.
                        builder()
                        .description(promoCodeDesc)
                        .promoCode(promo)
                        .build();
            }
            String partFromNeedleToHttp = partFromNeedle.substring(0, partFromNeedle.indexOf("http"));
            String partFromHttp = partFromNeedle.substring(partFromNeedle.indexOf("http"), partFromNeedle.length() - 1);
            String urlPart = partFromHttp.substring(0, partFromHttp.contains(" ") ? partFromHttp.indexOf(" ") : partFromHttp.length() - 1);

            String result = partFromNeedleToHttp + partFromNeedleToHttp + urlPart;
            log.info("Result = {}", result);
            return PromoCodeEntity.builder()
                    .description(result)
                    .promoCode(promo)
                    .url(urlPart)
                    .build();
        }
        return PromoCodeEntity.builder()
                .description(description)
                .build();
    }
}
