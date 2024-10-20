package com.example.pieceOfSpringBoot;

import java.util.List;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.repository.CrudRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import jakarta.annotation.PostConstruct;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@SpringBootApplication
public class PieceOfSpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(PieceOfSpringBootApplication.class, args);
	}

}

@Entity
class Coffee {
	// 특정 커피 종류의 고유값
	@Id
	private String id;

	// 커피(종류)명
	private String name;

	public Coffee() {
	}

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

	public void setId(String id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
	}
}

interface CoffeeRepository extends CrudRepository<Coffee, String> {
}

@Component
class DataLoader {
	private final CoffeeRepository coffeeRepository;

	public DataLoader(CoffeeRepository coffeeRepository) {
		this.coffeeRepository = coffeeRepository;
	}

	@PostConstruct
	private void loadData() {
		coffeeRepository.saveAll(List.of(
				new Coffee("Cage Cereza"),
				new Coffee("Cage Ganador"),
				new Coffee("Cage Lareno"),
				new Coffee("Cage Tres Pontas")));
	}
}

@RestController
class RestApiDemoController {
	private final CoffeeRepository coffeeRepository;

	public RestApiDemoController(CoffeeRepository coffeeRepository) {
		this.coffeeRepository = coffeeRepository;
	}

	@RequestMapping(value = "/coffees", method = RequestMethod.GET)
	Iterable<Coffee> getCoffees() {
		return coffeeRepository.findAll();
	}

	@GetMapping("/coffees/{id}")
	Optional<Coffee> getCoffeeById(@PathVariable String id) {
		return coffeeRepository.findById(id);
	}

	@PostMapping("/coffeess")
	Coffee postCoffee(@RequestBody Coffee coffee) {
		return coffeeRepository.save(coffee);
	}

	@PutMapping("/coffees/{id}")
	ResponseEntity<Coffee> putCoffeeById(@PathVariable String id, @RequestBody Coffee coffee) {
		return new ResponseEntity<>(coffeeRepository.save(coffee),
				coffeeRepository.existsById(id) ? HttpStatus.OK : HttpStatus.CREATED);
	}

	@DeleteMapping("/coffees/{id}")
	void deleteCoffeeById(@PathVariable String id) {
		coffeeRepository.deleteById(id);
	}
}

@RestController
@RequestMapping("/greeting")
class GreetingController {
	@Value("${greeting-name: Mirage}")
	private String name;

	@Value("${greeting-coffee: ${greeting-name} is drinking Cafe Ganador}")
	private String coffee;

	@GetMapping
	String getGreeting() {
		return name;
	}

	@GetMapping("/coffee")
	String getNameAndCoffee(){
		return coffee;
	}
}
