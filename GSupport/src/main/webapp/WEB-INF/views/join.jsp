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
#board{
	margin: 0 auto;
	width: 700px;
	min-height: 600px;
	margin-top:30px;
	border: 2px white solid;
	background-color: white;
	border-radius: 10px;
	margin-bottom: 100px;
}

#join_form h2{
	text-align: center;
	margin-top: 5px;
}

#join_form{
    width: 80%;
    min-height: 500px;
    margin: 10px auto 10px;
    padding: 10px 0px 0px 10px;
    position: relative;
    border: none;
    border-radius: 10px;
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
	padding: 5px;
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
// id 중복확인
function checkID(){
	var id = $("#id").val();
	
	if(id.length < 5){
		alert('아이디를 5자 이상 입력해주세요.');
		return false;
	}
	
	$.ajax({
		type: "POST",
		dataType: 'text',
		data: 'id='+id,
		url: './idCheck',
		success: function(rData,textStatus, xhr){
			var checkResult = textStatus;
			//alert("성공 : "+ rData); //rData = result
			
			if(rData == 1){//return 값
				alert(id+"는 이미 등록되어 있습니다.");
				$("#resultText").css("color","red");
				$("#resultText").text(id+"는 이미 등록되어 있습니다.");
				$("#join_join").attr("disabled",true);
			}else{
				alert("사용할 수 있는 ID 입니다.");
				$("#join_join").attr("disabled", false);
				$("#resultText").css("color","blue");
				$("#resultText").text(id+"는 가입할 수 있습니다.");
			}
		},
		error: function(xhr, status, e){
			alert("문제 발생 : " + e)
		}
	});
}
</script>

<body>
	<header>
		<!-- navbar -->
		<%@ include file= "./component/navbar.jsp"%>
	</header>
	
	<main>
	<div id= "board">
		<div id ="join_form">
			<h2>회 원 가 입</h2>
			
			<form action="./join.do" method="post" onsubmit="return join()">
				<div id="jactionp">
					<p id="join_id" class="join_p">
					<span class="jtitle">아이디</span>
					<input type="text" name="id" id="id">
					</p>
									
					<p id="join_name" class="join_p">
						<span class="jtitle">이름</span>
						<input type="text" name="name" id="name">
					</p>
									
					<p id="join_pw" class="join_p_pw">
						<span class="jtitle">비밀번호</span>
						<input type="password" id="pw1" name="pw" class="jpw1" placeholder="비밀번호를 입력해주세요" ><br>
						<input type="password" id="pw2" name="pw2" class="jpw2" placeholder="비밀번호 확인" onchange="isSame()">
						<span id="same"></span>
					</p>
									
					<p id="join_email" class="join_p">
						<span class="jtitle">이메일</span>
						<input type="email" name="email" id="email" >
					</p>	
											
					<p id="join_birth" class="join_p">
						<span class="jtitle">생년월일</span>
						<input type="date" name="birthDate" id="date">
					</p>
					<input type="hidden" name="channel" value="web">
					<button type="submit">가입</button>
				</div>
							
				<div id="jsubb">
						<button type="submit" id="join_join">가입하기</button>
						<p id="jsarea">
						<button type="reset" id="join_reset">초기화하기</button> &nbsp;|&nbsp;
						<a href="./login.do" id="join_index">로그인하러가기</a>						
					</p>
				</div>
			</form>
		</div>
	</div>
	</main>
	
	<footer>
		<%@ include file= "./component/footer.jsp"%>	
	</footer>
	
</body>
</html>