<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="oAuthJoin.do" method="post">
		<input type="hidden" name="id" placeholder="id" value="${sessionScope.memberEmail }">
		<input type="hidden" name="pw" placeholder="pw" value="${sessionScope.memberPw }">
		<input type="text" name="name" placeholder="name"><br>
		<input type="date" name="birthDate" placeholder="birth"><br>
		<input type="hidden" name="channel" value="${sessionScope.joinChannel }">
		<button type="submit">가입</button>
	</form>
</body>
</html>