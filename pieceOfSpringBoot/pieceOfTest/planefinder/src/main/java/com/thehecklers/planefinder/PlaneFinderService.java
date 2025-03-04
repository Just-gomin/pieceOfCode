package com.thehecklers.planefinder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.SneakyThrows;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class PlaneFinderService {
    private final PlaneRepository repo;
    private final FlightGenerator generator;
    private URL acURL;
    private final ObjectMapper om;

    @SneakyThrows
    public PlaneFinderService(PlaneRepository repo, FlightGenerator generator) {
        this.repo = repo;
        this.generator = generator;

        acURL = new URL("http://192.0.0.2/ajax/aircraft");
        om = new ObjectMapper();
    }

    public Flux<Aircraft> getAircraft() {
        List<Aircraft> positions = new ArrayList<>();

        try {
            JsonNode aircraftNodes = om.readTree(acURL)
                    .get("aircraft");

            aircraftNodes.iterator().forEachRemaining(node -> {
                try {
                    positions.add(om.treeToValue(node, Aircraft.class));
                } catch (JsonProcessingException e) {
                    e.printStackTrace();
                }
            });
        } catch (IOException e) {
            System.out.println("\n>>> IO Exception: " + e.getLocalizedMessage() +
                    ", generating and providing sample data.\n");
            return repo.deleteAll()
                    .thenMany(saveSamplePositions());
        }

        if (positions.size() > 0) {
            positions.forEach(System.out::println);

            return repo.deleteAll()
                    .thenMany(repo.saveAll(positions));
        } else {
            System.out.println("\n>>> No positions to report, generating and providing sample data.\n");
            return repo.deleteAll()
                    .thenMany(saveSamplePositions());
        }
    }

    private Flux<Aircraft> saveSamplePositions() {
        final Random rnd = new Random();

        return Flux.range(1, rnd.nextInt(10))
                .map(i -> generator.generate())
                .flatMap(repo::save);
    }
}
