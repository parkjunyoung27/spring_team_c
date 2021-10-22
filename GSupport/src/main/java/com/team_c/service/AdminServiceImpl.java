package com.team_c.service;

import java.util.ArrayList;
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

	@Override
	public List<Object> ipList() {
		return adminDAO.ipList();
	}

	@Override
	public List<Object> targetList() {
		return adminDAO.targetList();
	}

	@Override
	public void deleteLog(String number) {
		adminDAO.deleteLog(number);
	}

	@Override
	public Map<String, Object> dashList() {
		return adminDAO.dashList();
	}

	@Override
	public List<Object> guList() {
		return adminDAO.guList();
	}

	@Override
	public List<Map<String, Object>> shopList(Map<String, Object> map) {
		return adminDAO.shopList(map);
	}

	@Override
	public int shopNowTotalCount(Map<String, Object> map) {
		return adminDAO.shopNowTotalCount(map);
	}

	@Override
	public void deleteShop(String number) {
		adminDAO.deleteShop(number);
	}

	@Override
	public List<Object> channelList() {
		return adminDAO.channelList();
	}

	@Override
	public List<Object> gradeList() {
		return adminDAO.gradeList();
	}

	public int memberTotalCount(Map<String, Object> map) {
		return adminDAO.memberTotalCount(map);
	}

	@Override
	public List<Map<String, Object>> memberList(Map<String, Object> map) {
		return adminDAO.memberList(map);
	}

	@Override
	public int shopAllowTotalCount(Map<String, Object> map) {
		return adminDAO.shopAllowTotalCount(map);
	}

	@Override
	public List<Map<String, Object>> shopRegisterViewList(Map<String, Object> map) {
		return adminDAO.shopRegisterViewList(map);
	}

	@Override
	public void registerShop(String number) {
		adminDAO.registerShop(number);
	}

	@Override
	public int adminBoardTotalCount(Map<String, Object> map) {
		return adminDAO.adminBoardTotalCount(map);
	}

	public List<Map<String, Object>> adminBoardList(Map<String, Object> map) {
		return adminDAO.adminBoardList(map);
	}

	@Override
	public void deleteAdminBoard(String number) {
		adminDAO.deleteAdminBoard(number);
	}






	

	
}
