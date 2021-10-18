package com.team_c.service;

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

	public List<Map<String, Object>> reservation(Map<String, Object> map) {
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

	public void reservCancel(Map<String, Object> map) {
		mypageDAO.reservCancel(map);
	}

	public List<Map<String, Object>> myPageBookmark(Map<String, Object> map) {
		return mypageDAO.myPageBookmark(map);
	}

	public int totalCountBookmark(Map<String, Object> map) {
		return mypageDAO.totalCountBookmark(map);
	}

	public Map<String, Object> myPageShop(Map<String, Object> map) {
		return mypageDAO.myPageShop(map);
	}

	public Map<String, Object> myPage_updateOwner(Map<String, Object> map) {
		return mypageDAO.myPage_updateOwner(map);
	}

	public void myPage_UpdateStore(Map<String, Object> map) {
		mypageDAO.myPage_UpdateStore(map);
	}


	
	
}
