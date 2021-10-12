package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	public ModelAndView myPage(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage");
		HttpSession session = request.getSession();
//
//		if (session.getAttribute("member_id") != null && session.getAttribute("member_name") != null) {
//			map.put("member_id", session.getAttribute("member_id"));
//			map.put("member_name", session.getAttribute("member_name"));
//
//			Map<String, Object> myPage = mypageService.mypageList(map.getMap());
//			mv.addObject("mypage", myPage);

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
//		} else {
//			return new ModelAndView("/login");
//		}

	}


	@PostMapping("/myPage_update.do")
	public String mypageupdate() { 
		return "myPage_update";
	}
	
	@GetMapping("/myPage_update.do")
	public String myPageUpdate(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(session.getAttribute("id"));
		System.out.println(session.getAttribute("name"));
		if (session.getAttribute("id") != null && session.getAttribute("name") != null) {
			map.put("id", session.getAttribute("member_id"));
			map.put("name", session.getAttribute("member_name"));
			map.put("phonenum", session.getAttribute("member_phonenum"));
			map.put("pw", session.getAttribute("member_pw"));
			mypageService.mypageUpdate(map.getMap());
			return "redirect:/myPage_update";
		} else {
			return "redirect:/login";
		}

	}

}
