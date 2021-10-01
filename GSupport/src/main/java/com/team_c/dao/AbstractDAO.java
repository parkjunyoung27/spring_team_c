package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class AbstractDAO {
	
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if (log.isDebugEnabled()) {
			log.debug("\t QueryId \t: " + queryId);
		}
	}
	
	public List<Map<String, Object>> selectList(String queryId) {
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
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


	
}
