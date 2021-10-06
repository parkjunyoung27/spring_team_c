package com.team_c.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AboutController {
	@GetMapping("/about.do")
	public String about() {
		return "about";
	}
	
}
