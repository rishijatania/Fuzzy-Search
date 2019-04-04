package com.fuzzy.search;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan({ "com.fuzzy" })
@SpringBootApplication
public class FuzzySearchApplication {
	public static void main(String[] args) {
		SpringApplication.run(FuzzySearchApplication.class, args);
	}

}
