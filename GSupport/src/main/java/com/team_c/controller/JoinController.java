package com.team_c.controller;

import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.UrlPathHelper;

import com.team_c.common.CommandMap;
import com.team_c.service.JoinServiceImpl;

@Controller
public class JoinController {
	@Resource(name = "joinService")
	private JoinServiceImpl joinService;

	@Autowired
	private JavaMailSender mailSender;

	@GetMapping("/join.do")
	public String join(HttpServletRequest request) {
		HttpSession session = request.getSession();

//		System.out.println(session.getAttribute("joinChannel"));
//		System.out.println(session.getAttribute("joinChannel") != null);

		if (session.getAttribute("joinChannel") != null) {
			
			return "redirect:/oAuthJoin.do";
		}

		return "join";
	}

	@GetMapping("/oAuthJoin.do")
	public String oAuthJoin(HttpServletRequest request) {
//		UrlPathHelper urlPathHelper = new UrlPathHelper();
//		String originalURL = urlPathHelper.getOriginatingRequestUri(request);
//		System.out.print("OriginalURL ==>" + originalURL  );
//		String before = request.getHeader("referer");
//		System.out.println("*****************" + before);
		return "redirect:/index.do";
	}

	@PostMapping("/join.do")
	public String join(CommandMap commandMap, HttpServletRequest request) {

		System.out.println(commandMap.getMap());

		Map<String, Object> join = joinService.join(commandMap.getMap());
		System.out.println(join);

//		HttpSession session = request.getSession();
		return "redirect:/index.do";
	}

	@PostMapping("/oAuthJoin.do")
	public String oAuthJoin(CommandMap commandMap, HttpServletRequest request) {

		System.out.println(commandMap.getMap());

		Map<String, Object> join = joinService.join(commandMap.getMap());
		System.out.println(join);

//		HttpSession session = request.getSession();
		return "redirect:/index.do";
	}
	
	@GetMapping("/emailCount.do")
	@ResponseBody
	public int emailCount(String email) {
		int emailCount = joinService.emailCheck(email);
		return emailCount;
	}
	
	@GetMapping("/nameCount.do")
	@ResponseBody
	public int nameCount(String name) {
		int nameCount = joinService.nameCheck(name);
		return nameCount;
	}

	@GetMapping("/emailCheck.do")
	public String mailCheck() {
		return "emailtest";
	}

	@GetMapping("/mailCheck.do")
	@ResponseBody
	public int mailCheckGET(String email) throws Exception {
		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호 이메일 : " + email);

		/* 인증번호(난수) 생성 */
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + checkNum);

		/* 이메일 보내기 */
		String setFrom = "teamcgsupp0rt@gmail.com";
		String toMail = email;
		String title = "회원가입 인증 이메일 입니다.";
		String content = "홈페이지를 방문해주셔서 감사합니다." + "<br><br>" + "인증 번호는 " + checkNum + "입니다." + "<br>"
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		try {

			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			mailSender.send(message);

			return checkNum;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}

}