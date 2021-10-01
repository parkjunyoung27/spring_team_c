package com.team_c.dao;

import java.util.ArrayList;
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

	
	

	
}
