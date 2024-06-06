package com.promocodes.promocodes.api;

import com.gptapi.request.Message;
import com.gptapi.request.RequestGpt;
import com.gptapi.response.ResponseGpt;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.Collections;
import java.util.List;

@Service
@RequiredArgsConstructor
public class GPTApiService {
    private final RestTemplate restTemplate;

    public ResponseEntity<ResponseGpt> getGptResponse() {
        RequestGpt requestGpt = new RequestGpt();
        requestGpt.setModel("GigaChat");
        requestGpt.setTemperature(1.0);
        requestGpt.setTopP(0.1);
        requestGpt.setN(1);
        requestGpt.setStream(false);
        requestGpt.setMaxTokens(512);
        requestGpt.setRepetitionPenalty(1);

        Message message = new Message();
        message.setContent("определить по списку url наименование компании и определить их в одну из указанных категорий:\n" +
                "Онлайн-кинотеатр,\n" +
                "Товары для сна,\n" +
                "Электроника\n" +
                "Если не подходит не под одну категорию, отнеси в категорию Иное\n" +
                "список url:\n" +
                "https://somiasleep.ru/\n" +
                "https://okko.tv/s/drc\n" +
                "https://khitrovamed.com/\n" +
                "https://go.sky.pro\n" +
                "\n" +
                "верни ответ в формате json:\n" +
                "{\n" +
                "  \"companies\": [\n" +
                "    {\n" +
                "      \"name\": \"Company Name\",\n" +
                "      \"url\": \"https://url.ru/\",\n" +
                "      \"category\": \"Электроника\"\n" +
                "    }\n" +
                "  ]\n" +
                "}");
        message.setRole("user");
        requestGpt.setMessages(List.of(message));
        HttpHeaders headers = new HttpHeaders();
        headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth("eyJjdHkiOiJqd3QiLCJlbmMiOiJBMjU2Q0JDLUhTNTEyIiwiYWxnIjoiUlNBLU9BRVAtMjU2In0.oP9JwDkpiHYcBhCJZ9BqBrYS-g2Je7ffim05upVlt9R5Nfjd2wig4QpsADD7iPuI1U0J8XJ9yd-TmBK-_Wr5PlCLFjkj7nN-iVTBIoatYr43wxuGAbdZc0TDk1_0MRAgpxiSv_V4Nz2Ng7u8OU45CmEIcLzQEU3U04bSs4bTEuRdqszSl33-ljgq9uaJ10yqnjuLZQR5qOnS_jfWiz8BrXJgvWXu4Uqj1CBjm6h59fgaUoOHkrM50BIVwghdxyE8dLihPzWfhKzwNQgonPAPoenWYFdWfbwxJmBApl2xpALalTqbNmw_nyTO8cTHOWHDWGi8bCetEZCMotmyAnWmew.bc8DgRO_Encjk7QZDcLIiA.aHYUg5JtYgWCPM_sbKjMMX2p3QaKoN3cZm-NR0D6G5F2dFKF9dasQmxzStnlczTDi0Ry7gOACqpiG6tMxG7me28wa1iO-4e6_x5H4SRa5eI-d1xShCv80ywsI8wvDk1nmo12URmj9WyPXPHwsDgmglcsf391La1hpAHRtdiaQheh79w2c0sTNnIogyXjTRES0fxXsulbhF61Fp8XexrjK0GoZ1uXpRGHcw0Yqm3bQJnhxjVaUJMZAUnk6Ju0Hr9kpivE8okGqHY4mXBdlmDLSqef2DJkoPzKxkfRXnRqOJfUiuAoY_-QFGC3yC_mMA-aR6sXF8SNt00JUogrY8_nr_DZjlFpoRQAqcASKffb-5O-cP2qiBs8-i1bvCHRzC_3sLiX3dgjdvD0_rgrnkAbYV1FQ52x2y_IUW1peXU_LGz3Tk7zp-I0xdFrHoOAbtWWvd8r7iboAyfABEqa1Y4RecaT4t_IFLXCQKuIcuRtazs8uYyHmAXBNofvCMpjKuDe-BAURZbGYcyPdkyoPQQf6eWL-VgdHTtps9EIUIy8RG2aIKepTjJaulCRCgnXNCAngi2g0cSDEIYEyyTzQptGUdQBCHRWMbuS2McHrjNuGHEiPmnOvZIpgq_bHLlJbGhFi7nFKka43u5NuT5DqwQ2LR_o2ykbeUBshKRsXT9W_woC0-9605ZJD-rr0TngT7tmMZOsbKIQ2iVITiSpAuJEC2LJ5HlHNwje3AFBSxhfiIA.8fKb7v_2jRGxhamtBg-IWTnHyDSMoRq4LMonkIHnMMM");
        HttpEntity<RequestGpt> entity = new HttpEntity<>(requestGpt, headers);
        ResponseEntity<ResponseGpt> responseGptResponseEntity = restTemplate.postForEntity("https://gigachat.devices.sberbank.ru/api/v1/chat/completions",
                entity,
                ResponseGpt.class);
        return responseGptResponseEntity;
    }
}
