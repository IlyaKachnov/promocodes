package com.promocodes.promocodes.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import javax.net.ssl.SSLSocketFactory;
import java.io.IOException;

@RequiredArgsConstructor
@Slf4j
@Service
public class DataParser {
    private final SSLSocketFactory socketFactory;

    public Document parse(String url) throws IOException {
        return Jsoup.connect(url)
                .timeout(15000)
                .sslSocketFactory(socketFactory)
                .userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36")
                .get();
    }


}
