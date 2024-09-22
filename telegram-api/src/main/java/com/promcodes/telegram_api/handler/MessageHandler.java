package com.promcodes.telegram_api.handler;

import com.promcodes.telegram_api.dao.PromoCodeEntity;
import com.promcodes.telegram_api.dao.PromoCodeRepository;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.telegram.telegrambots.meta.api.methods.BotApiMethod;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Message;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.InlineKeyboardMarkup;
import org.telegram.telegrambots.meta.api.objects.replykeyboard.buttons.InlineKeyboardButton;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
@RequiredArgsConstructor
public class MessageHandler {
    private static final Logger log = LoggerFactory.getLogger(MessageHandler.class);
    private final PromoCodeRepository promoCodeRepository;
    private final static InlineKeyboardMarkup inlineKeyboardMarkup = new InlineKeyboardMarkup();


    static {
        InlineKeyboardButton inlineKeyboardButton1 = new InlineKeyboardButton();
        InlineKeyboardButton inlineKeyboardButton2 = new InlineKeyboardButton();
        InlineKeyboardButton inlineKeyboardButton3 = new InlineKeyboardButton();
        inlineKeyboardButton1.setText("Музыка и фильмы");
        inlineKeyboardButton1.setCallbackData("Музыка и фильмы");
        inlineKeyboardButton2.setText("Электроника");
        inlineKeyboardButton2.setCallbackData("Электроника");

        inlineKeyboardButton3.setText("Туризм и путешествия");
        inlineKeyboardButton3.setCallbackData("Туризм и путешествия");
        List<InlineKeyboardButton> keyboardButtonsRow1 = new ArrayList<>();
        List<InlineKeyboardButton> keyboardButtonsRow2 = new ArrayList<>();
        List<InlineKeyboardButton> keyboardButtonsRow3 = new ArrayList<>();
        keyboardButtonsRow1.add(inlineKeyboardButton1);
        keyboardButtonsRow2.add(inlineKeyboardButton2);
        keyboardButtonsRow3.add(inlineKeyboardButton3);
        List<List<InlineKeyboardButton>> rowList = new ArrayList<>();
        rowList.add(keyboardButtonsRow1);
        rowList.add(keyboardButtonsRow2);
        rowList.add(keyboardButtonsRow3);
        inlineKeyboardMarkup.setKeyboard(rowList);
    }

    private static final Integer LIMIT = 10;

    public BotApiMethod<?> answerMessage(Message message) {
        String chatId = message.getChatId().toString();

        String inputText = message.getText();

        if (inputText == null) {
            throw new IllegalArgumentException();
        } else if (inputText.equals("/start")) {
            SendMessage sendMessage = new SendMessage(chatId, "Выбери сколько получить промокодов:");
            sendMessage.setReplyMarkup(inlineKeyboardMarkup);
            return sendMessage;
        } else if (inputText.equals("/promo")) {
            List<PromoCodeEntity> actualPromos = promoCodeRepository.getActualPromos(LIMIT);
            log.info("Found {} promo codes", actualPromos.size());
            SendMessage sendMessage = new SendMessage(chatId, actualPromos.stream()
                    .map(this::generateMessageText)
                    .collect(Collectors.joining("\n\n")));
            sendMessage.setDisableWebPagePreview(true);
            return sendMessage;
        } else {
            return new SendMessage(chatId, "не знаю такова");
        }
    }

    private String generateMessageText(PromoCodeEntity promoCodeEntity) {
        return new StringBuilder()
                .append("❤\uFE0F").append(promoCodeEntity.getCompanyName() == null ? "ПРОМОКОД" : promoCodeEntity.getCompanyName())
                .append("\n")
                .append("\uD83C\uDF1F").append(promoCodeEntity.getPromoCode()).append("\n")
                .append("Ссылка на сайт:").append(promoCodeEntity.getUrl())
                .toString();
    }
}
