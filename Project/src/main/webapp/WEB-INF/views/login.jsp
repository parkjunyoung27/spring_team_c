<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
<script type="text/javascript">
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
	}
	
	function handleOnInput(e)  {
		e.value = e.value.replace(/[^a-z0-9@.-_]/ig, '')
	}
	
	</script>
</head>
<body>

		<c:choose>
				<c:when test="${sessionScope.name ne null}">
					<h2>${sessionScope.name }님 반갑습니다.(${sessionScope.authUser }회원)</h2>
					<button onclick="onLogoutClick();">로그아웃</button>
				</c:when>
				<c:otherwise>
					<form action="${pageContext.request.contextPath}/login.do" method="post">
						<input type="text" name="id" oninput="handleOnInput(this)">
						<input type="password" name="pw">
						<button type="submit">로그인하기</button>
					</form>
						<!-- <a href="kakaoLogin.do">카카오</a> -->
						<c:set var="clientId" value="188766d70b45863a165fa74d7d8a455b" />
						<c:set var="redirectUri" value="http://localhost:8080/GSupport/kakaoLogin.do" />
						<br>
						<a href="https://kauth.kakao.com/oauth/authorize?client_id=${clientId}&redirect_uri=${redirectUri}&response_type=code">
						카카오
						</a>
					<a href="join.do"><button>가입하기</button></a>
				</c:otherwise>
			</c:choose>
					<a href="index.do"><button>홈</button></a>
</body>
</html>