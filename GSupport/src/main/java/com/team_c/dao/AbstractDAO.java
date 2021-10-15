package com.team_c.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.team_c.util.Util;

public class AbstractDAO {

	protected Log log = LogFactory.getLog(AbstractDAO.class);

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private Util util;
	@Autowired
	private HttpServletRequest request;
	@Autowired
	private HttpSession session;

	protected void printQueryId(String queryId) {
		
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId \t: " + queryId);
		}
		
		String ip = util.getUserIp(request);
		String target = queryId;
		String id = (String) session.getAttribute("id");
		String data = session.getAttribute("id") + "가 " + target + "(으)로 접근";
		
		Map<String, Object> send = new HashMap<String, Object>();
		send.put("ip", ip);
		send.put("target", target);
		send.put("id", id);
		send.put("data", data);
		sqlSession.insert("log.writelog",send);	
		
	}
	

	public List<Map<String, Object>> selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}

	public List<Map<String, Object>> selectList(String queryID, Map<String, Object> map) {
		return sqlSession.selectList(queryID, map);
	}

	public Map<String, Object> selectOne(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, map);
	}

	public Map<String, Object> selectOneByEmail(String queryID, String email) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, email);
	}

	public int selectOne(String queryID, String email) {
		printQueryId(queryID);
		return sqlSession.selectOne(queryID, email);
	}

	public int Insert(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		return sqlSession.insert(queryID, map);
	}

	public void update(String queryID, Map<String, Object> map) {
		printQueryId(queryID);
		sqlSession.update(queryID, map);
	}

	// 메시지에서 no로 id불러오기
	public String getName(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);
	}

	// 메시지 보내기
	public int sendMessage(String queryID, Map<String, Object> map) {
		return sqlSession.insert(queryID, map);
	}

	// 메시지 삭제하기
	public void delMsg(String queryID, Map<String, Object> map) {
		sqlSession.delete(queryID, map);
	}
	
	public int update2(String queryID, Map<String, Object> map) {
		return sqlSession.update(queryID, map);
	}
	
	public int delete(String queryID, Map<String, Object> map) {
		return sqlSession.delete(queryID, map);
	}
	
	//즐겨찾기
	public void storeLike(String queryID, Map<String, Object> map) {
		sqlSession.insert(queryID, map);
	}
	
	//즐겨찾기 중복 검사
	public int likeCheck(String queryID, Map<String, Object> map) {
		return sqlSession.selectOne(queryID, map);
	}
	
	//즐겨찾기 삭제
	public void likeDelete(String queryID, Map<String, Object> map) {
		 sqlSession.delete(queryID, map);
	}
	
	public List<Object> selectOptionList(String queryID){
		return sqlSession.selectList(queryID);
	}
	
	//로그 기록 삭제하기 
	public void deleteLog(String queryID, String number) {
		sqlSession.update(queryID, number);
	}
	
}
