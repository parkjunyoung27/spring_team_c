package com.team_c.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println("보드네임 : " + boardName);
		mv.addObject("board_name", boardName);
		
		//board_cate보내기
		int board_cate = 0;
		if(map.containsKey("boardNo")) {//키값이 있느냐 없느냐 물어보는부분 있으면 true반환 없으면 false 반환
			board_cate = Integer.parseInt(String.valueOf(map.get("boardNo")));//유틸 만들어 놓기.
		}else {
			map.put("boardNo", board_cate);
		}
		mv.addObject("boardNo", board_cate);

		//*****검색기능*****
		//출력해보기
		System.out.println(map.getMap());//search값이 오는지 확인
		
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
		List<Map<String, Object>> list = boardService.boardList(map.getMap());
		
		//담기
		mv.addObject("list", list);
		if(list.size() > 0 ) {
			System.out.println(map.getMap());
		}
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
				
		//*****
		
		
		System.out.println("현재 맵목록 : "+ map.getMap());
		return mv;
	}

	@GetMapping(value="/write")
	public String write() {
		//세션검사 필요
		return "write";
	}
	@PostMapping(value="/write")
	public String write(CommandMap map, MultipartFile file, HttpServletRequest request) throws IOException {
		
		System.out.println("request : " + request.getParameter("title"));
		System.out.println("request : " + request.getParameter("content"));
		//System.out.println("request : " + request.getParameter("file"));
		System.out.println("mpf : " + file.getOriginalFilename());
		
		//map에 넣어서 출력
		map.put("title", request.getParameter("title"));
		map.put("content", request.getParameter("content"));
		
		//파일 저장하기
		//경로지정
		String realPath = servletContext.getRealPath("resource/");
		realPath = realPath + "upload";
		System.out.println("경로" + realPath);
		String realFileName = fileSave.save(realPath, file);
		
		map.put("realFileName", realFileName);
		//일단 출력만 먼저합니다.
		System.out.println("map : " + map.getMap());
		return "redirect:./board.do?boardNo=1";
	}
	
	@GetMapping("/detail")
	public String detail() {
		return "detail";
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
