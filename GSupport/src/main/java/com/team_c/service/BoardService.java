package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface BoardService {
	List<Map<String, Object>> boardList();
}
