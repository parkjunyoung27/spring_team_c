package com.team_c.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("MypageDAO")
public class MypageDAO extends AbstractDAO{

	public ArrayList<Map<String, Object>> myPageList(Map<String, Object> map){
		return (ArrayList<Map<String, Object>>) selectList("myPage.myPageList", map);
	}

	public ArrayList<Map<String, Object>> myPageList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
