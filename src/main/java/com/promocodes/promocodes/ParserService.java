package com.promocodes.promocodes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;

@RequiredArgsConstructor
@Slf4j
@Service
public class ParserService {

    public String connect() throws IOException {
        //промокод кнопка "исключать первый заказ"
        //https://promokodus.com/campaigns/goldapple
        Document doc = Jsoup.connect("https://www.pepper.ru/coupons/ozon.ru")
                .timeout(5000)
                .cookie("cookiename", "val234")
                .cookie("anothercookie", "ilovejsoup")
                .referrer("http://google.com")
                .header("headersecurity", "xyz123")
                .get();
        Elements elements = doc.select("article .thread");
        log.info(doc.outerHtml());
        return doc.outerHtml();
    }
}
