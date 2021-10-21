package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("messageDAO")
public class MessageDAO extends AbstractDAO {

	public List<Map<String, Object>> messageList(Map<String, Object> map) {
		return selectList("question.messageList", map);
	}

	public Map<String, Object> messageDetail(Map<String, Object> map) {
		return selectOne("question.detail", map);
	}

	public void readMessage(Map<String, Object> map) {
		update("question.readMessage", map);
	}

	public String getName(Map<String, Object> map) {
		return getName("question.getName", map);
	}

	public int sendMessage(Map<String, Object> map) {
		return sendMessage("question.sendMessage", map);
	}

	public void delMsg(Map<String, Object> map) {
		delMsg("question.delMsg", map);
	}

	public List<Map<String, Object>> messageDetailList(Map<String, Object> map) {
		return selectList("question.detailList", map);
	}

	public List<Map<String, Object>> messageSenderDetailList(Map<String, Object> map) {
		return selectList("question.senderDetailList", map);
	}

	
}
