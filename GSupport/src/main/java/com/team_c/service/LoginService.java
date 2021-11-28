package com.team_c.service;

import java.util.Map;

public interface LoginService {

	public Map<String, Object> login(Map<String, Object> map);

	public Map<String, Object> loginByEmail(String email);

	public Map<String, Object> setNewPw(Map<String, Object> map);
	
	int emailCheck(String email);
}
