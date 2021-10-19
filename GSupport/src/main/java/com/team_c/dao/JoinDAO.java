package com.team_c.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("joinDAO")
public class JoinDAO extends AbstractDAO{

	public Map<String, Object> join(Map<String, Object> map) {
		return selectOne("join.join", map);
	}

	public int emailCheck(String email) {
		return (int) selectOne("join.emailCheck", email);
	}
	
	public int nameCheck(String name) {
		return (int) selectOne("join.nameCheck", name);
	}
}