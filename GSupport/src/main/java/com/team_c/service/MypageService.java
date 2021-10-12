package com.team_c.service;

import java.util.ArrayList;
import java.util.Map;

public interface MypageService {
	public ArrayList<Map<String, Object>> myPageList();

	public void mypageUpdate(Map<String, Object> map);
	public void mypageDelete(Map<String, Object> map);
}
