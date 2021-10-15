package com.team_c.controller;

import java.util.ArrayList;
import java.util.List;
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

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class StoreController {
	@Resource(name = "storeService")
	private StoreServiceImpl storeService;


	// storeDetail.do?shop_no=1
	@GetMapping("/storeDetail.do")
	public ModelAndView storeDetail(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("storeDetail");
		Map<String, Object> storeDetail = storeService.storeDetail(commandMap.getMap());
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String shop_no = request.getParameter("shop_no");
		System.out.println(id);
		System.out.println(shop_no);
		if(id != null) {
			commandMap.put("id", id);
			commandMap.put("shop_no", shop_no);
			int list = storeService.likeList(commandMap.getMap());
			System.out.println("리스트 : " + list);
			mv.addObject("list", list);
		}
		
		System.out.println("스토어" + storeDetail);
		mv.addObject("storeDetail", storeDetail);
		// mv.setViewName("storeDetail");

		return mv;
	}

	@RequestMapping("/storeReserv.do")
	public String storeReserv(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("name");
		String shop_name = request.getParameter("shop_name");
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
		System.out.println(shop_name);
		 

		if (name != null && phoneNum != null && date != null && reservTime != null && id != null) {
			commandMap.put("name", name);
			commandMap.put("phoneNum", phoneNum);
			commandMap.put("date", date);
			commandMap.put("id", id);
			commandMap.put("shop_no", shop_no);
			commandMap.put("reservTime", reservTime);
			commandMap.put("reservRequest", reservRequest);
			commandMap.put("people", people);
			commandMap.put("shop_name", shop_name);
			
			storeService.storeReserv(commandMap.getMap());
			//return "redirect:/reservSuccess.do";
			


			
			return "redirect:/storeList.do";
			
		}else {
			return "redirect:/storeDetail.do?shop_no="+shop_no;
		}
	}
	
	
	@GetMapping("/storeList.do")
	public ModelAndView guStore(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("storeList");
		String guName = request.getParameter("guName");
		System.out.println("구네임 : " + guName);
		commandMap.put("guName", guName);
		
		//검색값을 jsp로 넘기기
		if(commandMap.containsKey("search")) {
			mv.addObject("search", commandMap.get("search"));
			mv.addObject("searchGu", commandMap.get("searchGu"));
		}
		
		
		//페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if(commandMap.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(commandMap.get("pageNo")));
		}
		int listScale = 10;
		int pageScale = 10;
		
		//토탈카운트
		int totalCount = storeService.totalCount(commandMap.getMap());
		System.out.println("totalCount = " + totalCount);
		
		//전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount);
		
		//계산하기		
		int startPage = paginationInfo.getFirstRecordIndex();//시작페이지
		int lastPage = paginationInfo.getRecordCountPerPage();//마지막페이지
		
		//DB로 보내기 위해서 map에 담아주기
		commandMap.put("startPage", startPage);
		commandMap.put("lastPage", lastPage);
		
		//질의
		List<Map<String, Object>> list = storeService.storeList(commandMap.getMap());
		ArrayList<Map<String, Object>> list2 = storeService.storeGuList(commandMap.getMap());
		//담기
		mv.addObject("list", list);
		mv.addObject("list2", list2);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
		mv.addObject("guName", guName);
		
		
		return mv;
		
	}
	
	@RequestMapping("/storeLike.do")
	public String storeLike(CommandMap commandMap, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String shop_no = request.getParameter("shop_no");
		//System.out.println("id : " + id);
		//System.out.println("shop_no : " + shop_no);
		if(id != null && shop_no != null) {
			commandMap.put("id", id);
			commandMap.put("shop_no", shop_no);
			
			storeService.storeLike(commandMap.getMap());
		
			System.out.println("즐찾 성공");
			return "redirect:/storeDetail.do?shop_no="+shop_no;
		}else {
			return "redirect:/storeDetail.do?shop_no="+shop_no;
		}
		
	}
	
	@RequestMapping("/storeDisLike.do")
	public String storeDisLike(CommandMap commandMap, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String shop_no = request.getParameter("shop_no");
		//System.out.println("id : " + id);
		//System.out.println("shop_no : " + shop_no);
		if(id != null && shop_no != null) {
			commandMap.put("id", id);
			commandMap.put("shop_no", shop_no);
			
			storeService.storeLike(commandMap.getMap());
		
			System.out.println("즐찾 취소 성공");
			return "redirect:/storeDetail.do?shop_no="+shop_no;
				
		}else {
			return "redirect:/storeDetail.do?shop_no="+shop_no;
		}
		
	}
	
	
}
