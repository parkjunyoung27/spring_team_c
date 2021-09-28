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
	
	<form action="join.do" method="post">
		<input type="text" name="id" placeholder="id"><br>
		<input type="password" name="pw" placeholder="pw"><br>
		<input type="text" name="name" placeholder="name"><br>
		<input type="email" name="email" placeholder="email" value="${sessionScope.memberEmail }"><br>
		<input type="date" name="birthDate" placeholder="birth"><br>
		<input type="text" name="channel" value="${sessionScope.joinChannel }"><br>
		<button type="submit">가입</button>
	</form>
</body>
</html>