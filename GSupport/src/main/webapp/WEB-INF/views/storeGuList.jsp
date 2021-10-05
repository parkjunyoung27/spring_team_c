<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서울특별시 구 목록</title>
</head>
<body>
<c:forEach items="${list }" var="l">
	<button type="submit" onclick="location.href='./storeList.do?guName=${l.shop_gu}&shop_wido=${l.gu_wido }&shop_kyungdo=${l.gu_kyungdo }'">${l.shop_gu }</button>
</c:forEach>

</body>
</html>