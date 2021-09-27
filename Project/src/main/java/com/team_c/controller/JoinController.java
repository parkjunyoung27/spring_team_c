package com.team_c.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.team_c.common.CommandMap;
import com.team_c.service.JoinServiceImpl;

@Controller
public class JoinController {
	@Resource(name = "joinService")
	private JoinServiceImpl joinService;

	@GetMapping("/join.do")
	public String join() {
		return "join";
	}

	@PostMapping("/join.do")
	public String join(CommandMap commandMap, HttpServletRequest request) {
		System.out.println(commandMap.getMap());

		Map<String, Object> join = joinService.join(commandMap.getMap());
				
		HttpSession session = request.getSession();
		return "redirect:/index.do";
	}

}