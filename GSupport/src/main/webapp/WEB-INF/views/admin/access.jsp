<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
<link href="../resources/css/index.css" rel="stylesheet"> 
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>

#login-form {
	margin: 0 auto;
	height: auto;
	width: 500px;
	border: none;
	padding: 20px;
	border-radius: 5px;
	background-color: #EEEFF177;
	margin-bottom: 150px;
	margin-top:11%;
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
	margin-bottom: 20px;
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
<!-- pagecontext는 굳이 할 필요없음 -->

<script>
function accessCheck(){
	document.getElementById('access').submit();
}

</script>
</head>
<body>
	
	<main>
		<div id="login-form">
			<p>
				<img src="../resources/images/logo.png" alt="logo" class="logo" width="70%">
				<br> 관리자 로그인
			</p>

			<form action="./access.do" id="access" method="post">
				<input type="text" id="id" name="id" class="text-field"
					oninput="handleOnInput(this)" placeholder="아이디를 입력하세요"required="required">
				<input type="password" id="pw" name="pw" class="text-field" placeholder="암호를 입력하세요"
					required="required">
				<button type="submit" value="로그인" class="submit-btn" onclick="accessCheck();">LOGIN</button>
			</form>
		</div>
	</main>
	
</body>
</html>