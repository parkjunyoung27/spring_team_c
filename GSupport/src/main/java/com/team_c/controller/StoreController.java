package com.team_c.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.StoreServiceImpl;

@Controller
public class StoreController {
	@Resource(name = "storeService")
	private StoreServiceImpl storeService;

	@GetMapping("/jongnoStore.do")
	public ModelAndView jongnoStore(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("jongnoStore");
		//String guName = request.getParameter("guName");
		ArrayList<Map<String, Object>> list = storeService.jongnoStoreList();
		//System.out.println("구네임 : " + guName);
		mv.addObject("list", list);

		return mv;
	}

	// storeDetail.do?shop_no=1
	@GetMapping("/storeDetail.do")
	public ModelAndView storeDetail(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("storeDetail");
		Map<String, Object> storeDetail = storeService.storeDetail(commandMap.getMap());
		System.out.println("스토어" + storeDetail);
		mv.addObject("storeDetail", storeDetail);
		// mv.setViewName("storeDetail");

		return mv;
	}

	@RequestMapping("/storeReserv.do")
	public String storeReserv(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("name");
		String phoneNum = request.getParameter("phoneNum");
		String date = request.getParameter("date");
		String reservTime = request.getParameter("reservTime");
		String id = (String)session.getAttribute("id");
		String reservRequest = request.getParameter("request");
		int people = Integer.parseInt(request.getParameter("people"));
		int shop_no = Integer.parseInt(request.getParameter("shop_no"));
		
		
		System.out.println(name); System.out.println(phoneNum);
		System.out.println(date); System.out.println(reservRequest);
		System.out.println(id); System.out.println(shop_no);
		System.out.println(people); System.out.println(reservTime);
		 

		if (name != null && phoneNum != null && date != null && reservTime != null && id != null) {
			commandMap.put("name", name);
			commandMap.put("phoneNum", phoneNum);
			commandMap.put("date", date);
			commandMap.put("id", id);
			commandMap.put("shop_no", shop_no);
			commandMap.put("reservTime", reservTime);
			commandMap.put("reservRequest", reservRequest);
			commandMap.put("people", people);
			
			storeService.storeReserv(commandMap.getMap());
			//return "redirect:/reservSuccess.do";
			


			
			return "redirect:/storeList.do";
			
		}else {
			return "redirect:/storeDetail.do?shop_no="+shop_no;
		}
	}
	@GetMapping("/storeGuList.do")
	public ModelAndView storeGuList(CommandMap commandMap) {
		ModelAndView mv = new ModelAndView("storeGuList");
		ArrayList<Map<String, Object>> list = storeService.storeGuList(commandMap.getMap());
		mv.addObject("list", list);
		
		return mv;
	}
	
	@GetMapping("/storeList.do")
	public ModelAndView guStore(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("storeList");
		String guName = request.getParameter("guName");
		System.out.println("구네임 : " + guName);
		commandMap.put("guName", guName);
		ArrayList<Map<String, Object>> list = storeService.storeList(commandMap.getMap());
		ArrayList<Map<String, Object>> list2 = storeService.storeGuList(commandMap.getMap());
		mv.addObject("list", list);
		mv.addObject("list2", list2);
		
		return mv;
		
	}
	
	
}
