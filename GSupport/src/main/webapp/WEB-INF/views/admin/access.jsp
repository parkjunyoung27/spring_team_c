<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<link href="../resources/css/index.css" rel="stylesheet"> 
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<style>
#login-form {
	margin: 0 auto;
	height: auto;
	width: 500px;
	margin-top: 100px;
	border: none;
	padding: 20px;
	border-radius: 5px;
	background-color: #EEEFF177;
	margin-bottom: 150px;
	margin-top:15%;
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
<script>
function accessCheck(){
	
	var data=$("#access").serialize();
	
	$.ajax({
		url: "${pageContext.request.contextPath}/admin/access.do", //ajax url 보낼때 사용
		type:"POST",
		data: data,
		dataType: "text",
		success : function(data, textStatus, xhr) {
			//alert(data); //controller에서 넘어온 return값
			if (data == 1) { 
				alert('로그인에 성공했습니다.'); 
				location.href="./adminMain.do";
			} else { 
				alert("로그인에 실패했습니다." );
				//window.location.reload();
				location.href="./access.do";
				 }}, 
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "error:" + error); 
			} 
		});
}

</script>
</head>
<body>
	
	<main>
		<div id="login-form">
			<p>
				<img src="../resources/images/logo2.png" alt="logo" class="logo" width="70%">
				<br> 관리자 로그인
			</p>

			<form id="access">
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