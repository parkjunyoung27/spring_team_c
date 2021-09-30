<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | login</title>
<link href="./resources/css/index.css" rel="stylesheet">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
#login-form {
	margin: 0 auto;
	height: 520px;
	width: 500px;
	margin-top: 100px;
	border: none;
	padding: 20px;
	border-radius: 5px;
	background-color: #EEEFF177;
	margin-bottom: 150px;
}

#login-form p {
	margin-top: 0;
	text-align: center;
	margin-bottom: 15px;
	font-size: 23px;
}

.text-field {
	width: 460px;
	height: 50px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	margin-bottom: 10px;
	padding: 10px;
}

.submit-btn {
	width: 100%;
	height: 50px;
	border: none;
	background-color: #728FCE;
	border-radius: 5px;
	font-size: 17px;
	color: white;
	margin-bottom: 30px;
	padding: 10px;
	letter-spacing: 5px;
	font-weight: 600;
}

.links {
	width: 100%;
	text-align: center;
	margin-top: 30px;
}

.links a {
	font-size: 15px;
	color: #9B9B98;
}

.login_other_img {
	text-decoration: none;
}

.login_other_img img {
	width: 49%;
	height: 50px;
}
</style>

<script type="text/javascript">
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
	}

	function handleOnInput(e) {
		e.value = e.value.replace(/[^a-z0-9@.-_]/ig, '')
	}
</script>

</head>
<body>
	<header>
		<!-- navbar -->
		<%@ include file="./component/navbar.jsp"%>
	</header>

	<main>
		<div id="login-form">
			<p>
				<img src="./resources/images/logo2.png" alt="logo" class="logo"
					width="70%"><br> "Don't you get hungry"
			</p>

			<form action="${pageContext.request.contextPath}/login.do"
				method="post">
				<input type="text" id="id" name="id" class="text-field"
					oninput="handleOnInput(this)" placeholder="아이디를 입력하세요"
					required="required"> <input type="password" id="pw"
					name="pw" class="text-field" placeholder="암호를 입력하세요"
					required="required">
				<button type="submit" value="로그인" class="submit-btn">LOGIN</button>

				<div id="login_other">
					<!-- <a href="kakaoLogin.do">카카오</a> -->
					<c:set var="clientId" value="188766d70b45863a165fa74d7d8a455b" />
					<c:set var="redirectUri" value="http://gsupport.xyz/kakaoLogin.do" />

					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=${clientId}&redirect_uri=${redirectUri}&response_type=code"
						class="login_other_img"> <img
						src="./resources/images/kakao_login.png" />
					</a>
					<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
					<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
					<a href="http://gsupport.xyz/naverlogin.do" class="login_other_img"> <img
						src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" />
					</a>
				</div>

				<div class="links">
					<a href="./join.do">회원 가입</a> &emsp;|&emsp; <a href="./idSearch.do">ID
						찾기</a> &emsp;|&emsp; <a href="./pwSearch.do">PW 찾기</a>
				</div>
			</form>

		</div>

		<footer>
			<%@ include file="./component/footer.jsp"%>
		</footer>
</body>
</html>