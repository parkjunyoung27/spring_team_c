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

import com.team_c.service.AdminServiceImpl;
import com.team_c.util.Util;


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
			session.setAttribute("grade", map.get("member_grade"));
			result = 1;
		}
		
		PrintWriter pw = response.getWriter();
		pw.println(result);
	}
	
	//관리자 메인 페이지
	@GetMapping("/admin/adminMain.do")
	public ModelAndView main() throws Exception {
		ModelAndView mv = new ModelAndView("/admin/adminMain");
		//List<Map<String, Object>> list = indexService.boardList();
		//mv.addObject("list", list);
		return mv;
	}
	

}
