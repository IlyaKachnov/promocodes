package com.promocodes.promocodes.service;

import com.promocodes.promocodes.dao.entity.CompanyEntity;
import com.promocodes.promocodes.dao.repository.CompanyRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@RequiredArgsConstructor
@Slf4j
@Service
public class CompanyService {
    private final DataParser dataParser;
    private final CompanyRepository companyRepository;

    public String getCompaniesFromSite() throws IOException {
        //промокод кнопка "исключать первый заказ"
        //https://promokodus.com/campaigns/goldapple
        List<String> namings = List.of("А-Г", "Д-Ж", "З-К", "Л-О", "П-Т", "У-Ц", "Ч-Ъ",
                "Ы-Я", "a-d", "e-g", "h-k", "l-o", "p-s", "t-w", "x-z");
        List<CompanyEntity> companyEntities = new ArrayList<>();
        for (String naming : namings) {
            Document doc = dataParser.parse("https://www.pepper.ru/merchant-list/" + naming);
            Elements elements = doc.select("div.tGrid-cell span.text--b");
            for (Element element : elements) {
                CompanyEntity company = CompanyEntity.builder()
                        .name(element.text())
                        .categoryId(null)
                        .build();
                companyEntities.add(company);
            }
        }
        companyRepository.saveAll(companyEntities);
        return "OK";
    }

    //todo save in db results
    public String followCompanyUrl(String url) throws IOException {
        Document document = dataParser.parse(url);
        String text = document.getElementsByTag("title").text();
        if (StringUtils.isNotBlank(text)) {
            log.info("Found company name = {}", text);
            return text;
        }
        log.info("Not found company name in html use url = {}", url);
        return url;
    }
}
