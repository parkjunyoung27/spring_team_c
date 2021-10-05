<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bossBoard</title>
</head>
<body>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이름</th>
			<th>날짜</th>
			<th>즐겨찾기</th>
		</tr>
		<c:forEach items="${list}" var="l">
		<tr>
			<td>${l.board_no }</td>
			<td>${l.board_title}</td>
			<td>${l.member_id}</td>
			<td>${l.board_date}</td>
			<td>${l.board_like}</td>
		</tr>
		</c:forEach>
	</table>
	<p><a href="/GSupport">홈으로</a></p>
</body>
</html>