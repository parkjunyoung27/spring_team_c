package com.team_c.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_c.dao.MypageDAO;

@Service("mypageService")
public class MypageServiceImpl implements MypageService {

	Logger log = Logger.getLogger(this.getClass());

	@Autowired
	private MypageDAO mypageDAO;

	public List<Map<String, Object>> reservation(Map<String, Object> map) {
		return mypageDAO.reservation(map);
	}
	
	public int totalCount(Map<String, Object> map) {
		return mypageDAO.totalCount(map);
	}

	@Override
	public Map<String, Object> myPageList(Map<String, Object> map) {
		return mypageDAO.mypageList(map);
	}

	public void myPageUpdatePW(Map<String, Object> map) {
		mypageDAO.mypageUpdatePW(map);
	}

	public void myPageUpdate(Map<String, Object> map) {
		mypageDAO.myPageUpdate(map);
	}

	public void myPageDelete(Map<String, Object> map) {
		mypageDAO.mypageDelete(map);
	}

	public void reservCancel(Map<String, Object> map) {
		mypageDAO.reservCancel(map);
	}

	public List<Map<String, Object>> myPageBookmark(Map<String, Object> map) {
		return mypageDAO.myPageBookmark(map);
	}

	public int totalCountBookmark(Map<String, Object> map) {
		return mypageDAO.totalCountBookmark(map);
	}

	public Map<String, Object> myPageShop(Map<String, Object> map) {
		return mypageDAO.myPageShop(map);
	}

	public Map<String, Object> myPage_updateOwner(Map<String, Object> map) {
		return mypageDAO.myPage_updateOwner(map);
	}

	public void myPage_updateStore(Map<String, Object> map) {
		mypageDAO.myPage_updateStore(map);
	}

	public int myPage_registStore(Map<String, Object> map) {
		return mypageDAO.myPage_registStore(map);
	}

	public List<Map<String, Object>> storeGuList(Map<String, Object> map) {
		return mypageDAO.storeGuList(map);
	}


	
	
	public List<Map<String, Object>> reservationTotal(Map<String, Object> map) {
		return mypageDAO.reservationTotal(map);
	}

	public List<Map<String, Object>> ownerReservCheck(Map<String, Object> map) {
		return mypageDAO.ownerReservCheck(map);
	}

	public int totalCount2(Map<String, Object> map) {
		return mypageDAO.totalCount2(map);
	}

	public List<Map<String, Object>> ownerReservList(Map<String, Object> map) {
		return mypageDAO.ownerReservList(map);
	}

	public void ownerReservCancel(Map<String, Object> map) {
		mypageDAO.ownerReservCancel(map);
	}

	public void ownerReservSuccess(Map<String, Object> map) {
		mypageDAO.ownerReservSuccess(map);
	}

	public void registStoreInsert(Map<String, Object> map) {
		mypageDAO.registStoreInsert(map);
	}
	
//	public String reservationCate(CommandMap map){
//		List<Map<String, Object>> reservationStatusList = mypageDAO.reservationCate(map.getMap());
//		//int reservationNo = Integer.parseInt(String.valueOf(map.get("reservationNo"))); //0부터 n번째 줄까지 있는 리스트를 뽑아온다.
//		//String reservationStatus = (String) reservationStatusList.get(reservationNo).get("reservation_status"); 
//		return  ""; // reservationStatus;	
//	}
	public List<Map<String, Object>> reservation2(Map<String, Object> map) {
		return mypageDAO.reservation2(map);
	}

}
