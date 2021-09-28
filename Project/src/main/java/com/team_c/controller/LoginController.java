package com.team_c.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.team_c.common.CommandMap;
import com.team_c.service.KakaoLoginService;
import com.team_c.service.LoginServiceImpl;

@Controller
public class LoginController {
	@Resource(name = "loginService")
	private LoginServiceImpl loginService;

	@Autowired
	private KakaoLoginService kakaoLoginService;

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

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

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		// redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "naverLogin";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
		System.out.println("****************** callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		model.addAttribute("result", apiResult);
		System.out.println("result" + apiResult);
		/* 네이버 로그인 성공 페이지 View 호출 */
//      JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//      String snsId = jsonparse.JsonToString(jsonobj, "id");

//      String name = jsonparse.JsonToString(jsonobj, "name");
//
//      UserVO vo = new UserVO();
//      vo.setUser_snsId(snsId);
//      vo.setUser_name(name);
//
//      System.out.println(name);
//      try {
//          vo = service.naverLogin(vo);
//      } catch (Exception e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }

//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);

		return "nidSuccess";
	}

}