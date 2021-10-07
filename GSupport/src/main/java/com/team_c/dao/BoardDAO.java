package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return selectList("board.boardList", map);
	}

	public int totalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("board.totalCount", map).get("totalCount")));
	}

	public List<Map<String, Object>> selectList(Map<String, Object> map) {
		return (List<Map<String, Object>>) selectList("board.boardList", map);
	}

	public List<Map<String, Object>> categoryList(Map<String, Object> map) {
		return selectList("board.categoryList", map);
	}




}
