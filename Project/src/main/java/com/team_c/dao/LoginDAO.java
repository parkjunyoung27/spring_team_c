package com.team_c.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO extends AbstractDAO{

	public Map<String, Object> login(Map<String, Object> map) {
		return selectOne("login.login", map);
	}
}