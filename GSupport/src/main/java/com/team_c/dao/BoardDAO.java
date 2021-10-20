package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team_c.common.CommandMap;
import com.team_c.util.Util;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	@Autowired
	private Util util;

	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return selectList("board.boardList", map);
	}

	public int totalCount(Map<String, Object> map) {
		return util.toInt((selectOne("board.totalCount", map).get("totalCount")));
	}

	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.boardList", map);
	}
	
	public List<Map<String, Object>> boardCate(Map<String, Object> map) {
		return selectList("board.boardCate", map);
	}

	public int write(Map<String, Object> map) {
		return Insert("board.write", map);
	}

	public Map<String, Object> detail(Map<String, Object> map) {
		return (Map<String, Object>) selectOne("board.detail", map);
	}




}
