package com.example.pieceOfSpringBoot;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class PieceOfSpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(PieceOfSpringBootApplication.class, args);
	}

}

class Coffee {
	// 특정 커피 종류의 고유값
	private final String id;

	// 커피(종류)명
	private String name;

	public Coffee(String id, String name) {
		this.id = id;
		this.name = name;
	}

	public Coffee(String name) {
		this(UUID.randomUUID().toString(), name);
	}

	public String getId() {
		return this.id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
}

@RestController
class RestApiDemoController {
	private List<Coffee> coffees = new ArrayList<>();

	public RestApiDemoController() {
		coffees.addAll(List.of(
				new Coffee("Cage Cereza"),
				new Coffee("Cage Ganador"),
				new Coffee("Cage Lareno"),
				new Coffee("Cage Tres Pontas")));
	}

	@RequestMapping(value = "/coffees", method = RequestMethod.GET)
	Iterable<Coffee> getCoffees() {
		return coffees;
	}

	@GetMapping("/coffees/{id}")
	Optional<Coffee> getCoffeeById(@PathVariable String id) {
		for (Coffee c : coffees) {
			if (c.getId().equals(id)) {
				return Optional.of(c);
			}
		}
		return Optional.empty();
	}

	@PostMapping("/coffeess")
	Coffee postCoffee(@RequestBody Coffee coffee) {
		coffees.add(coffee);
		return coffee;
	}

	@PutMapping("/coffees/{id}")
	ResponseEntity<Coffee> putCoffeeById(@PathVariable String id, @RequestBody Coffee coffee) {
		int coffeeIndex = -1;

		for (Coffee c : coffees) {
			if (c.getId().equals(id)) {
				coffeeIndex = coffees.indexOf(c);
				coffees.set(coffeeIndex, coffee);
			}
		}

		return (coffeeIndex == -1) ? new ResponseEntity<>(postCoffee(coffee), HttpStatus.CREATED)
				: new ResponseEntity<>(coffee, HttpStatus.OK);
	}

	@DeleteMapping("/coffees/{id}")
	void deleteCoffeeById(@PathVariable String id) {
		coffees.removeIf(c -> c.getId().equals(id));
	}
}
