package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	@Autowired
	private MypageDAO mypageDAO;

	@Override
	public List<Map<String, Object>> myPageList() {
		return mypageDAO.myPageList();
	}

}
