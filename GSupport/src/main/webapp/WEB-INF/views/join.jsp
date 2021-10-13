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

#join_form h2{
	text-align: center;
}

#join_form{
    width: auto;
    min-height: 500px;
    margin: 0 auto;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 18px;
    font-weight: 700;
    background-color: #EEEFF177;
    text-align: center;
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

.join_p{
	margin-top: 10px;
    margin-bottom: 10px;
    padding-right: 20px;
    height: 35px;
}

.join_p_pw{
    margin-top: 10px;
    margin-bottom: 20px;
    padding-right: 20px;
    height: 90px;
}
	
#same{
    color: red;
    font-size: 15px;
    float: right;
    margin-right: 30%;
}
	
.jtitle{	
	float: left;
    height: 30px;
    padding: 0 15px;
    color: black;
    display: inline-block;
}

#jactionp p input{
    width: 70%;
    height: 30px;
    margin: 0 auto;
    padding: 0 15px;
    border: 1px solid #728FCE;
    border-radius: 10px;
    box-shadow: none;
    float: right;
}

#birth_p{
	width:400px;
	height:35px;
	padding:0 15px;
}
			
#join_pw .jpw1, #join_pw .jpw2{
	margin-bottom:10px;
}

#jsubb{
	padding: 0;
}

#resultText{
	margin: 10px;
	font-size: 15px;
}

#join_join{
	width: 80%;
	height:35px;
	cursor:pointer;
	background-color:#728FCE;
	border:none;
	border-radius: 10px;
	letter-spacing:10px;
	font-size:18px;
	transition:0.3s;
	margin: 0 auto;
	display: block;
	color: white;
}

#jsarea{
	text-align: center;
}

#join_reset{
	cursor:pointer;
	border: none;
	transition:0.3s;
	color:black;
	font-size:12px;
	background-color: #EEEFF177;
	font-weight: 600;
}

#join_index{
	color:black;
	text-decoration:none;
	font-size:12px;
	transition:0.3s;
}

#join_reset:hover{bcolor:blue;letter-spacing:6px;}
#join_index:hover{color:blue;letter-spacing:6px;}
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
	var id = $("#id").val();
	var email = $("#email").val();
	var agent = navigator.userAgent.toLowerCase();
	
	$("#email").val($("#id").val());
	
	if(id == "" || id.length < 4){
		$("#joinErr").text("이메일을 다시 확인해주세요.");
		$("#id").focus();
	}
	
	if(id.length < 5 || id.indexOf('.') == -1 || id.indexOf('@') == -1){
		$("#joinErr").text("이메일을 다시 확인해주세요.");
		$("#id").focus();
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




</script>


	<div id= "board">
		<div id ="join_form">
			<h2>회 원 가 입</h2><br>
			<p id="joinErr"></p>
			
			<form action="${pageContext.request.contextPath }/join.do" method="post" autocomplete="off">
				<div>
					<input type="text" id="id" name="id" class="join_input" placeholder="아이디" required="required" onchange="checkID()" oninput="handleOnEmail(this)" onfocus="focusID()">
				</div>
				<div>
					<input type="text" id="name" name="name" class="join_input" placeholder="닉네임" required="required" onchange="checkName()" oninput="handleOnInput(this)" onfocus="focusName()">
				</div>
				<div>
					<input type="password" id="password" name="password" class="join_input" placeholder="비밀번호" required="required" onchange="isSame()" onfocus="focusPw()">
				</div>
				<div>
					<input type="password" id="confirmPassword" name="confirmPassword" class="join_input" placeholder="비밀번호 확인" required="required" onchange="isSame()">
				</div>
			
				<div>
					<input type="date" id="birth_date" name="birth_date" class="join_input" placeholder="생일" required="required" onchange="checkBirth()" onfocus="focusBirth()">
				</div>
			
					<input type="hidden" id="joinSubmit" name="joinSubmit" value="가입하기">
		</form>
					<input type="submit" id="joinConfirm" name="joinConfirm" value="확인하기" onclick="joinConfirm()">
		
		</div>
	</div>
	
	
</html>