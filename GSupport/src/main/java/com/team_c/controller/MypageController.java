package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.MypageService;
import com.team_c.service.MypageServiceImpl;

public class MypageController {

	@Resource(name = "mypageService")
	private MypageServiceImpl mypageService;

	@GetMapping("myPage.do")
	public ModelAndView myPage(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("myPage");
		return mv;
	}
}