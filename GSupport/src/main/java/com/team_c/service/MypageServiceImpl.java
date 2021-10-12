package com.team_c.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MypageDAO mypageDAO;

	public List<Map<String, Object>> reservation(Map<String, Object> map){
		return mypageDAO.reservation(map);
	}
	
	public int totalCount(Map<String, Object> map) {
		return mypageDAO.totalCount(map);
	}

	@Override
	public void mypageUpdate(Map<String, Object> map) {
		mypageDAO.mypageUpdate(map);
		
	}

	@Override
	public void mypageDelete(Map<String, Object> map) {
		mypageDAO.mypageDelete(map);
		
	}

	public Map<String, Object> mypageList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Map<String, Object>> myPageList() {
		// TODO Auto-generated method stub
		return null;
	}

}
