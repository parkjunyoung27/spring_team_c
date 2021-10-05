package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("MypageDAO")
public class MypageDAO extends AbstractDAO{

	public List<Map<String, Object>> myPageList(){
		return (List<Map<String, Object>>) selectList("myPage.myPageList");
	}
	
}
