package com.promocodes.promocodes.service;

import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class CompanyDataParser {

    private final CompanyRepository companyRepository;

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
        List<CompanyEntity> companyEntities = new ArrayList<>();
        for (Element element : elements) {
            CompanyEntity company = CompanyEntity.builder()
                    .name(element.text())
                    .categoryId(null)
                    .build();
            companyEntities.add(company);
        }
        companyRepository.saveAll(companyEntities);
        log.info(doc.outerHtml());
        return doc.outerHtml();
    }
}
