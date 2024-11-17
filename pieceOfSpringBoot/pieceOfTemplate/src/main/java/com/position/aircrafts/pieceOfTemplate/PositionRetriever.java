package com.position.aircrafts.pieceOfTemplate;

import lombok.AllArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.io.IOException;
import java.util.List;
import java.util.function.Consumer;

@AllArgsConstructor
@Configuration
public class PositionRetriever {
    private final AircraftRepository repo;
    private final WebSocketHandler handler;

    @Bean
    Consumer<List<Aircraft>> retrieveAircraftPositions() {
        return acList -> {
//            repo.deleteAll();
            repo.saveAll(acList);
            sendPostitions();
        };
    }

    private void sendPostitions() {
        if (repo.count() > 0) {
            for (WebSocketSession sessionInList : handler.getSessionList()) {
                try {
                    sessionInList.sendMessage(
                            new TextMessage(repo.findAll().toString())
                    );
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
