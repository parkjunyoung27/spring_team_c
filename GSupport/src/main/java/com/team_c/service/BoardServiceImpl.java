package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.BoardDAO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardDAO boardDAO;
	
	public List<Map<String, Object>> boardList() {
		return boardDAO.boardList();
	}
}
