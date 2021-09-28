package com.team_c.service;

import java.util.Map;

public interface LoginService {

	public Map<String, Object> login(Map<String, Object> map);

	public Map<String, Object> loginByEmail(String email);

	int emailCheck(String email);
}
