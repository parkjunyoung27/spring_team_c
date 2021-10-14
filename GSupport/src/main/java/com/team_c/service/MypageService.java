package com.team_c.service;

import java.util.List;
import java.util.Map;

public interface MypageService {
	public Map<String, Object> myPageList(Map<String, Object> map);
	public List<Map<String, Object>> reservation(Map<String, Object> map);
	public int totalCount(Map<String, Object> map);
	public void myPageUpdatePW(Map<String, Object> map);
	public void myPageUpdate(Map<String, Object> map);
	
}


