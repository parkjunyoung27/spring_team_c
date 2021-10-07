package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.BoardDAO;
import com.team_c.util.Util;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private Util util;
	
	public List<Map<String, Object>> boardList(Map<String, Object> map) {
		return boardDAO.boardList(map);
	}

	@Override
	public List<Map<String, Object>> boardList() {
		return null;
	}

	public int totalCount(Map<String, Object> map) {
		return boardDAO.totalCount(map);
	}
	
	public List<Map<String, Object>> categoryList(Map<String, Object> map) {
		int board_cate = 0;
		if (map.get("boardNo") != null && util.str2Int((String) map.get("boardNo"))) {
			board_cate = util.str2Int2((String) map.get("boardNo"));
			System.out.println("보드 카테고리값 : " + board_cate);
		}
		
		List<Map<String, Object>> category = boardDAO.categoryList(map);
		System.out.println("result : " + category.get(board_cate));
		return boardDAO.categoryList(map);
	}
}
