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
	<!-- <a href="kakaoLogin.do">카카오</a> -->
	<c:set var="clientId" value="188766d70b45863a165fa74d7d8a455b" />
	<c:set var="redirectUri"
		value="http://localhost:8080/GSupport/kakaoLogin.do" />
	<br>
	<a
		href="https://kauth.kakao.com/oauth/authorize?client_id=${clientId}&redirect_uri=${redirectUri}&response_type=code">
		카카오 회원가입</a>

	<form action="join.do" method="post">
		<input type="text" name="id" placeholder="id"><br>
		<input type="password" name="pw" placeholder="pw"><br>
		<input type="text" name="name" placeholder="name"><br>
		<input type="email" name="email" placeholder="email"><br>
		<input type="date" name="birthDate" placeholder="birth"><br>
		<input type="text" name="channel" value="web"><br>
		<button type="submit">가입</button>
	</form>
</body>
</html>