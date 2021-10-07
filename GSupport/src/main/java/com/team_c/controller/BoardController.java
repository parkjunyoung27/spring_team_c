package com.team_c.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.BoardServiceImpl;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardServiceImpl boardService;
		
	@GetMapping("/board")
	public ModelAndView board(CommandMap map) {
		ModelAndView mv = new ModelAndView("board");

		//페이징
		//페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = Integer.parseInt(String.valueOf(map.get("pageNo")));
		}
		int listScale = 20;//리스트 크기
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
		mv.addObject("paginationInfo", paginationInfo);
		mv.addObject("pageNo", pageNo);
		mv.addObject("totalCount", totalCount);
				
		
		//보드 카테고리 불러오기		
		return mv;
	}

	
	
	@GetMapping("write.do")
	public ModelAndView write() throws Exception {
		ModelAndView mv = new ModelAndView("write");
		System.out.println("글쓰기");
		return mv;
	}
	
}
