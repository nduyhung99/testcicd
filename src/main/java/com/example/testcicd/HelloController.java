package com.example.testcicd;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

	@GetMapping("/hello")
	public String hello() {
		return "Hello world";
	}

	@GetMapping("/hello1")
	public String hello1() {
		return "Hello world 1";
	}
}
