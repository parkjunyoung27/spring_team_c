<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 회원가입</title>
<link href="./resources/css/index.css" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<style>

#join_reset:hover{bcolor:blue;letter-spacing:6px;}
#join_index:hover{color:blue;letter-spacing:6px;}
</style>
<!-- AJAX사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script type="text/javascript">



	function clickEmailBtn() {

		var email = $("#email").val();

		$.ajax({
			type : 'get',
			dataType : 'text',
			data : 'email=' + email,
			url : '${pageContext.request.contextPath}/mailCheck.do',

			success : function(data) {

				alert("인증 번호가 발송되었습니다." + data),
				sessionStorage.setItem("sentCode", data);
			}

		});

	}

	function authCodeConfirm() {

		var authCodeSent = sessionStorage.getItem("sentCode");
		var authCode = $("#authCode").val();

		if (authCodeSent == authCode) {

			alert("인증 번호가 일치합니다.")

		} else {

			alert("인증 번호가 일치하지 않습니다.")
		}

	}
	

	
</script>

	
	
		<div id="authorizeMemberBox">
			가입하신 이메일을 입력해주세요
				
				<input type="email" id="email" name="email" class="fpw_input" placeholder="이메일을 입력하세요.">
				<input type="submit" id="emailBtn" name="emailBtn" value="인증 메일 보내기" onclick="clickEmailBtn()">
			
		</div>
		

		
		<div>
				<input type="text" id="authCode" name="authCode" placeholder="인증 번호를 입력하세요.">
				<input type="submit" id="authCodeConfirm" name="authCodeConfirm" value="확인" onclick="authCodeConfirm()">	
		</div>
	
	
</html>