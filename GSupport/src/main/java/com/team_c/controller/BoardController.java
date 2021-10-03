package com.team_c.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@RequestMapping(value="/bossBoard", method = RequestMethod.GET)
	public ModelAndView board(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("bossBoard");
		return mv;
	}
	
}
