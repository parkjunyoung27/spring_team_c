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
		<input type="text" name="id" placeholder="id">
		<input type="password" name="pw" placeholder="pw">
		<input type="text" name="name" placeholder="name">
		<input type="email" name="email" placeholder="email">
		<input type="date" name="birthDate" placeholder="birth">
		<input type="text" name="channel" value="web">
		<button type="submit">가입</button>
	</form>
</body>
</html>