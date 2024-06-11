package com.promocodes.promocodes.utils;

import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import lombok.extern.slf4j.Slf4j;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class YoutubeDataUtils {
    public static PromoCodeEntity buildStringV1(String description, List<String> needles) {
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

    public static PromoCodeEntity buildStringV2(String description, List<String> needles) {
        String needle = needles.get(0);
        for (String needleItem : needles) {
            if (description.contains(needleItem)) {
                needle = needleItem;
                break;
            }
        }

        PromoCodeEntity promoCodeEntity = getNewLines(description, description.indexOf(needle));
        log.info("Result = {}", promoCodeEntity);
        return promoCodeEntity;
    }

    public static PromoCodeEntity buildStringV3(String description, List<String> needles) {
        String needle = needles.get(0);
        for (String needleItem : needles) {
            if (description.contains(needleItem)) {
                needle = needleItem;
                break;
            }
        }
        String str = description.replace("\n\n", "\n");
        Map<Integer, Paragraph> paragraphs = getParagraphs(str);

        Paragraph promoParagraph = getPromoParagraph(paragraphs.values(), str.indexOf(needle));
        if (promoParagraph == null) {
            return PromoCodeEntity.builder()
                    .description(str)
                    .build();
        }
        String promoUrl = findPromoUrl(paragraphs, promoParagraph);

        return PromoCodeEntity.builder()
                .promoCode(promoParagraph.getText())
                .description(str)
                .url(promoUrl)
                .build();
    }


    private static PromoCodeEntity getNewLines(String str, int promoIndex) {
        int startIndex = 0;
        int endIndex = str.indexOf("\n");
        if (endIndex == -1) {
            return PromoCodeEntity.builder()
                    .description(str)
                    .url(getUrlPart(str))
                    .build();
        }
        while (!(promoIndex >= startIndex && promoIndex < endIndex)) {
            if (startIndex == -1) {
                return PromoCodeEntity.builder()
                        .description(str)
                        .build();
            }
            startIndex = str.indexOf("\n", endIndex + 1);
            endIndex = str.indexOf("\n", startIndex + 1);
            log.info("StartIndex = {}, endIndex = {}, promoIndex = {}", startIndex, endIndex, promoIndex);

        }
        String promoStr = str.substring(startIndex, endIndex);
        String urlPart = getUrlPart(str);
        return PromoCodeEntity.builder()
                .description(str)
                .promoCode(promoStr)
                .url(urlPart)
                .build();

    }

    private static String getUrlPart(String str) {
        int httpIndex = str.indexOf("http");
        if (httpIndex == -1) {
            return "NOT_FOUND";
        }

        return str.substring(httpIndex, getEndOfUrl(str, httpIndex));
    }

    private static int getEndOfUrl(String str, int httpIndex) {
        int index = str.indexOf(" ", httpIndex);
        if (index != -1) {
            return index;
        }
        index = str.indexOf("\n", httpIndex);
        if (index != -1) {
            return index;
        }
        return str.length() - 1;
    }


    private static Map<Integer, Paragraph> getParagraphs(String str) {
        str = str.replace("\n\n", "\n");
        Map<Integer, Paragraph> paragraphs = new HashMap<>();
        int startIndex = 0;
        int endIndex = str.indexOf("\n", startIndex) == -1 ? str.length() - 1 : str.indexOf("\n", startIndex);
        int order = 1;
        while (endIndex != -1) {
            paragraphs.put(order, new Paragraph(startIndex, endIndex, str.substring(startIndex, endIndex), order));
            startIndex = endIndex + 1;
            endIndex = str.indexOf("\n", startIndex);
            order++;
        }
        return paragraphs;
    }

    private static Paragraph getPromoParagraph(Collection<Paragraph> paragraphs, int indexOfPromoCode) {
        for (Paragraph paragraph : paragraphs) {
            if (indexOfPromoCode > paragraph.getStartIndex() && indexOfPromoCode < paragraph.getEndIndex()) {
                return paragraph;
            }
        }
        return null;
    }

    public static String findPromoUrl(Map<Integer, Paragraph> paragraphs, Paragraph promoParagraph) {
        int httpIndex = promoParagraph.getText().indexOf("http");
        if (httpIndex != -1) {
            return promoParagraph.getText().substring(httpIndex, getEndOfUrl(promoParagraph.getText(), httpIndex));
        }
        int promoOrder = promoParagraph.getOrder();
        int upSearchIndex = promoOrder - 1;
        int downSearchIndex = promoOrder + 1;
        while (true) {
            log.info("Size = {}", paragraphs.size());
            if (upSearchIndex <= 0 && downSearchIndex > paragraphs.size()) {
                log.info("Not found http for string = {}", promoParagraph.getText());
                return null;
            }
            log.info("Up index = {} down index = {}", upSearchIndex, downSearchIndex);
            if (upSearchIndex > 0) {
                Paragraph paragraph = paragraphs.get(upSearchIndex);
                httpIndex = paragraph.getText().indexOf("http");
                if (httpIndex != -1) {
                    return paragraph.getText().substring(httpIndex, getEndOfUrl(paragraph.getText(), httpIndex));
                }
            }
            if (downSearchIndex < paragraphs.size()) {
                Paragraph paragraph = paragraphs.get(downSearchIndex);
                httpIndex = paragraph.getText().indexOf("http");
                if (httpIndex != -1) {
                    return paragraph.getText().substring(httpIndex, getEndOfUrl(paragraph.getText(), httpIndex));
                }
            }
            upSearchIndex--;
            downSearchIndex++;
        }
    }
}
