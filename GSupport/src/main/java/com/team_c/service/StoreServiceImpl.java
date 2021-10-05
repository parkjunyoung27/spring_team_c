package com.team_c.service;

import java.util.ArrayList;
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

	public ArrayList<Map<String, Object>> storeList(Map<String, Object> map) {
		return storeDAO.storeList(map);
	}

	public ArrayList<Map<String, Object>> storeGuList(Map<String, Object> map) {
		return storeDAO.storeGuList(map);
	}

	
	
}
