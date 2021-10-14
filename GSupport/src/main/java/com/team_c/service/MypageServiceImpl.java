package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.common.CommandMap;
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
	public Map<String, Object> myPageList(Map<String, Object> map) {
		return mypageDAO.mypageList(map);
	}

	public void myPageUpdatePW(Map<String, Object> map) {
		mypageDAO.mypageUpdatePW(map);
	}
	
	public void myPageUpdate(Map<String, Object> map) {
		mypageDAO.myPageUpdate(map);
	}
	
	public void myPageDelete(Map<String, Object> map) {
		mypageDAO.mypageDelete(map);
	}


}
