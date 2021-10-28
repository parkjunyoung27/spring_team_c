<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<style>

#oAuthJoinForm{
	margin: 0 auto;
	height: 500px;
	width: auto;
	border: none;
	padding: 10px;
	border-radius: 5px;
    background-color: #EEEFF177;
}

#oAuthJoinForm h2{
	position:fixed;
	top:37%;
	width: 80%;
	left:50%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 30px;
}

#oAuthJoinForm p {
	position:fixed;
	top:10%;
	width: 90%;
	left:47%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 16px;
}

#oAuthJoinErr {
	color:red;
}

#oAuthJoinName {
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

#oAuthBirthDate {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	padding-left: 24px;
	bottom:30%;
}

#oAuthJoinSubmit {
	position:fixed;
	width: 60%;
	height: 40px;
	left:50%;
	transform:translate(-50%);
	border: none;
	background-color: #728FCE;
	border-radius: 5px;
	font-size: 17px;
	text-align:center;
	color: white;
	padding: 10px;
	letter-spacing: 5px;
	font-weight: 600;
	cursor:pointer;
	bottom:15%;
}

.oAuthJoinInput:active,
.oAuthJoinInput:focus,
.oAuthJoinInput:hover {
	background: #f5f5f5;
	outline: none;
	background-color: green;
}

</style>
<!-- AJAX사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script type="text/javascript">

	function checkoAuthName() {
		var name = $("#oAuthJoinName").val();
		var joinErr = document.getElementById('oAuthJoinErr');
		var returnValue = "false";

		$.ajax({
			type : 'get',
			dataType : 'text',
			data : 'name=' + name,
			url : '${pageContext.request.contextPath}/nameCount.do',
			success : function(rData, textStatus, xhr) {
				if (rData == 1) {
					$("#oAuthJoinErr").text("이미 등록된 이름 입니다.");
					$("#oAuthJoinNameDummy").val("false");
				} else {
					$("#oAuthJoinErr").text(" ");
					$("#oAuthJoinName").css("background-color", "#3ecd3eb8");
					$("#oAuthJoinNameDummy").val("true");
				}
			},
			error : function(xhr, status, e) {
				alert("문제 발생 : " + e);
			}
		});
		return returnValue;
	}


	function oAuthJoin() {
		var nameTest = $("#oAuthJoinNameDummy").val();
		var channel = '<%=(String)session.getAttribute("joinChannel")%>';
		var oAuthPw = '<%=(String)session.getAttribute("memberPw")%>';

		if (nameTest == "true") {
			$("#birthDate").val($("#oAuthBirthDate").val());
			$("#dummyId").val($("#oAuthId").val());
			$("#dummyPw").val(oAuthPw);
			$("#dummyName").val($("#oAuthJoinName").val());
			$("#dummyChannel").val(channel);
			document.getElementById("joinAction").submit();
		} else {
			$("#oAuthJoinErr").text("입력하신 정보를 다시 확인해주세요.");
		}

	}

	function oAuthBirthTypeChange() {
		$("#oAuthBirthDate").attr("type", "date");
	}
	
	function oAuthBirthTypeReverse() {
		$("#oAuthBirthDate").css("background-color", "#3ecd3eb8");
	}

	
	function handleOnInputName(e) {
		e.value = e.value.replace(/[^ㄱ-힣a-zA-Z0-9]/ig, '')
	}
</script>
	<div id ="oAuthJoinForm">
			<p>
				<img src="./resources/images/logo.png" alt="logo" class="logo"
					width="60%"><br>&emsp;"Don't you get hungry"
			</p>
			<h2>SNS 간단 회원가입</h2>
			<div id="oAuthJoinErr"></div>
		<form action="join.do" method="post">
			<input type="hidden" id="oAuthId" placeholder="id" value="${sessionScope.memberEmail }">
			<input type="hidden" id="oAuthPw" placeholder="pw" value="${sessionScope.memberPw }">
			<input type="text" id="oAuthJoinName" class="oAuthJoinInput" placeholder="닉네임" required="required" onchange="checkoAuthName()" oninput="handleOnInputName(this)"><br>
			<input type="text" id="oAuthBirthDate" class="oAuthJoinInput" placeholder="생년월일" required="required" onfocus="oAuthBirthTypeChange()"  onblur="oAuthBirthTypeReverse()"><br>
			<input type="hidden" id="oAuthChannel" value="${sessionScope.joinChannel }">
			<input type="submit" id="oAuthJoinForm" value="가입하기" style="display:none">
		</form>
			<input id="oAuthJoinSubmit" name="oAuthJoinSubmit" value="가입하기" readonly="readonly" onclick="oAuthJoin()">
	</div>
	<div class="links">
			<a><label for="tab01">로그인</label></a> &emsp;|&emsp;<a><label for="tab03">PW 찾기</label></a>
	</div>
			<input type="hidden" id="oAuthJoinNameDummy" value="">
</html>