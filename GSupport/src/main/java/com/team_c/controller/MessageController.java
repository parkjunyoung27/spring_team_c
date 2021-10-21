package com.team_c.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.team_c.common.CommandMap;
import com.team_c.service.MessageServiceImpl;

@Controller
public class MessageController {
	@Resource(name="messageService")
	private MessageServiceImpl messageService;
	
	//@RequestMapping(value = "/message.do")
	@GetMapping("/message.do")
	public ModelAndView message(CommandMap map,  HttpServletRequest request) {
		System.out.println("map::::::::" + map.getMap() );
		ModelAndView mv = new ModelAndView("message");
		HttpSession session = request.getSession();
		//Map<String, Object> map = new HashMap<String, Object>();
		
		if(session.getAttribute("member_id") != null) {
			//데이터베이스 질의문
			map.put("member_id", session.getAttribute("member_id"));
			if(map.containsKey("openmsg")) {
				//읽음 처리를 먼저 해주세요.
				messageService.readMessage(map.getMap());//member_id, openmsg
				//사용자가 메시지를 읽기를 원함
				
				System.out.println("################### detail" );
				
				List<Map<String, Object>> detailList = 
						messageService.messageDetailList(map.getMap());//member_id, openmsg
				mv.addObject("detailList", detailList);
				
				System.out.println("################### detailList" );
			}
			//쪽지 리스트 불러오기
			List<Map<String, Object>> list = messageService.messageList(map.getMap());
			mv.addObject("list", list);
			
			System.out.println("################### list" );
			//답장하기를 눌렀을 때 해당 값을 다시 mv에 붙이기
			if(map.containsKey("sendmsg")) {
				//해당 번호로 아이디를 물어봐주세요.
				String sendmsg = messageService.getName(map.getMap());
				mv.addObject("sendmsg", sendmsg);
			}
			
		} else {
			//로그인 하지 않았다면 다시 로그인.do 로
			mv.setViewName("redirect:/login.do");
		}
		return mv;
	}
	
	
	
	@PostMapping("/message.do")
	public String sendMessage(CommandMap commandMap, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {//로그인 함
			//로그인 사용자 id = 보내는 사람
			commandMap.put("member_id", session.getAttribute("member_id"));

			//map에 있는 값 sendID / content / member_id
			messageService.sendMessage(commandMap.getMap());
			return "redirect:/message.do";
			
		}else {//로그인 하지 않았을 경우
			return "redirect:/login.do";
		}
	}
	
	//delMsg.do
	@PostMapping("/delMsg.do")
	public String delMsg(CommandMap commandMap, HttpServletRequest request) {
		//System.out.println(commandMap.getMap());//no가 옵니다.
		HttpSession session = request.getSession();
		if(session.getAttribute("member_id") != null) {//로그인 함
			commandMap.put("member_id", session.getAttribute("member_id"));
			messageService.delMsg(commandMap.getMap());
			
			return "redirect:/message.do";
		}else {
			return "redirect:/login.do";
		}
	}
	
}
/*
쪽지 삭제 

로그아웃

로그남기기 - 보드, 글읽기, 로그인, 로그아웃, 글쓰기 



*/
