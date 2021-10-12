package com.team_c.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("MypageDAO")
public class MypageDAO extends AbstractDAO {

	public List<Map<String, Object>> reservation(Map<String, Object> map) {
		return selectList("myPage.reservation", map);
	}

	public int totalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("myPage.totalCount", map).get("totalCount")));
	}

	public void mypageUpdate(Map<String, Object> map) {
		update("myPage.mypageUpdate", map);
	}
	
	public void mypageDelete(Map<String, Object> map) {
		delete("myPage.mypageDelete", map);
	}

	public ArrayList<Map<String, Object>> mypageList() {
		return null;
	}

}
