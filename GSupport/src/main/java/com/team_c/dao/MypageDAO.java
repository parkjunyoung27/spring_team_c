package com.team_c.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("MypageDAO")
public class MypageDAO extends AbstractDAO {

	public Map<String, Object> mypageList(Map<String, Object> map) {
		return selectOne("mypage.mypageList", map);
	}

	public void myPageUpdate(Map<String, Object> map) {
		update("mypage.myPageUpdate", map);
	}

	public List<Map<String, Object>> reservation(Map<String, Object> map) {
		return selectList("mypage.reservation", map);
	}

	public int totalCount(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("mypage.totalCount", map).get("totalCount")));
	}

	public void mypageUpdatePW(Map<String, Object> map) {
		update("mypage.mypageUpdatePW", map);
	}

	public void mypageDelete(Map<String, Object> map) {
		delete("mypage.mypageDelete", map);
	}

	public void reservCancel(Map<String, Object> map) {
		update("mypage.reservCancel", map);
	}

	public List<Map<String, Object>> myPageBookmark(Map<String, Object> map) {
		return selectList("mypage.myPageBookmark", map);
	}
	
	public int totalCountBookmark(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("mypage.totalCountBookmark", map).get("totalCountBookmark")));
	}

	public Map<String, Object> myPageShop(Map<String, Object> map) {
		return selectOne("mypage.shopList", map);
	}

	public List<Map<String, Object>> myPage_registStore(Map<String, Object> map) {
		return selectList("mypage.myPage_registStore", map);
	}

	public void myPage_UpdateStore(Map<String, Object> map) {
		update("mypage.myPage_UpdateStore", map);
	}
	

}
