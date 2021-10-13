package com.team_c.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO extends AbstractDAO{

	public Map<String,Object> access(Map<String, Object> map){
		return selectOne("admin.access", map);
	}
	
	
	
	
}
