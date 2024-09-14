package com.promocodes.promocodes.utils;

import com.promocodes.promocodes.dao.entity.PromoCodeEntity;
import lombok.extern.slf4j.Slf4j;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
public class YoutubeDataUtils {

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
                .createdAt(LocalDateTime.now())
                .build();
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
