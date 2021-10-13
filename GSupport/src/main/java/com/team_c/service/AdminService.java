package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface AdminService {
	
	List<Map<String, Object>> shopList();
	
	//관리자 login
	Map<String, Object> access(Map<String, Object> map);
}
