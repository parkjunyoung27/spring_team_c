<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | login</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
#login-form {
	margin: 0 auto;
	height: 500px;
	width: auto;
	border: none;
	padding: 10px;
	border-radius: 5px;
	background-color: #EEEFF177;
}

#login-form p {
	position:fixed;
	top:10%;
	width:90%;
	left:47%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 23px;
}

#id {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	padding-left: 24px;
	bottom:50%;
}

#pw {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	padding-left: 24px;
	bottom:40%;
}

.submit-btn {
	position:fixed;
	width: 60%;
	height: 50px;
	left:50%;
	transform:translate(-50%);
	border: none;
	background-color: #728FCE;
	border-radius: 5px;
	font-size: 17px;
	color: white;
	margin-bottom: 30px;
	padding: 10px;
	letter-spacing: 5px;
	font-weight: 600;
	bottom:18%;
}

.links {
	position:fixed;
	margin: 0 auto;
	width: 100%;
	text-align: center;
	left:50%;
	transform:translate(-50%);
	bottom:5%;
}

.links a {
	font-size: 15px;
	color: #9B9B98;
}

.login_other_img {
	text-decoration: none;
}


#login_other{
	position:fixed;
	margin: 0 auto;
	left:50%;
	bottom:10%;
	transform:translate(-50%);
}

#login_other > a > img {
	width: 50px;
	height: 50px;
}

</style>

<script type="text/javascript">
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
	}

	/* function handleOnInput(e) {
		e.value = e.value.replace(/[^a-z0-9@.-_]/ig, '')
	} */
	
	
	
</script>

</head>

		<div id="login-form">
			<p>
				<img src="./resources/images/logo.png" alt="logo" class="logo"
					width="60%"><br>&emsp;"Don't you get hungry"
			</p>

			<form action="${pageContext.request.contextPath}/login.do"
				method="post">
				<input type="text" id="id" name="id" class="text-field" oninput="handleOnInput(this)" placeholder="이메일을 입력하세요"
					required="required" style="text-transform: lowercase"> <input type="password" id="pw"
					name="pw" class="text-field" placeholder="암호를 입력하세요"
					required="required">
				<button type="submit" value="로그인" class="submit-btn">LOGIN</button>
			</form>

				<div id="login_other">
					<!-- <a href="kakaoLogin.do">카카오</a> -->
					<c:set var="clientId" value="188766d70b45863a165fa74d7d8a455b" />
					<c:set var="redirectUri" value="https://gsupport.xyz/GSupport/kakaoLogin.do" />

					<a
						href="https://kauth.kakao.com/oauth/authorize?client_id=${clientId}&redirect_uri=${redirectUri}&response_type=code"
						class="login_other_img"> <img
						src="./resources/images/kakao_icon.png" />
					</a>
					<!-- 네이버 로그인 화면으로 이동 시키는 URL -->
					<!-- 네이버 로그인 화면에서 ID, PW를 올바르게 입력하면 callback 메소드 실행 요청 -->
					&emsp;&emsp;<a href="https://gsupport.xyz/GSupport/naverlogin.do" class="login_other_img">
						<img
						src="./resources/images/naver_icon.png" />
					</a>

					<!-- 구글 로그인 화면으로 이동 시키는 URL -->
					<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
					&emsp;&emsp;<a href="./googleLogin.do"><img
						src="./resources/images/google_icon.png" /></a>
				</div>

				<div class="links">
					<a><label for="tab02">회원 가입</label></a> &emsp;|&emsp;<a><label for="tab03">PW 찾기</label></a>
				</div>

		</div>

</html>
