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
		if(map.containsKey("categoryNo")) {
			board_cate = util.toInt(map.get("categoryNo"));
		}else {
			map.put("categoryNo", board_cate);
		}
		mv.addObject("categoryNo", board_cate);

		//*****검색기능*****		
		//검색값을 jsp로 넘기기
		if(map.containsKey("searchName")) {
			mv.addObject("searchName", map.get("searchName"));
			mv.addObject("search", map.get("search"));
		}
		
		//*****페이징*****
		//페이지 번호가 오는지 확인하기
		int pageNo = 1;
		if(map.containsKey("pageNo")) {
			pageNo = util.toInt(map.get("pageNo"));
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

						
		return mv;
	}
	@PostMapping("/board")
	public ModelAndView board2(CommandMap map) {
		ModelAndView mv = new ModelAndView("board");
		int commentTotalCount = boardService.commentTotalCount(map.getMap());
		mv.addObject("commentTotalCount", commentTotalCount);
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
		map.put("board_content", request.getParameter("board_content"));
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
		
		//질의
		Map<String, Object> detail = boardService.detail(map.getMap());
		List<Map<String, Object>> commentList = boardService.commentList(map.getMap());
		int commentTotalCount = boardService.commentTotalCount(map.getMap());
		
		//담기
		mv.addObject("detail", detail);
		mv.addObject("commentList", commentList);
		mv.addObject("commentTotalCount", commentTotalCount);

		return mv;
	}
	
	@GetMapping("/summernote")
	public String chat() {
      return "./component/summernote";
	}
	
	@GetMapping("/update")
	public ModelAndView update(CommandMap map, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("update");
		
		//글번호 가져오기
		Map<String, Object> update = boardService.detail(map.getMap());
		mv.addObject("update", update );
		return mv;
	}
	
	@PostMapping("/update")
	public String update2(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		//세션인증
		if (session.getAttribute("member_id") != null) {
			map.put("member_id", session.getAttribute("member_id"));
			map.put("member_grade", session.getAttribute("grade"));
			boardService.update(map.getMap());
						
			return "redirect:/detail.do?categoryNo=" + map.getMap().get("board_cate") + "&board_no=" + map.getMap().get("board_no");
		} else {
			return "redirect:/board.do?categoryNo=" + map.getMap().get("board_cate");
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("board_no") int board_no, HttpServletRequest request, CommandMap map) {
		HttpSession session = request.getSession();
		
		map.put("member_id", session.getAttribute("member_id"));
		map.put("member_grade", session.getAttribute("grade"));
		if (session.getAttribute("member_id") != null) {
			int result = boardService.delete(map.getMap());
			System.out.println("삭제 결과 : " + result );


			return "redirect:/board.do?categoryNo=" + map.getMap().get("categoryNo");
		}else {
			return "redirect:/login.do";
		}
	}
	
	@PostMapping("/commentWrite")
	public String commentWrite(CommandMap map, HttpServletRequest request, HttpSession session) {

		//map에 넣기
		map.put("member_no", session.getAttribute("member_no"));
		
		//질의
		boardService.commentWrite(map.getMap());

		return "redirect:/detail.do?categoryNo=" + map.get("categoryNo") + "&board_no=" + map.get("board_no");
	}

	@PostMapping("/comment_update")
	public String comment_update(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		//세션인증
		if (session.getAttribute("member_no") != null) {
			map.put("member_no", session.getAttribute("member_no"));
			map.put("member_grade", session.getAttribute("grade"));
			boardService.comment_update(map.getMap());
						
			return "redirect:/detail.do?categoryNo=" + map.getMap().get("board_cate") + "&board_no=" + map.getMap().get("board_no");
		} else {
			return "redirect:/board.do?categoryNo=" + map.getMap().get("board_cate");
		}
	}
	
	@GetMapping("/comment_delete")
	public String comment_delete(@RequestParam("board_cno") int board_cno, HttpServletRequest request, CommandMap map) {
		HttpSession session = request.getSession();
		map.put("member_no", session.getAttribute("member_no"));
		map.put("member_grade", session.getAttribute("grade"));
		if (session.getAttribute("member_id") != null) {
			int result = boardService.comment_delete(map.getMap());
			System.out.println("삭제 결과 : " + result );

			return "redirect:/detail.do?categoryNo="+map.get("categoryNo")+"&&board_no="+map.get("board_no");
		}else {
			return "redirect:/login.do";
		}
	}

}
