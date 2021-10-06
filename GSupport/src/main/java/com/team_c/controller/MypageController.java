package com.team_c.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.MypageServiceImpl;

@Controller
public class MypageController {

	@Resource(name = "mypageService")
	private MypageServiceImpl mypageService;

	@GetMapping("/myPage.do")
	public ModelAndView myPage(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("myPage");
		
		List<Map<String, Object>> reservation = mypageService.reservation(commandMap.getMap());
		ArrayList<Map<String, Object>> list = mypageService.myPageList(commandMap.getMap());
		
		mv.addObject("list", list);
		mv.addObject("reserve", reservation);
		return mv;
		
		
	}
}