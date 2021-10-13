package com.team_c.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.StoreDAO;

@Service("storeService")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDAO storeDAO;

	public ArrayList<Map<String, Object>> jongnoStoreList() {
		return storeDAO.jongnoStoreList();
	}

	public Map<String, Object> storeDetail(Map<String, Object> map) {
		return storeDAO.storeDetail(map);
	}

	public int storeReserv(Map<String, Object> map) {
		return storeDAO.storeReserv(map);
	}

	public List<Map<String, Object>> storeList(Map<String, Object> map) {
		return storeDAO.storeList(map);
	}

	public ArrayList<Map<String, Object>> storeGuList(Map<String, Object> map) {
		return storeDAO.storeGuList(map);
	}

	public int totalCount(Map<String, Object> map) {
		return storeDAO.totalCount(map);
	}

	public void storeLike(Map<String, Object> map) {
		int result = storeDAO.storeLikeCheck(map);
		if(result == 0) {
			storeDAO.storeLike(map);
		}else if (result == 1) {
			storeDAO.storeDislike(map);
		}
	}

	public int likeList(Map<String, Object> map) {
		return storeDAO.likeList(map);
	}

	/*
	 * public void storeDislike(Map<String, Object> map) { int result =
	 * storeDAO.storeLikeCheck(map); if(result == 1) {
	 * 
	 * } }
	 */

	
	
}
