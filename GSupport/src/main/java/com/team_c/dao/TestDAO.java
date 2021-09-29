package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class TestDAO extends AbstractDAO {

	public List<Map<String, Object>> boardList() {
		return selectList("test.boardList");
	}
}
