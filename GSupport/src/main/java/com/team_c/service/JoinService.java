package com.team_c.service;

import java.util.Map;

public interface JoinService {

	public Map<String, Object> join(Map<String, Object> map);

	int emailCheck(String email);
	
	int nameCheck(String name);
}
