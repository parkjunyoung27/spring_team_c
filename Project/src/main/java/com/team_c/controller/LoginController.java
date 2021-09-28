package com.team_c.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team_c.common.CommandMap;
import com.team_c.service.KakaoLoginService;
import com.team_c.service.LoginServiceImpl;

@Controller
public class LoginController {
	@Resource(name = "loginService")
	private LoginServiceImpl loginService;

	@Autowired
	private KakaoLoginService kakaoLoginService;

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
		session.setAttribute("authUser", login.get("member_channel"));
		return "redirect:/index.do";
	}

	@GetMapping("/kakaoLogin.do")
	public String login(HttpServletResponse response, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		String authorize_code = request.getParameter("code");
		System.out.println(authorize_code);

		String access_Token = kakaoLoginService.getAccessToken(authorize_code);

		HashMap<String, Object> userInfo = kakaoLoginService.getKakaoUserInfo(access_Token);

		String email = userInfo.get("email").toString();

		// 기존 회원인지 확인
		int emailCheck = loginService.emailCheck(email);

		System.out.println("emailCheck : " + emailCheck);

		if (emailCheck != 1) {
			session.setAttribute("joinChannel", "kakao");
			session.setAttribute("memberEmail", email);
			return "redirect:/join.do";
		}

		Map<String, Object> login = loginService.loginByEmail(email);

		System.out.println("login : " + login);
		session.setAttribute("name", login.get("member_name"));
		session.setAttribute("id", login.get("member_id"));
		session.setAttribute("authUser", login.get("member_channel"));
		return "redirect:/index.do";
	}

}