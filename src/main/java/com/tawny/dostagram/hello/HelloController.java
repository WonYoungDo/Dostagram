package com.tawny.dostagram.hello;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController {
	
	@GetMapping("/hello")
	@ResponseBody
	public String hello() {
		return "hellow/hello";
	}
	
	@GetMapping("/hello/1")
	public String hello1() {
		return "hellow/hello";
	}
}
