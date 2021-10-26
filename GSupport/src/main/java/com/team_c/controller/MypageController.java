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
import com.team_c.util.Util;

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
	
	@GetMapping("/myPage_registStore.do")
	public ModelAndView myPage_registStore(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("myPage_registStore");
		String id = (String)session.getAttribute("member_id");
		List<Map<String, Object>> list = mypageService.storeGuList(map.getMap());
		
		mv.addObject("list", list);
		
		return mv;
	}
	
	@PostMapping("/myPage_registStore.do")
	public String myPage_registStore2(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//ModelAndView mv = new ModelAndView("myPage_registStore");
		String id = (String)session.getAttribute("member_id");
		String shop_name = request.getParameter("shop_name");
		String shop_loc = request.getParameter("shop_loc");
		String shop_gu = request.getParameter("shop_gu");
		String shop_tel = request.getParameter("shop_tel");
		String shop_opentime = request.getParameter("shop_opentime");
		String shop_closetime = request.getParameter("shop_closetime");
		String shop_notice = request.getParameter("shop_notice");
		int member_grade = (int)session.getAttribute("grade");
		
		System.out.println(id + shop_name + shop_loc + shop_gu + shop_tel + shop_opentime + shop_closetime + shop_notice);
		System.out.println(member_grade + "==================================================");
		
		if(id != null && shop_name != null && shop_loc != null && shop_gu != null && shop_tel != null && shop_opentime != null
				 && shop_closetime != null && shop_notice != null) {
			map.put("id", id);
			map.put("shop_name", shop_name);
			map.put("shop_loc", shop_loc);
			map.put("shop_gu", shop_gu);
			map.put("shop_tel", shop_tel);
			map.put("shop_opentime", shop_opentime);
			map.put("shop_closetime", shop_closetime);
			map.put("shop_notice", shop_notice);
			map.put("member_grade", member_grade);
			
			mypageService.myPage_registStore(map.getMap());
			mypageService.registStoreInsert(map.getMap());
			session.setAttribute("grade", 2);
			
			System.out.println("성공");
			return "redirect:/myPage_updateOwner.do";
		}
		
		System.out.println("실패");
		return "error";
	}
	
	
	//가맹점 등록 정보 가져오기
	@GetMapping("/myPage_updateOwner.do")
	public ModelAndView myPage_updateOwner(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mv = new ModelAndView("myPage_updateOwner");
		map.put("member_id", session.getAttribute("member_id"));
		Map<String, Object> mystore = mypageService.myPage_updateOwner(map.getMap());
		List<Map<String, Object>> list = mypageService.storeGuList(map.getMap());
		mv.addObject("mystore", mystore);
		mv.addObject("list", list);
		System.out.println(mystore+"----------------------------------------");
		System.out.println(map.getMap());
		return mv;
	}
	
	//가맹점 등록 정보 수정하기
	@PostMapping("/myPage_updateStore.do")
	public String myPage_updateOwner1(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {
			map.put("member_id", session.getAttribute("member_id"));
			mypageService.myPage_updateStore(map.getMap());
			System.out.println("성공");
			System.out.println("==================================="+map.getMap());
			return "redirect:./myPage_updateOwner.do";
		}
		System.out.println("실패");
			return "redirect:./myPage.do";
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
			return "redirect:/login.do";
		} else {
			return "redirect:/login.do";
		}

	}
	
	@GetMapping("/myPage_reserv.do")
	public ModelAndView myPage_reserv(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage_reserv");
		HttpSession session = request.getSession();
		
		//String reservationStatus = mypageService.reservationCate(map);
		//System.out.println("예약 이름은으으으ㅏㄴ어라어라ㅓㄴ아런아" + reservationStatus);
		//mv.addObject("reserve_status", reservationStatus);
		
		//String reservation_status = "wait";
		//if(map.containsKey("reservationNo")) {
		//	reservation_status = String.valueOf(map.get("reservationNo"));
		//} else {
		//	map.put("reservationNo", reservation_status);
		//} mv.addObject("reservationNo", reservation_status);
			 
		// *****페이징*****
		// 페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 3;// 리스트 크기
		int pageScale = 10;
		
		//id값 받아오기
		String id = (String)session.getAttribute("id");
		map.put("id", id);
		// 토탈 카운트
		int totalCount = mypageService.totalCount(map.getMap());
		List<Map<String, Object>> reservationTotal = mypageService.reservationTotal(map.getMap());
		//이걸 분리합니다.
		for (int i = 0; i < reservationTotal.size(); i++) {
			if(reservationTotal.get(i).get("reservation_status").equals("wait")) {
				mv.addObject("wait", reservationTotal.get(i).get("reservationTotal"));
			}else if(reservationTotal.get(i).get("reservation_status").equals("cancel")) {
				mv.addObject("cancel", reservationTotal.get(i).get("reservationTotal"));
			}else  if(reservationTotal.get(i).get("reservation_status").equals("success")) {
				mv.addObject("success", reservationTotal.get(i).get("reservationTotal"));
			}
		}
		System.out.println("=================="+ reservationTotal);
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
		
//		List<Map<String, Object>> reservation1 = mypageService.reservation1(map.getMap());
//		System.out.println(" "+ reservation1 + "hiiiiiiiiijijdfisdjofjsdlkfjsd");


		// 담기
		mv.addObject("reservation_list", reservation);
		if (reservation.size() > 0) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
		mv.addObject("reserve", reservation);
		//mv.addObject("reservationTotal", reservationTotal);이걸 분리하겠습니다.
//		if(map.containsKey("total")) {
//			List<Map<String, Object>> total = mypageService.reservationTotal(map.getMap());
//			mv.addObject("total", total);
//		}
		System.out.println(" " + "토탈카운트북마크 = " + reservationTotal);
		
		return mv;
	}
	
	
	@GetMapping("/myPage_bookmark.do")
	public ModelAndView myPage_bookmark(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage_bookmark");
		HttpSession session = request.getSession();
		
		// *****페이징*****
				// 페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 4;// 리스트 크기
		int pageScale = 10;
		
		String id = (String)session.getAttribute("id");
		map.put("id", id);
		
		// 토탈 카운트
		int totalCountBookmark = mypageService.totalCountBookmark(map.getMap());
		
		// 전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCountBookmark);

		// 계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();
				
		// DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		
		List<Map<String, Object>> list = mypageService.myPageBookmark(map.getMap());
		
		mv.addObject("list", list);
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCountBookmark", totalCountBookmark);
		System.out.println("토탈카운트북마크 = "+ totalCountBookmark);
		
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
	
	@RequestMapping("/ownerReservCancel.do")
	public String ownerReservCancel(CommandMap map, HttpServletRequest request) {
		
		
		//String id = (String)session.getAttribute("id");
		
		String reservation_no = request.getParameter("reservation_no");
		//String shop_name = request.getParameter("shop_name");
		
		System.out.println("노"+reservation_no);
		//System.out.println("네"+shop_name);
		
		
		if(reservation_no != null) {
			map.put("reservation_no", reservation_no);
			
			
			mypageService.ownerReservCancel(map.getMap());
			System.out.println("삭제성공");
			return "redirect:/myPage_reservCheck.do";
		}else {
			System.out.println("삭제실패");
			return "redirect:/myPage_reservCheck.do";
		}
		
	}
	
	@RequestMapping("/ownerReservSuccess.do")
	public String ownerReservSuccess(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String reservation_no = request.getParameter("reservation_no");
		int shop_no = (int)session.getAttribute("shop_no");
		
		System.out.println("노"+reservation_no);
		System.out.println("샵넘버============================" + shop_no);
		if(reservation_no != null) {
			map.put("reservation_no", reservation_no);
			map.put("shop_no", shop_no);
			mypageService.ownerReservSuccess(map.getMap());
			System.out.println("예약성공");
			return "redirect:/myPage_reservCheck.do?shop_no="+shop_no;
		}else {
			System.out.println("예약실패");
			return "redirect:/myPage_reservCheck.do";
		}
		
	}
	
	
	
	
	@GetMapping("/myPage_reservCheck.do")
	public ModelAndView myPage_reservCheck(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage_reservCheck");
		HttpSession session = request.getSession();
		

		// *****페이징*****
		// 페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if (map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 3;// 리스트 크기
		int pageScale = 10;
		
		//id값 받아오기
		String id = (String)session.getAttribute("id");
		int shop_no = (int)session.getAttribute("shop_no");
		String shop_name = request.getParameter("shop_name");
		System.out.println("샵네임2"+shop_name);
		System.out.println("샵넘버==================="+shop_no);
		map.put("shop_name", shop_name);
		map.put("id", id);
		map.put("shop_no", shop_no);
		// 토탈 카운트
		int totalCount2 = mypageService.totalCount2(map.getMap());
		List<Map<String, Object>> ownerReservCheck = mypageService.ownerReservCheck(map.getMap());
		List<Map<String, Object>> list = mypageService.ownerReservList(map.getMap());
		//이걸 분리합니다.
		for (int i = 0; i < ownerReservCheck.size(); i++) {
			if(ownerReservCheck.get(i).get("reservation_status").equals("wait")) {
				mv.addObject("wait", ownerReservCheck.get(i).get("ownerReservCheck"));
			}else if(ownerReservCheck.get(i).get("reservation_status").equals("cancel")) {
				mv.addObject("cancel", ownerReservCheck.get(i).get("ownerReservCheck"));
			}else  if(ownerReservCheck.get(i).get("reservation_status").equals("success")) {
				mv.addObject("success", ownerReservCheck.get(i).get("ownerReservCheck"));
			}
		}
		mv.addObject("list",list);
		System.out.println("=================="+ ownerReservCheck);
		// 전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount2);

		// 계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();
		
		
		
		// DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);


		// 예약기능 출력하기
		List<Map<String, Object>> reservation2 = mypageService.reservation2(map.getMap());
		

		mv.addObject("reservation_list", reservation2);
		if (reservation2.size() > 0) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount2);
		mv.addObject("reservation2", reservation2);

		System.out.println(" " + "토탈카운트북마크 = " + ownerReservCheck);
		
		return mv;
	}
	
	@GetMapping("/myPage_board.do")
	public ModelAndView myPage_board(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("myPage_board");
		HttpSession session = request.getSession();

		map.put("member_id", session.getAttribute("member_id"));
		//*****페이징*****
		//페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 10;//리스트 크기
		int pageScale = 10;
				
		//토탈 카운트
		int totalCount3 = mypageService.totalCount3(map.getMap());
						
		//전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount3);
			
		//계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();
			
		//DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
		System.out.println("멤버아이디="+session.getAttribute("member_id"));
		List<Map<String, Object>> board = mypageService.mypageBoard(map.getMap());
		System.out.println(board + " 1!!!!!!!!!!!!!!!!!!!!1");

//		//질의
//		List<Map<String, Object>> list = mypageService.mypageBoard(map.getMap());
		
		//담기
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount3", totalCount3);
		mv.addObject("board", board);
//		mv.addObject("list", board);
		if(board.size() > 0 ) {
			System.out.println(map.getMap());
		}
						
		return mv;
	
	

	}

	

}
