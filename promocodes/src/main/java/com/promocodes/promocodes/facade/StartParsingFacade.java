package com.promocodes.promocodes.facade;

import com.promocodes.promocodes.dao.entity.ExecutionEntity;
import com.promocodes.promocodes.dao.entity.ExecutionStatus;
import com.promocodes.promocodes.dao.repository.ExecutionRepository;
import com.promocodes.promocodes.model.ParseDataEvent;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

@Slf4j
@Component
@RequiredArgsConstructor
public class StartParsingFacade {
    private final ExecutionRepository executionRepository;
    private final EventHandler eventHandler;

    @Scheduled(cron = "${service.scheduler.cron}")
    public void startParsing() {
        log.info("Starting parsing...");
        ExecutionEntity executionEntity = new ExecutionEntity();
        executionEntity.setStatus(ExecutionStatus.IN_PROGRESS);
        executionEntity.setCreatedAt(LocalDateTime.now());
        ExecutionEntity savedExecution = executionRepository.save(executionEntity);
        try {
            ParseDataEvent parseDataEvent = ParseDataEvent.builder()
                    .executionId(executionEntity.getId())
                    .status(ParseDataEvent.EventStatus.PARSE_RAW_DATA)
                    .build();
            log.info("Start first step");
            eventHandler.handle(parseDataEvent);

            savedExecution.setStatus(ExecutionStatus.FINISHED);
            executionRepository.save(savedExecution);
            log.info("Finished parsing");
        } catch (Exception e) {
            log.error("Exception occurred while getting video data", e);
            savedExecution.setStatus(ExecutionStatus.ERROR);
            executionRepository.save(savedExecution);
        }
    }
}
