<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Index</title>
	<style>
		h2 { color: white; }
		body { margin: 0; padding: 0; }
		#wrap { width: 1000px; margin: 0 auto; }
		header { width: 1000px; height: 100px; background: #111; }
		nav { width: 1000px; height: 100px; background: #222; }
		aside { float: left; width: 300px; height: 600px; background: #333; }
		main { float: left; width: 700px; height: 600px; background: #444; }
		footer	{ clear: both; width: 1000px; height: 100px; background: #555; }
	</style>
	<script type="text/javascript">
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
	}
	
	</script>
</head>
<body>
	<div id="wrap">
		<header>
				<c:choose>
				<c:when test="${sessionScope.name ne null}">
					<h2>${sessionScope.name }님 반갑습니다.(${sessionScope.authUser }회원)</h2>
					<button onclick="onLogoutClick();">로그아웃</button>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login.do"><button>로그인</button></a>
					<a href="join.do"><button>가입하기</button></a>
				</c:otherwise>
			</c:choose>
		</header>
			
			
		<nav></nav>
		<aside></aside>
		<main>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>날짜</th>
					<th>조회수</th>
					<th>글쓴이</th>
				</tr>
				<c:forEach items="${list }" var="l">
					<tr>
						<td>${l.no }</td>
						<td>${l.title }</td>
						<td>${l.content }</td>
						<td>${l.date }</td>
						<td>${l.count }</td>
					</tr>
				</c:forEach>
			</table>
		</main>
		<footer></footer>
	</div>
</body>
</html>