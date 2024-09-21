package com.promocodes.promocodes.facade;

import com.promocodes.promocodes.model.ParseDataEvent;
import com.promocodes.promocodes.service.execution.ExecutionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
@RequiredArgsConstructor
@Slf4j
public class EventHandler {
    private final Map<String, ExecutionService> executionServiceMap;
    private final ApplicationEventPublisher eventPublisher;
    private static final Map<Integer, ParseDataEvent.EventStatus> sortedStatuses = new HashMap<>();

    static {
        for (ParseDataEvent.EventStatus status : ParseDataEvent.EventStatus.values()) {
            sortedStatuses.put(status.getOrder(), status);
        }
    }

    public void handle(ParseDataEvent event) throws Exception {
        executionServiceMap.get(event.getStatus().toString()).execute(event.getExecutionId());
        int order = event.getStatus().getOrder();
        int nextOrder = order + 1;
        ParseDataEvent.EventStatus status = sortedStatuses.get(nextOrder);
        if (status == null) {
            log.info("All job was done");
            return;
        }
        ParseDataEvent parseDataEvent = ParseDataEvent.builder()
                .status(status)
                .executionId(event.getExecutionId())
                .build();
        eventPublisher.publishEvent(parseDataEvent);
    }
}
