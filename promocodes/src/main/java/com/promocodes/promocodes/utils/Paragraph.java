package com.promocodes.promocodes.utils;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Paragraph {
    private int startIndex;
    private int endIndex;
    private String text;
}
