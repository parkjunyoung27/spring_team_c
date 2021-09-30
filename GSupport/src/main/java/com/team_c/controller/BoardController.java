package com.team_c.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping(value="/component/bossBoard")
	public ModelAndView board(HttpServletRequest request) {
		ModelAndView mv= new ModelAndView("bossBoard");
	

		return mv;
	}
	
}
