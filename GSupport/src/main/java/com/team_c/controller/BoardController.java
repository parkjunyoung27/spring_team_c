package com.team_c.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
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
	
	@GetMapping("write.do")
	public ModelAndView write() throws Exception {
		ModelAndView mv = new ModelAndView("write");
		System.out.println("글쓰기");
		return mv;
	}

	@PostMapping("write.do")
	public ModelAndView write(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("");
		System.out.println(commandMap.getMap());
		return mv;
	}
	
}
