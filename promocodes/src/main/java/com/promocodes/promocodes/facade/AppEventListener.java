package com.promocodes.promocodes.facade;

import com.promocodes.promocodes.model.ParseDataEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

@RequiredArgsConstructor
@Slf4j
@Component
public class AppEventListener {

    private final EventHandler eventHandler;

    @EventListener(ParseDataEvent.class)
    public void listen(ParseDataEvent event) throws Exception {
        eventHandler.handle(event);
    }
}
