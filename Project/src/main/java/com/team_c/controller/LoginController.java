package com.team_c.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team_c.common.CommandMap;
import com.team_c.service.LoginServiceImpl;

@Controller
public class LoginController {
	@Resource(name = "loginService")
	private LoginServiceImpl loginService;

	@GetMapping("/login.do")
	public String login() {
		return "login";
	}

	@PostMapping("/login.do")
	public String login(CommandMap commandMap, HttpServletRequest request) {
		
		Map<String, Object> login = loginService.login(commandMap.getMap());
		System.out.println("나온 값 : " + login);
		
		HttpSession session = request.getSession();
		session.setAttribute("name", login.get("member_name"));
		session.setAttribute("id", login.get("member_id"));
		session.setAttribute("channel", login.get("member_channel"));
		return "redirect:/index.do";
	}
	
	@GetMapping("/logout.do")
	public String logout(CommandMap commandMap, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		session.invalidate();
		System.out.println("************** 로그아웃 성공");
		return "redirect:/index.do";
	}

}