package com.team_c.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO extends AbstractDAO{

	public ArrayList<Map<String, Object>> jongnoStoreList() {
		return (ArrayList<Map<String, Object>>) selectList("store.jongnoStoreList");
	}

	public Map<String, Object> storeDetail(Map<String, Object> map) {
		return selectOne("store.storeDetail", map);
	}

	public int storeReserv(Map<String, Object> map) {
		return Insert("store.storeReserv", map);
	}

	public List<Map<String, Object>> storeList(Map<String, Object> map) {
		return selectList("store.storeList", map);
	}

	public ArrayList<Map<String, Object>> storeGuList(Map<String, Object> map) {
		return (ArrayList<Map<String, Object>>) selectList("store.storeGuList", map);
	}

	public int totalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("store.totalCount", map).get("totalCount")));
	}

	public void storeLike(Map<String, Object> map) {
		update("store.storeLike", map);
	}

	

	
	

	
}
