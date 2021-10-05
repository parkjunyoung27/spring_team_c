package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> boardList() {
		return (List<Map<String, Object>>) selectList("board.boardList");
	}

}
