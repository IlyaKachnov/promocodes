package com.promocodes.promocodes.model;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
@Builder
public class ParseDataEvent {
    public Long executionId;
    private EventStatus status;

    public enum EventStatus {
        PARSE_RAW_DATA(0),
        //todo менять через конфиг
//        GETTING_PROMOS(1),
        GETTING_PROMOS_V2(1),
        GETTING_PROMOS_V3(2),
        FILL_COMPANY_NAMES(3);

        private final int order;

        EventStatus(int order) {
            this.order = order;
        }

        public int getOrder() {
            return order;
        }
    }
}
