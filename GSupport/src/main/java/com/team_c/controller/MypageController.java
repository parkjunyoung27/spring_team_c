package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.MypageServiceImpl;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

@Controller
public class MypageController {
	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MypageServiceImpl mypageService;

	@GetMapping("/myPage.do")
	public ModelAndView myPage(CommandMap map) {
		ModelAndView mv = new ModelAndView("myPage");

		// *****페이징*****
		// 페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 4;// 리스트 크기
		int pageScale = 10;

		// 토탈 카운트
		int totalCount = mypageService.totalCount(map.getMap());

		// 전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount);

		// 계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();

		// DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);

		// 예약기능 출력하기
		List<Map<String, Object>> reservation = mypageService.reservation(map.getMap());

		// 담기
		mv.addObject("reservation_list", reservation);
		if (reservation.size() > 0) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
		mv.addObject("reserve", reservation);

		return mv;

	}

	@GetMapping("/myPage_update.do") // 읽
	public ModelAndView myPage_update(CommandMap commandMap, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage_update");
		HttpSession session = request.getSession();
		commandMap.put("member_id", session.getAttribute("member_id")); // db에 값 담기
//		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> myinfo = mypageService.myPageList(commandMap.getMap());
		mv.addObject("myinfo", myinfo); // 프론트 화면에 값 담기
		// System.out.println(myinfo);
		return mv;
	}

	@PostMapping("/myPage_update.do") // 쓰
	public String myPage_update1(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("member_id") != null) {
			commandMap.put("member_id", session.getAttribute("member_id"));
			mypageService.myPageUpdate(commandMap.getMap());
			System.out.println("들어오는 값 " + commandMap.getMap());
			return "redirect:./myPage_update.do";
		} else {
			return "redirect:./login.do";
		}

	}

	@GetMapping("/myPage_updatePW.do")
	public String myPage_updatePW() {
		System.out.println("!!!!");
		return "myPage_updatePW";
	}

	@PostMapping("/myPage_updatePW.do")
	public String myPage_updatePW(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("member_id") != null) {
			commandMap.put("member_id", session.getAttribute("member_id"));
			mypageService.myPageUpdatePW(commandMap.getMap());
			return "redirect:/myPage_updatePW.do";
		} else {
			return "redirect:/login.do";
		}

	}

	@GetMapping("/myPage_delete.do")
	public String myPage_delete() {
		return "myPage_delete";
	}

	@PostMapping("/myPage_delete.do")
	public String myPage_delete(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("member_id") != null) {
			commandMap.put("member_id", session.getAttribute("member_id"));
			mypageService.myPageDelete(commandMap.getMap());
			session.invalidate();
			return "redirect:/index.do";
		} else {
			return "redirect:/login.do";
		}

	}
	
	@GetMapping("/myPage_reserv.do")
	public ModelAndView myPage_reserv(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage_reserv");
		HttpSession session = request.getSession();
		// *****페이징*****
		// 페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 3;// 리스트 크기
		int pageScale = 10;

		// 토탈 카운트
		int totalCount = mypageService.totalCount(map.getMap());

		// 전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount);

		// 계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();
		
		//id값 받아오기
		String id = (String)session.getAttribute("id");
		
		// DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		map.put("id", id);

		// 예약기능 출력하기
		List<Map<String, Object>> reservation = mypageService.reservation(map.getMap());

		// 담기
		mv.addObject("reservation_list", reservation);
		if (reservation.size() > 0) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
		mv.addObject("reserve", reservation);
		
		return mv;
	}
	
	
	@GetMapping("/myPage_bookmark.do")
	public ModelAndView myPage_bookmark(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage_bookmark");
		
		return mv;
	}
	
	@RequestMapping("/reservCancel.do")
	public String reservCancel(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");
		String shop_no = request.getParameter("shop_no");
		
		if(id != null && shop_no != null) {
			map.put("id", id);
			map.put("shop_no", shop_no);
			
			mypageService.reservCancel(map.getMap());
			System.out.println("삭제성공");
			return "redirect:/myPage_reserv.do";
		}else {
			System.out.println("삭제실패");
			return "redirect:/myPage_reserv.do";
		}
		
	}
	

}
