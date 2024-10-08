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
        GETTING_PROMOS(1),
        FILL_COMPANY_NAMES(2);

        private final int order;

        EventStatus(int order) {
            this.order = order;
        }

        public int getOrder() {
            return order;
        }
    }
}
