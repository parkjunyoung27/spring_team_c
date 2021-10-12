package com.team_c.util;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class Util {
	public boolean str2Int(String str) {//참거짓
		try {
			Integer.parseInt(str);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	public int str2Int2(String str) {//숫자변환 가능하면 변환, 아니면 0
		try {
			return Integer.parseInt(str);
		} catch (Exception e) {
			return 0;
		}
	}
	
	public String getUserIp(HttpServletRequest request) {
		String ip = request.getHeader("X-FORWARDED-FOR");
		if(ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if(ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if(ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if(ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if(ip == null) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

}






