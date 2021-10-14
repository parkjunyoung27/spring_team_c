package com.team_c.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.AdminServiceImpl;
import com.team_c.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class AdminController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="adminService")
	private AdminServiceImpl adminService;
	@Autowired
	private Util util;

	//관리자 로그인 
	@GetMapping("/admin/access.do")
	public String indexm() {
		return "/admin/access";
	}

	@PostMapping("/admin/access.do")
	public void access(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		//System.out.println(request.getParameter("id"));
		//System.out.println(request.getParameter("pw"));
		
		int result = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", request.getParameter("id"));
		map.put("pw", request.getParameter("pw"));
		
		map = adminService.access(map);
		
		if(map != null) {
			System.out.println("로그인 성공");
			HttpSession session = request.getSession();
			session.setAttribute("id", map.get("member_id"));
			session.setAttribute("name", map.get("member_name"));
			session.setAttribute("grade", map.get("member_grade"));
			result = 1;
		}
		
		PrintWriter pw = response.getWriter();
		pw.println(result);
	}
	
	//관리자 로그아웃 페이지
	@GetMapping("/admin/logoutm.do")
	public String logoutm(HttpServletRequest request, HttpServletResponse response){
		
		HttpSession session = request.getSession();
		if(session.getAttribute("id") != null) {			
			session.removeAttribute(null);
		}if(session.getAttribute("name")!= null) {
			session.removeAttribute("name");
		}if(session.getAttribute("grade")!=null) {
			session.removeAttribute("grade");
		}
		
		return "redirect:/admin/access.do";
	}
	
	//관리자 메인 페이지
	@GetMapping("/admin/adminMain.do")
	public ModelAndView main(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");		

		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");

			if(grade == 3) {
				mv = new ModelAndView("/admin/adminMain");
				
			}
			
		}else {
			mv = new ModelAndView("/admin/access");
			
		}
		//List<Map<String, Object>> list = indexService.boardList();
		//mv.addObject("list", list);
		return mv;
	}
	
	
	//관리자 가맹점 현황 페이지
	@GetMapping("/admin/adminShopNow.do")
	public ModelAndView adminShopNow(CommandMap commandMap, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access"); 
		
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade == 3) {
				mv = new ModelAndView("/admin/adminShopNow");
			}
			
		}
		
		return mv;
	}
	
	//관리자 가맹점 현황 페이지
	@GetMapping("/admin/adminShopReserve.do")
	public ModelAndView adminShopReserve(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade ==3) {
				mv = new ModelAndView("/admin/adminShopReserve");
			}
		}
		
		return mv;
		
	}
	
	//관리자 이용자 관리 페이지
	@GetMapping("/admin/adminMember.do")
	public ModelAndView adminMember(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade ==3) {
				mv = new ModelAndView("/admin/adminMember");
			}
		}
		
		return mv;
		
	}
	
	//관리자 게시판 관리 페이지
	@GetMapping("/admin/adminBoard.do")
	public ModelAndView adminBoard(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade ==3) {
				mv = new ModelAndView("/admin/adminBoard");
			}
		}
		
		return mv;
		
	}
	
	//관리자 로그 관리 페이지
	@GetMapping("/admin/adminLog.do")
	public ModelAndView adminLog(CommandMap map, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		// 정렬
		String order = "";
		if(request.getParameter("order") != "") {
			order = request.getParameter("order");
		}
		
		// 페이징
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 20;
		int pageScale = 10;
		
		int totalCount = adminService.totalCount(map.getMap());
		
		//전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);//한페이지 리스트 갯수
		paginationInfo.setPageSize(pageScale);//페이지사이즈
		paginationInfo.setTotalRecordCount(totalCount);
		
		//계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();
		
		//DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade == 3) {
				mv = new ModelAndView("/admin/adminLog");
				
				//내림차순
				mv.addObject("order", order);
				
				//로그리스트 불러오기
				List<Map<String, Object>> list = adminService.logList(map.getMap());
				
				mv.addObject("paginationInfo", paginationInfo);
				mv.addObject("pageNo", pageNo);
				mv.addObject("list", list);
				
			}
		}
		
		return mv;
	}
	
	//관리자 로그 관리 페이지
	@GetMapping("/admin/adminAnalytics.do")
	public ModelAndView adminAnalytics(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade ==3) {
				mv = new ModelAndView("/admin/adminAnalytics");
				
				
				
				
				
			}
		}
		
		return mv;
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
