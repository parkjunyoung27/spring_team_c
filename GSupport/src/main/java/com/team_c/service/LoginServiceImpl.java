package com.team_c.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.LoginDAO;

@Service("loginService")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginDAO loginDAO;

	@Override
	public Map<String, Object> login(Map<String, Object> map) {
		return loginDAO.login(map);
	}

	@Override
	public int emailCheck(String email) {
		return loginDAO.emailCheck(email);
	}

	@Override
	public Map<String, Object> loginByEmail(String email) {
		return loginDAO.loginByEmail(email);
	}
	
}
