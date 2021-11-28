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
		int categoryNo = util.toInt(map.getMap().get("categoryNo"));
		String boardName = (String) boardNameList.get(categoryNo).get("board_name");
		return boardName;
	}

	public int write(Map<String, Object> map) {
		return boardDAO.write(map);
	}

	public Map<String, Object> detail(Map<String, Object> map) {
		return boardDAO.detail(map);
	}

	public Map<String, Object> update(Map<String, Object> map) {
		return boardDAO.update(map);
	}

	public int delete(Map<String, Object> map) {
		return boardDAO.delete(map);
	}

	public List<Map<String, Object>> commentList(Map<String, Object> map) {
		return boardDAO.commentList(map);
	}

	public int commentTotalCount(Map<String, Object> map) {
		return boardDAO.commentTotalCount(map);
	}	
	
	public int commentWrite(Map<String, Object> map) {
		return boardDAO.commentWrite(map);
	}

	public int comment_delete(Map<String, Object> map) {
		return boardDAO.comment_delete(map);
	}

	public Map<String, Object> comment_update(Map<String, Object> map) {
		return boardDAO.comment_update(map);
	}
	
}
