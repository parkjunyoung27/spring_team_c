package com.team_c.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.AdminDAO;

@Service("adminService")
public class AdminServiceImpl implements AdminService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<Map<String, Object>> shopList() {
		return null;
	}

	@Override
	public Map<String, Object> access(Map<String, Object> map) {
		return adminDAO.access(map);
	}

	@Override
	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return adminDAO.logList(map);
	}

	@Override
	public int totalCount(Map<String, Object> map) {
		return adminDAO.totalCount(map);
	}



	
}
