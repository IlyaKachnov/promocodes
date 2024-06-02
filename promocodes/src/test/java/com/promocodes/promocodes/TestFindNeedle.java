package com.promocodes.promocodes;

import com.promocodes.promocodes.utils.YoutubeDataUtils;
import org.junit.jupiter.api.Test;

public class TestFindNeedle {

    public static String text = "Детский патологоанатом Таня Хитрова рассказала о плюсах и минусах своей работы, учебе и личных границах. Мне, как человеку с медицинским образованием, было очень интересно спросить у Тани о самых интересных случаях в ее работе.\n" +
            "\n" +
            "Мои соцсети:\n" +
            "✓ Телеграм канал: https://t.me/telek_telek\n" +
            "✓ Паблик в ВК: https://vk.com/telektelek\n" +
            "✓ Инстаграм: https://www.instagram.com/telek100/ (запрещен на территории РФ)\n" +
            "\n" +
            "Таня Хитрова в соцсетях:\n" +
            "✓ Инстаграм: https://www.instagram.com/patologinya/ (запрещен на территории РФ)\n" +
            "✓ Таня дарит промокод telektelek на скидку в 20% на любой курс академии https://khitrovamed.com/courses в течение месяца (до 23 октября 2023)\n" +
            "\n" +
            "Также вы можете посмотреть еще одно мое веселое видео: https://www.youtube.com/watch?v=row5QXSe6sw\n" +
            "\n" +
            "✓ Информацию для новых видео можно прислать в бот https://t.me/TelekTelek_bot или на почту klglkj@yandex.ru\n" +
            "\n" +
            "✓ По вопросам рекламы обращайтесь к менеджеру: reklama.mary@yandex.ru либо Telegram https://t.me/smm_maria\n" +
            "\n" +
            "Детский патологоанатом о плюсах и минусах работы, учебе и личных границах / Таня Хитрова";

    @Test
    public void testFind() {
        YoutubeDataUtils.buildString(text, "промокод");
    }

}
