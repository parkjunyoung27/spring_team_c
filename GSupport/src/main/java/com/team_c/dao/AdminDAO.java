package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO extends AbstractDAO{

	public Map<String,Object> access(Map<String, Object> map){
		return selectOne("admin.access", map);
	}

	public List<Map<String, Object>> logList(Map<String, Object> map) {
		return selectList("admin.logList", map);
	}

	public int totalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("admin.totalCount", map).get("totalCount")));
	}

	public List<Object> ipList() {
		return selectOptionList("admin.ipList");
	}

	public List<Object> targetList() {
		return selectOptionList("admin.targetList");
	}

	public void deleteLog(String number) {
		deleteLog("admin.deleteLog", number);
	}

	public Map<String, Object> dashList() {
		return selectOne("admin.dashList");
	}

	public List<Object> guList() {
		return selectOptionList("admin.guList");
	}

	public List<Map<String, Object>> shopList(Map<String, Object> map) {
		return selectList("admin.shopList", map);
	}


	public int shopNowTotalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("admin.shopNowTotalCount", map).get("totalCount")));
	}

	public void deleteShop(String number) {
		deleteLog("admin.deleteShop", number);
	}

	public List<Object> channelList() {
		return selectOptionList("admin.channelList");
	}

	public List<Object> gradeList() {
		return selectOptionList("admin.gradeList");
	}

	public int memberTotalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("admin.memberTotalCount", map).get("totalCount")));
	}

	public List<Map<String, Object>> memberList(Map<String, Object> map) {
		return selectList("admin.memberList", map);
	}

	public int shopAllowTotalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("admin.shopAllowTotalCount", map).get("totalCount")));
	}

	public List<Map<String, Object>> shopRegisterViewList(Map<String, Object> map) {
		return selectList("admin.shopRegisterViewList", map);
	}

	public void registerShop(String number) {
		registerShop("admin.registerShop", number);
	}

	public int adminBoardTotalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("admin.adminBoardTotalCount", map).get("totalCount")));
	}

	public List<Map<String, Object>> adminBoardList(Map<String, Object> map) {
		return selectList("admin.adminBoardList", map);
	}

	public void deleteAdminBoard(String number) {
		 deleteLog("admin.deleteAdminBoard", number);
	}
	
}
