package com.team_c.controller;

import java.io.IOException;
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
import org.springframework.ui.Model;
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
	public String access(HttpServletRequest request, HttpServletResponse response,Model model) throws IOException {
		
		//System.out.println(request.getParameter("id"));
		//System.out.println(request.getParameter("pw"));
		
		HttpSession session = request.getSession();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", request.getParameter("id"));
		map.put("pw", request.getParameter("pw"));
		
		map = adminService.access(map);

		if(map != null) {
			System.out.println("로그인 성공");
			session.setAttribute("id", map.get("member_id"));
			session.setAttribute("name", map.get("member_name"));
			session.setAttribute("grade", map.get("member_grade"));
			return "redirect:/admin/adminMain.do";
		}
		
		return "redirect:/admin/access.do?error=fail";
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
				Map<String, Object> dashList = adminService.dashList();
				mv.addObject("list", dashList);
				System.out.println(dashList);
			}
			
		}else {
			mv = new ModelAndView("/admin/access");
		}
		return mv;
	}
	
	
	//관리자 가맹점 현황 페이지
	@GetMapping("/admin/adminShopNow.do")
	public ModelAndView adminShopNow(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access"); 
		
		String gu = ""; //기본값 구
		if(request.getParameter("gu")!= null) {
			gu = request.getParameter("gu");
		}
		
		map.put("gu", gu);
		
		//지역구 리스트 불러오기
		List<Object> guList = adminService.guList();
		
		// 페이징
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 20;
		int pageScale = 10;
		
		int totalCount = adminService.shopNowTotalCount(map.getMap());
		
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
				mv = new ModelAndView("/admin/adminShopNow");
				
				//가맹점 리스트 불러오기
				List<Map<String, Object>> list = adminService.shopList(map.getMap());
				
				mv.addObject("paginationInfo", paginationInfo);
				mv.addObject("pageNo", pageNo);
				mv.addObject("list", list);
				mv.addObject("guList", guList);
				mv.addObject("gu", gu);
				mv.addObject("totalCount", totalCount);
				
			}
			
		}
		
		return mv;
	}
	
	@PostMapping("/admin/adminShopNow.do")
	public String adminShopNow2(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade == 3) {
				
				int sum = 0;
				String[] numbers = null;
				
				if(request.getParameter("check") == null) {
					System.out.println("삭제할것이 없습니다.");
				}else {
					numbers = request.getParameterValues("check");
					for(String string : numbers) {
						String number = string;
						System.out.println("삭제할 번호: " + number);
						adminService.deleteShop(number);
					}
				}
			}
		}
		return "redirect:./adminShopNow.do";
	}
	
	//관리자 가맹점 현황 페이지
	@GetMapping("/admin/adminShopAllow.do")
	public ModelAndView adminShopReserve(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		String gu = ""; //기본값 구
		if(request.getParameter("gu")!= null) {
			gu = request.getParameter("gu");
		}
		
		map.put("gu", gu);
		
		//지역구 리스트 불러오기
		List<Object> guList = adminService.guList();
		
		// 페이징
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 20;
		int pageScale = 10;
		
		int totalCount = adminService.shopAllowTotalCount(map.getMap());
		
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
			
			if(grade ==3) {
				mv = new ModelAndView("/admin/adminShopAllow");
				
				//가맹점 리스트 불러오기
				List<Map<String, Object>> list = adminService.shopRegisterViewList(map.getMap());
				
				mv.addObject("paginationInfo", paginationInfo);
				mv.addObject("pageNo", pageNo);
				mv.addObject("list", list);
				mv.addObject("guList", guList);
				mv.addObject("gu", gu);
				mv.addObject("totalCount", totalCount);
				
			}
		}
		
		return mv;
		
	}
	
	//shopAllow 가맹점 등록 승인
	@PostMapping("/admin/adminShopAllow.do")
	public String adminShopAllow2(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade == 3) {
				
				int sum = 0;
				String[] numbers = null;
				
				if(request.getParameter("check") == null) {
					System.out.println("승인할 가맹점이 없습니다.");
				}else {
					numbers = request.getParameterValues("check");
					for(String string : numbers) {
						String number = string;
						System.out.println("승인할 번호: " + number);
						adminService.registerShop(number);
					}
				}
			}
		}
		return "redirect:./adminShopAllow.do";
	}
	
	//관리자 이용자 관리 페이지
	@GetMapping("/admin/adminMember.do")
	public ModelAndView adminMember(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		String channel = ""; //기본값 구
		if(request.getParameter("channel")!= null) {
			channel = request.getParameter("channel");
		}
		String gradeOption = ""; //기본값 구
		if(request.getParameter("grade")!= null) {
			gradeOption = request.getParameter("grade");
		}
		
		map.put("channel", channel);
		map.put("gradeOption", gradeOption);
		
		//채널리스트 불러오기
		List<Object> channelList = adminService.channelList();		
		//등급 리스트 불러오기 
		List<Object> gradeList = adminService.gradeList();
		
		// 페이징
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 10;
		int pageScale = 10;
		
		int totalCount = adminService.memberTotalCount(map.getMap());
		
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
			
			if(grade ==3) {
				mv = new ModelAndView("/admin/adminMember");
				
				//멤버 리스트 불러오기
				List<Map<String, Object>> list = adminService.memberList(map.getMap());
				
				mv.addObject("paginationInfo", paginationInfo);
				mv.addObject("pageNo", pageNo);
				mv.addObject("list", list);
				mv.addObject("channelList", channelList);
				mv.addObject("gradeList", gradeList);
				mv.addObject("totalCount", totalCount);
				mv.addObject("channel", channel);
				mv.addObject("gradeOption", gradeOption);
				
			}
		}
		return mv;
	}

	//관리자 게시판 관리 페이지
	@GetMapping("/admin/adminBoard.do")
	public ModelAndView adminBoard(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		String board_cate = "0"; 
		if(request.getParameter("board_cate") != null) {
			board_cate = request.getParameter("board_cate"); 
		}
		System.out.println(board_cate);
		map.put("board_cate", board_cate);
		
		String gradeOption = ""; //기본값 구
		if(request.getParameter("gradeOption")!= "" & request.getParameter("gradeOption") != null) {
			gradeOption = request.getParameter("gradeOption");
		}
		System.out.println("등급 : "+ gradeOption);
		map.put("gradeOption", gradeOption);
		
		List<Object> gradeList = adminService.gradeList();
		
		// 페이징
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 20;
		int pageScale = 10;
		
		int totalCount = adminService.adminBoardTotalCount(map.getMap());
		
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
				mv = new ModelAndView("/admin/adminBoard");
				
				//멤버 리스트 불러오기
				List<Map<String, Object>> list = adminService.adminBoardList(map.getMap());
				
				mv.addObject("paginationInfo", paginationInfo);
				mv.addObject("pageNo", pageNo);
				mv.addObject("list", list);
				mv.addObject("gradeList", gradeList);
				mv.addObject("totalCount", totalCount);
				mv.addObject("gradeOption", gradeOption);		
				mv.addObject("board_cate", board_cate);		
			}
		}
		return mv;
	}
	
	@PostMapping("/admin/adminBoard.do")
	public String adminBoard2(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade == 3) {
				
				int sum = 0;
				String[] numbers = null;
				
				if(request.getParameter("check") == null) {
					System.out.println("삭제할것이 없습니다.");
				}else {
					numbers = request.getParameterValues("check");
					for(String string : numbers) {
						String number = string;
						System.out.println("삭제할 번호: " + number);
						adminService.deleteAdminBoard(number);
					}
				}
			}
		}
		return "redirect:./adminBoard.do";
	}

	
	//관리자 로그 관리 페이지
	@GetMapping("/admin/adminLog.do")
	public ModelAndView adminLog(CommandMap map, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("/admin/access");
		
		System.out.println("겟임");
		
		// 정렬
		String order = "";
		if(request.getParameter("order") != null) {
			order = request.getParameter("order");
		}
		
		String ip ="";
		String target ="";
		if(request.getParameter("ip") != null) {
			ip = request.getParameter("ip");
		}
		System.out.println("ip값 : " + request.getParameter("ip"));
		
		if(request.getParameter("target") != null) {
			target = request.getParameter("target");
		}		
		System.out.println("target값 : " + request.getParameter("target"));
		
		map.put("ip", ip);
		map.put("target", target);
		

		// 페이징
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 20;
		int pageScale = 10;
		
		int totalCount = adminService.totalCount(map.getMap());
		
		//옵션 ipList 불러오기
		List<Object> ipList = adminService.ipList();
		
		//옵션 targetList 불러오기 
		List<Object> targetList = adminService.targetList();
		
		
		
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
				mv.addObject("ipList", ipList);
				mv.addObject("targetList", targetList);
				mv.addObject("totalCount", totalCount);
				mv.addObject("ip", ip);
				mv.addObject("target", target);
				
			}
		}
		
		return mv;
	}
	
	@PostMapping("/admin/adminLog.do")
	public String adminLog2(HttpServletRequest request) {
		System.out.println("포스트");
		
		HttpSession session = request.getSession();
		if(session.getAttribute("grade") != null) {
			int grade = (Integer)session.getAttribute("grade");
			
			if(grade == 3) {
				
				int sum = 0;
				String[] numbers = null;
				
				if(request.getParameter("check") == null) {
					System.out.println("삭제할것이 없습니다.");
				}else {
					numbers = request.getParameterValues("check");
					for(String string : numbers) {
						String number = string;
						System.out.println("삭제할 번호: " + number);
						adminService.deleteLog(number);
					}
				}
			}
		}
		return "redirect:./adminLog.do";
	}
		
	//관리자 구글 통계 페이지
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
