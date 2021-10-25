package com.team_c.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{


	public Map<String, Object> login(Map<String, Object> map) {
		return selectOne("login.login", map);
	}
	
	public Map<String, Object> loginByEmail(String email) {
		return selectOneByEmail("login.loginByEmail", email);
	}
	
	public int emailCheck(String email) {
		return (int) selectOne("login.emailCheck", email);
	}
	
	public Map<String, Object> setNewPw(Map<String, Object> map) {
		return selectOneByEmailForPw("login.setNewPw", map);
	}
}