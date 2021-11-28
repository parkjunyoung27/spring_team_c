package com.team_c.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.JoinDAO;

@Service("joinService")
public class JoinServiceImpl implements JoinService {
	@Autowired
	private JoinDAO joinDAO;

	@Override
	public Map<String, Object> join(Map<String, Object> map) {
		return joinDAO.join(map);
	}
	
	@Override
	public int emailCheck(String email) {
		return joinDAO.emailCheck(email);
	}

	public int nameCheck(String name) {
		return joinDAO.nameCheck(name);
	}

}
