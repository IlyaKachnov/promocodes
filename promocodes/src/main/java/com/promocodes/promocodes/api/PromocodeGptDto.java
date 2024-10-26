package com.promocodes.promocodes.api;

import lombok.Data;

@Data
public class PromocodeGptDto {
    private String promocode;
    private String expiresAt;
    private String company;
    private String site;
}
