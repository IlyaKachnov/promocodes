package com.promocodes.promocodes.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
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
        Document doc = Jsoup.connect("https://www.pepper.ru/merchant-list")
                .timeout(5000)
                .cookie("cookiename", "val234")
                .cookie("anothercookie", "ilovejsoup")
                .referrer("http://google.com")
                .header("headersecurity", "xyz123")
                .get();
        Elements elements = doc.select("div.tGrid-cell span.text--b");

        for (Element element : elements) {

        }
        log.info(doc.outerHtml());
        return doc.outerHtml();
    }
}
