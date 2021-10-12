package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.common.CommandMap;
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
	
	public String boardCate(CommandMap map) {
		List<Map<String, Object>> boardNameList = boardDAO.boardCate(map.getMap());
		int boardNo = Integer.parseInt(String.valueOf(map.get("boardNo")));
		String boardName = (String) boardNameList.get(boardNo).get("board_name");
		return boardName;
	}
	
}
