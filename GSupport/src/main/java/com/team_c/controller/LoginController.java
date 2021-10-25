package com.team_c.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

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

import com.fasterxml.jackson.databind.JsonNode;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.team_c.common.CommandMap;
import com.team_c.service.GoogleLoginService;
import com.team_c.service.KakaoLoginService;
import com.team_c.service.LoginServiceImpl;

@Controller
public class LoginController {
	private static final String GOOGLE_CLIENT_ID = "883272106142-4gqb73kjc3q4c1gbr34na98dp4usff37.apps.googleusercontent.com";
	private static final String GOOGLE_REDIRECT_URI = "http://localhost:8080/GSupport/googleCallBack.do";

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
		return "redirect:/index.do?login=timeout";
	}

	@PostMapping("/login.do")
	public String login(CommandMap commandMap, HttpServletRequest request) {

		Map<String, Object> login = loginService.login(commandMap.getMap());
		System.out.println("나온 값 : " + login);

		if (login == null) {
			return "redirect:/index.do?login=fail";
		}
		
		
		HttpSession session = request.getSession();
		session.setAttribute("name", login.get("member_name"));
		session.setAttribute("id", login.get("member_id"));
		session.setAttribute("email", login.get("member_email"));
		session.setAttribute("member_id", login.get("member_id"));
		session.setAttribute("member_no", login.get("member_no"));
		session.setAttribute("authUser", login.get("member_channel"));
		session.setAttribute("grade", login.get("member_grade"));
		session.setAttribute("shop_no", login.get("shop_no"));
		return "redirect:/index.do";
	}

	
	@GetMapping("/member.do")
	public String member() {
		return "member";
	}
	
	@PostMapping("/findMember.do")
	public void findMember(HttpServletResponse response, HttpServletRequest request, @RequestParam String email) throws Exception {
		
		
		Map<String, Object> channel = loginService.loginByEmail(email);

		HttpSession session = request.getSession();
		session.setAttribute("joinChannel", channel.get("member_channel"));
		
	}
	
	@PostMapping("/setNewPw.do")
	public String setNewPw(CommandMap map, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		System.out.println("map::::::::" + map.getMap() );
		Map<String, Object> setNewPw = loginService.setNewPw(map.getMap());
		System.out.println(setNewPw);
	
		return "redirect:/index.do?login=updated";
	}
	
	
	@GetMapping("/kakaoLogin.do")
	public String login(HttpServletResponse response, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		String authorize_code = request.getParameter("code");
//		System.out.println(authorize_code);

		String access_Token = kakaoLoginService.getAccessToken(authorize_code);

		HashMap<String, Object> userInfo = kakaoLoginService.getKakaoUserInfo(access_Token);

		String email = userInfo.get("email").toString();

		/* oAuth 임의 비밀번호을 토큰의 일부로 사용 */
		Random random = new Random();
		int randomValue = random.nextInt(10);
		String memberPw = access_Token.toString().substring(0, randomValue);

		// 기존 회원인지 확인
		int emailCheck = loginService.emailCheck(email);

//		System.out.println("emailCheck : " + emailCheck);

		if (emailCheck != 1) {
			session.setAttribute("joinChannel", "kakao");
			session.setAttribute("memberEmail", email);
			session.setAttribute("memberPw", memberPw);
			return "redirect:/index.do";
		}

		Map<String, Object> login = loginService.loginByEmail(email);

//		System.out.println("login : " + login);
		session.setAttribute("name", login.get("member_name"));
		session.setAttribute("id", login.get("member_id"));
		session.setAttribute("member_id", login.get("member_id"));
		session.setAttribute("authUser", login.get("member_channel"));
		session.setAttribute("grade", login.get("member_grade"));
		session.setAttribute("member_no", login.get("member_no"));
		session.setAttribute("shop_no", login.get("shop_no"));
		return "redirect:/index.do";
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverlogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void login(HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		res.sendRedirect(naverAuthUrl);

	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException {
//		System.out.println("****************** callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
		model.addAttribute("result", apiResult);
		System.out.println("result" + apiResult);
		/* 네이버 로그인 성공 페이지 View 호출 */
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(apiResult);

		JsonObject responseObj = element.getAsJsonObject().get("response").getAsJsonObject();

		String email = responseObj.getAsJsonObject().get("email").getAsString();

		/* oAuth 임의 비밀번호을 토큰의 일부로 사용 */
		Random random = new Random();
		int randomValue = random.nextInt(10);
		String memberPw = oauthToken.toString().substring(0, randomValue);

		// 기존 회원인지 확인
		int emailCheck = loginService.emailCheck(email);
		
		if (emailCheck != 1) {
			session.setAttribute("joinChannel", "naver");
			session.setAttribute("memberEmail", email);
			session.setAttribute("memberPw", memberPw);
			return "redirect:/index.do";
		}
		Map<String, Object> login = loginService.loginByEmail(email);

//		System.out.println("login : " + login);
		session.setAttribute("name", login.get("member_name"));
		session.setAttribute("id", login.get("member_id"));
		session.setAttribute("member_id", login.get("member_id"));
		session.setAttribute("authUser", login.get("member_channel"));
		session.setAttribute("grade", login.get("member_grade"));
		session.setAttribute("shop_no", login.get("shop_no"));
		session.setAttribute("member_no", login.get("member_no"));
		return "redirect:/index.do";
	}

	@RequestMapping("/googleLogin.do")
	public void googleLogin(HttpSession session, HttpServletRequest req, HttpServletResponse res) throws Exception {

		// 구글 로그인 URL 생성
		String googleUrl = "https://accounts.google.com/o/oauth2/v2/auth?" + "scope=email" + "&response_type=code"
				+ "&state=security_token%3D138r5719ru3e1%26url%3Dhttps://oauth2.example.com/token" + "&client_id="
				+ GOOGLE_CLIENT_ID + "&redirect_uri=" + GOOGLE_REDIRECT_URI + "&access_type=offline";

		res.sendRedirect(googleUrl);
	}

	// 구글 로그인 콜백
	@RequestMapping(value = "/googleCallBack.do")
	public String googleLogin(@RequestParam("code") String code, HttpSession session, Model model) throws Exception {

		// 코드 확인
		System.out.println("code : " + code);

		// Access Token 발급
		JsonNode jsonToken = GoogleLoginService.getAccessToken(code);
		String accessToken = jsonToken.get("access_token").toString();
//		String refreshToken = "";
//		if (jsonToken.has("refresh_token")) {
//			refreshToken = jsonToken.get("refresh_token").toString();
//		}
//		String expiresTime = jsonToken.get("expires_in").toString();

		// Access Token으로 사용자 정보 반환
		JsonNode userInfo = GoogleLoginService.getGoogleUserInfo(accessToken);
		System.out.println(userInfo.toString());

		String email = userInfo.get("email").asText();

		///* oAuth 임의 비밀번호을 토큰의 일부로 사용 */
		Random random = new Random();
		int randomValue = random.nextInt(10);
		String memberPw = accessToken.toString().substring(0, randomValue);
		
		// 기존 회원인지 확인
		int emailCheck = loginService.emailCheck(email);
		
		System.out.println("#############################" + emailCheck);

		if (emailCheck != 1) {
			session.setAttribute("joinChannel", "google");
			session.setAttribute("memberEmail", email);
			session.setAttribute("memberPw", memberPw);
			
			return "redirect:/index.do";
		}
		
		Map<String, Object> login = loginService.loginByEmail(email);

		session.setAttribute("name", login.get("member_name"));
		session.setAttribute("id", login.get("member_id"));
		session.setAttribute("member_id", login.get("member_id"));
		session.setAttribute("authUser", login.get("member_channel"));
		session.setAttribute("grade", login.get("member_grade"));
		session.setAttribute("shop_no", login.get("shop_no"));
		session.setAttribute("member_no", login.get("member_no"));

		return "redirect:/index.do";
	}

}