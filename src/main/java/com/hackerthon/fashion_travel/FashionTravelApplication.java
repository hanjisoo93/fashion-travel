package com.hackerthon.fashion_travel;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class FashionTravelApplication {

	public static void main(String[] args) {
		SpringApplication.run(FashionTravelApplication.class, args);
	}

	@RestController
	public class HomeController {
		@GetMapping("/")
		public String hello() {
			return "Hello World!";
		}
	}
}
