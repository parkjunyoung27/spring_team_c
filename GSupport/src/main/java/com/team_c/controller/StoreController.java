package com.team_c.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.service.StoreServiceImpl;

@Controller
public class StoreController {
	@Resource(name="storeService")
	private StoreServiceImpl storeService;
	
	@GetMapping("/jongnoStore.do")
	public ModelAndView jongnoStore() {
		ModelAndView mv = new ModelAndView("jongnoStore");
		ArrayList<Map<String, Object>> list = storeService.jongnoStoreList();
		
		mv.addObject("list", list);
		
		return mv;
	}
}
