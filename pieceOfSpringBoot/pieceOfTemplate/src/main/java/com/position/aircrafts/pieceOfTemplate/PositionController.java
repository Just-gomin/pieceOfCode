package com.position.aircrafts.pieceOfTemplate;

import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.reactive.function.client.WebClient;

@RequiredArgsConstructor
@Controller
public class PositionController {
    @NonNull
    private final AircraftRepository repository;
    private WebClient client = WebClient.create("http://localhost:7634/aircraft");

    @GetMapping("/aircraft")
    public String getCurrentAircraftPositions(Model model) {
        // Model -> 템플릿 엔진에 의해 활용되는 Model 빈
        // 애플리케이션의 구성 요소에 Model을 속성으로 추가하면, 템플릿 엔진은 애플리케이션의 구성 요소에 액세스 하게 해준다.
        repository.deleteAll();

        client.get()
                .retrieve()
                .bodyToFlux(Aircraft.class)
                .filter(plane -> !plane.getReg().isEmpty())
                .toStream()
                .forEach(repository::save);
        model.addAttribute("currentPositions", repository.findAll());
        return "positions";
    }
}
