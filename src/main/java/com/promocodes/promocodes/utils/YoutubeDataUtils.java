package com.promocodes.promocodes.utils;

public class YoutubeDataUtils {

    public static String buildString () {
        if (description.contains(needle) || description.contains(needle2)) {
            if (description.contains(endLine)) {
                endIndex = description.indexOf(endLine);
            }
            if (description.length() < endIndex) {
                endIndex = description.length() - 1;
            }
            int startIndex = description.indexOf(needle);
            String httpPart = description.substring(startIndex, endIndex);
            String after =  description.substring(endIndex, description.indexOf("\n"));
            String e = httpPart + after;
            log.info("String with promo = {}", e);
            rawVideoDataEntity.setPromoCode(e);
        }
    }
}
