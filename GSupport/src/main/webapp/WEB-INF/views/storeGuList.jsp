<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울특별시 구 목록</title>
</head>
<body>
	<form action="./guStore.do" method="get">
		<input type="hidden" name="guName" value="종로구">
		<button type="button" onclick="location.href='./guStore.do?guName=종로구&shop_wido=37.56945089&shop_kyungdo=126.9867203560'">종로구</button>
		
	</form>
	<form action="./guStore.do" method="get">
		<input type="hidden" name="guName" value="광진구">
		<button type="submit">광진구</button>
	</form>
</body>
</html>