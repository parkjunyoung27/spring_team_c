package com.team_c.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutController {
	@GetMapping("/about.do")
	public String about() {
		return "about";
	}
	
	@GetMapping("/about1.do")
	public String about1() {
		return "about1";
	}
	
	@GetMapping("/about2.do")
	public String about2() {
		return "about2";
	}
	
}
