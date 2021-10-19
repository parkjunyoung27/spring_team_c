<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 회원가입</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<style>



#join_form{
	margin: 0 auto;
	height: 500px;
	width: auto;
	border: none;
	padding: 10px;
	border-radius: 5px;
    background-color: #EEEFF177;
}

#join_form h2{
	position:fixed;
	top:8%;
	width: 80%;
	left:50%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 30px;
}

#join_form p {
	position:fixed;
	top:15%;
	width: 80%;
	left:50%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 25px;
}

#join_id {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:70%;
}

#join_name {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:58%;
}

#join_pw {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:46%;
}

#join_confirmPw {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:34%;
}

#birth_date {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	bottom:22%;
}

#joinConfirm {
	position:fixed;
	width: 60%;
	height: 40px;
	left:50%;
	transform:translate(-50%);
	border: none;
	background-color: #728FCE;
	border-radius: 5px;
	font-size: 17px;
	color: white;
	padding: 10px;
	letter-spacing: 5px;
	font-weight: 600;
	bottom:10%;
}

.join_input {
	border: none;
	color: black;
	border-bottom: 2px solid #D1D1D4;
	background: #f5f5f5;
	padding: 15px;
	padding-left: 24px;
	font-weight: 700;
	width: 75%;
	transition: .4s;
}

.join_input:active,
.join_input:focus,
.join_input:hover {
	background: #f5f5f5;
	outline: none;
	border-bottom-color: #6A679E;
}

/*중복확인 버튼*/
#check_id{
    width: 75px;
    position: absolute;
    top: 73px;
    left: 463px;
    cursor: pointer;
    height: 30px;
    line-height: 30px;
    border-radius: 0 10px 10px 0;
    border: none;
    border-left: 2px solid #728FCE;
    box-shadow: none;
    background-color: white;
    transition: 0.3s;
    font-size: 13px;
}

#check_id:hover{
	background-color: #D6EAF8;
}



</style>
<!-- AJAX사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
<script type="text/javascript">
/*비밀번호 일치 검사*/
function isSame(){
	if(document.getElementById('pw1').value != '' && document.getElementById('pw2').value != ''){
		if(document.getElementById('pw1').value == document.getElementById('pw2').value){
			document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
			document.getElementById('same').style.color='blue'
		}else{
			document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color='red'			
		}
	}
}

function checkID(){
	var id = $("#join_id").val();
	var agent = navigator.userAgent.toLowerCase();
	var joinErr = document.getElementById('joinErr');		
	

	
	if(id.length < 5 || id.indexOf('.') == -1 || id.indexOf('@') == -1){
		$("#joinErr").text("이메일을 다시 확인해주세요.");
		$("#joinErr").css("color", "red");
		$("#join_id").focus();
	} else {
		$("#joinErr").text("");
		$("#joinErr").css("color", "green");
	}
	
	
}

function join(){
	var id = document.getElementById('id');
	var name = document.getElementById('name');
	var pw1 = document.getElementById('pw1');
	var email = document.getElementById('email');
	var phone = document.getElementById('phone');
	var date = document.getElementById('date');	
	
	//id가 없거나, 5글자 이하라면
	if(id.value == "" || id.value.length < 5){
		alert('아이디를 5자 이상 입력해주세요.');
		id.focus();
		id.style.backgroundColor = '#F5B7B1';
		return false;
	}
	if(name.value ==""){
		alert("이름을 입력해주세요.");
		name.focus();
		name.style.backgroundColor = '#F5B7B1';
		return false;
	}
	if(pw1.value == ""|| pw1.value.length < 5){
		alert("비밀번호를 5글자 이상 입력해주세요.");
		pw1.focus(); // 마우스 이동
		return false;
	}	
	
	if(phone.value == "" || phone.value.length < 10 ){
		alert("핸드폰 번호를 입력하세요.");
		email.style.backgroundColor='#F5B7B1';
		email.focus();
		return false;
	}
	
	if(email.value == ""){
		alert("email을 입력하세요.");
		email.style.backgroundColor='#F5B7B1';
		email.focus();
		return false;
	}
	
	if(date.value == ""){
		alert("생일을 입력하세요.");
		date2.style.backgroundColor='#F5B7B1';
		date2.focus();
		return false;
	}		
}
/*ajax
$(function(){
	$("#join_join").prop("disabled", true); //가입하기 버튼 비활성화
	$("#resultText").css("color","red");
});
*/

function handleOnInput(e) {
	e.value = e.value.replace(/[^a-z0-9@.-_]/ig, '')
}

function handleOnInputName(e)  {
	  e.value = e.value.replace(/[^ㄱ-힣a-zA-Z0-9]/ig, '')
	}

</script>


		<div id ="join_form">
			<h2>회 원 가 입</h2><br>
			<p id="joinErr"></p>
			
			<form action="${pageContext.request.contextPath }/join.do" method="post" autocomplete="off">
				<div>
					<input type="email" id="join_id" name="id" class="join_input" style="text-transform: lowercase" placeholder="이메일" required="required" onchange="checkID()" oninput="handleOnInput(this)" onfocus="focusID()">
				</div>
				<div>
					<input type="text" id="join_name" name="name" class="join_input" placeholder="닉네임" required="required" onchange="checkName()" oninput="handleOnInputName(this)" onfocus="focusName()">
				</div>
				<div>
					<input type="password" id="join_pw" name="password" class="join_input" placeholder="비밀번호" required="required" onchange="isSame()" onfocus="focusPw()">
				</div>
				<div>
					<input type="password" id="join_confirmPw" name="confirmPassword" class="join_input" placeholder="비밀번호 확인" required="required" onchange="isSame()">
				</div>
			
				<div>
					<input type="text" id="birth_date" name="birth_date" class="join_input" placeholder="생년월일" required="required" onchange="checkBirth()" onfocus="focusBirth()">
				</div>
			
					<input type="hidden" id="joinSubmit" name="joinSubmit" value="가입하기">
		</form>
					<input type="submit" id="joinConfirm" name="joinConfirm" value="가입하기" onclick="joinConfirm()">
		
		</div>
	
	
</html>