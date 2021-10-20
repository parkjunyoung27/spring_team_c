package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.BoardServiceImpl;
import com.team_c.util.FileSave;
import com.team_c.util.Util;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSave fileSave;//
	@Autowired
	private BoardServiceImpl boardService;
	@Autowired
	private Util util;
		
	@GetMapping("/board")
	public ModelAndView board(CommandMap map) {
		ModelAndView mv = new ModelAndView("board");
		
		//*****카테고리*****
		//게시판 이름 불러오기
		String boardName = boardService.boardCate(map);
		mv.addObject("board_name", boardName);
		
		//board_cate보내기
		int board_cate = 0;
		if(map.containsKey("categoryNo")) {//키값이 있느냐 없느냐 물어보는부분 있으면 true반환 없으면 false 반환
			board_cate = util.toInt(map.get("categoryNo"));//유틸 만들어 놓기.
		}else {
			map.put("categoryNo", board_cate);
		}
		mv.addObject("categoryNo", board_cate);

		//*****검색기능*****
		//출력해보기
		System.out.println("search 값 : " + map.getMap());//search값이 오는지 확인
		
		//검색값을 jsp로 넘기기
		if(map.containsKey("searchName")) {
			mv.addObject("searchName", map.get("searchName"));
			mv.addObject("search", map.get("search"));
		}
		
		//*****페이징*****
		//페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 10;//리스트 크기
		int pageScale = 10;
				
		//토탈 카운트
		int totalCount = boardService.totalCount(map.getMap());
				
		//전자정부 페이징 불러오기
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(pageNo);
		paginationInfo.setRecordCountPerPage(listScale);
		paginationInfo.setPageSize(pageScale);
		paginationInfo.setTotalRecordCount(totalCount);
			
		//계산하기
		int startPage = paginationInfo.getFirstRecordIndex();
		int lastPage = paginationInfo.getRecordCountPerPage();
			
		//DB로 보내기 위해서 map에 담아주세요.
		map.put("startPage", startPage);
		map.put("lastPage", lastPage);
				
		//질의
		List<Map<String, Object>> boardList = boardService.boardList(map.getMap());
		
		//담기
		mv.addObject("list", boardList);
		if(boardList.size() > 0 ) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
				
		//*****
		
		
		System.out.println("현재 맵목록 : "+ map.getMap());
		return mv;
	}
	
	//글쓰기
	//서버 -> 클라이언트
	@GetMapping("/write")
	public String write(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		//세션 확인
		if (session.getAttribute("member_id") != null) {
			return "write";
		} else {
			return "redirect:/board.do?categoryNo=" + request.getParameter("categoryNo");
		}
		
	}
	//클라이언트 -> 서버
	@PostMapping("/write")
	public String write2(CommandMap map, MultipartFile file, HttpServletRequest request, HttpSession session) throws Exception {
		
		//map에 넣어서 출력
		map.put("board_title", request.getParameter("board_title"));
		map.put("board_content", request.getParameter("content"));
		map.put("board_orifile", file.getOriginalFilename());
		map.put("member_name", session.getAttribute("name"));
		
		//파일 저장하기
		//경로지정
		String realPath = servletContext.getRealPath("resources/upfile/");
		realPath = realPath + "upload";
		System.out.println("경로 = " + realPath);
		String realFileName = fileSave.save2(realPath, file);
		
		map.put("board_file", realFileName);
		
		boardService.write(map.getMap());
		return "redirect:/board.do?categoryNo=" + map.getMap().get("board_cate");
	}
	
	@GetMapping("/detail")
	public ModelAndView detail(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("detail");
		Map<String, Object> detail = boardService.detail(map.getMap());
		mv.addObject("detail", detail);

		return mv;
	}
	
	@GetMapping("/update")
	public ModelAndView update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("update");
		//글 번호 가져오기
		//int bno = Integer.parseInt(request.getParameter("bno"));
		
		//TestDTO dto = testService.detail(bno);
		//mv.addObject("dto", dto);
		
		return mv;
	}
	
	
}
