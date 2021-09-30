package com.team_c.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
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
	
	//storeDetail.do?shop_no=1
	@GetMapping("/storeDetail.do")
	public ModelAndView storeDetail(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("storeDetail");
		Map<String, Object> storeDetail = storeService.storeDetail(commandMap.getMap());
		System.out.println("스토어"+storeDetail);
		mv.addObject("storeDetail", storeDetail);
		//mv.setViewName("storeDetail");
		
		return mv;
	}
	
	
}
