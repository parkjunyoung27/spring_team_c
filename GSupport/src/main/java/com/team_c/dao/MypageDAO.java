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

	public Map<String, Object> myPage_updateOwner(Map<String, Object> map) {
		return selectOne("mypage.myPage_updateOwner", map);
	}

	public void myPage_updateStore(Map<String, Object> map) {
		update("mypage.myPage_updateStore", map);
	}

	public int myPage_registStore(Map<String, Object> map) {
		return insert("mypage.myPage_registStore", map);
	}

	public List<Map<String, Object>> storeGuList(Map<String, Object> map) {
		return selectList("mypage.storeGuList", map);
		
	}

	public List<Map<String, Object>> reservationTotal(Map<String, Object> map) {
		return selectList("mypage.reservationTotal", map);

	}

	public List<Map<String, Object>> ownerReservCheck(Map<String, Object> map) {
		return selectList("mypage.ownerReservCheck", map);
	}

	public int totalCount2(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("mypage.totalCount2", map).get("totalCount2")));
	}

	public List<Map<String, Object>> ownerReservList(Map<String, Object> map) {
		return selectList("mypage.ownerReservList", map);
	}

	public void ownerReservCancel(Map<String, Object> map) {
		update("mypage.ownerReservCancel", map);
	}

	public void ownerReservSuccess(Map<String, Object> map) {
		update("mypage.ownerReservSuccess", map);
	}

	public void registStoreInsert(Map<String, Object> map) {
		update("mypage.registStoreInsert", map);
	}

	public List<Map<String, Object>> reservation2(Map<String, Object> map) {
		return selectList("mypage.reservation2", map);
	}

	public List<Map<String, Object>> mypageBoard(Map<String, Object> map) {
		return selectList("mypage.mypageBoard", map);
	}

	public int totalCount3(Map<String, Object> map) {
		return Integer.parseInt(String.valueOf(selectOne("mypage.totalCount3", map).get("totalCount3")));
	}

	public int reservCancelMsg(Map<String, Object> map) {
		return sendMessage("mypage.reservCancelMsg", map);
	}

	public int ownerReservCancelMsg(Map<String, Object> map) {
		return sendMessage("mypage.ownerReservCancelMsg", map);
	}

	public int ownerReservSuccessMsg(Map<String, Object> map) {
		return sendMessage("mypage.ownerReservSuccessMsg", map);
	}

	public List<Map<String, Object>> reservList(Map<String, Object> map) {
		return selectList("mypage.reservList", map);
	}
}
