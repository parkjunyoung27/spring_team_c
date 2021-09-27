package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.IndexService;

@Controller
public class IndexController {

	@Resource(name="indexService")
	private IndexService indexService;
	
	@GetMapping("index.do")
	public ModelAndView main() throws Exception {
		ModelAndView mv = new ModelAndView("index");
		List<Map<String, Object>> list = indexService.boardList();
		mv.addObject("list", list);
		return mv;
	}
	
	@GetMapping("write.do")
	public ModelAndView write() throws Exception {
		ModelAndView mv = new ModelAndView("write");
		return mv;
	}

	@PostMapping("write.do")
	public ModelAndView write(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("");
		System.out.println(commandMap.getMap());
		return mv;
	}
}
