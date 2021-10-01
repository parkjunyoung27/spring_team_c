package com.team_c.service;

import java.util.List;
import java.util.Map;

public interface MessageService {

	//메시지 목록
	public List<Map<String, Object>> messageList(Map<String, Object> map);
	
	//쪽지 읽음 처리하기
	public void readMessage(Map<String, Object> map);
	
	//메시지 보내기 = 결과값 받기 1
	public int sendMessage(Map<String, Object> map);	
	
	//메시지 읽었다면 = 읽음처리 checkMessage
	public int checkMessage(Map<String, Object> map);
	
	
}
