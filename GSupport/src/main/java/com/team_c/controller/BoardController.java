package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.service.BoardService;


@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	//bossBoard매핑
	@RequestMapping(value="/bossBoard", method = RequestMethod.GET)
	public ModelAndView board(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("bossBoard");
		List<Map<String, Object>> list = boardService.boardList();
		mv.addObject("list", list);
		return mv;
	}
	
}
