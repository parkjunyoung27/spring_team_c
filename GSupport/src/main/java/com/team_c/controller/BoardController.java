package com.team_c.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.service.BoardService;


@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/board")
	public ModelAndView board() {
		ModelAndView mv = new ModelAndView();
		List<Map<String, Object>> list = boardService.boardList();
		mv.addObject("list", list);
		return mv;
	}
	
	
}
