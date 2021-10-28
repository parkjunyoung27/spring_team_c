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
<!-- AJAX사용 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">
</script>
</head>
<style>



#joinForm{
	margin: 0 auto;
	height: 500px;
	width: auto;
	border: none;
	padding: 10px;
	border-radius: 5px;
    background-color: #EEEFF177;
}

#joinForm h2{
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

#joinForm p {
	position:fixed;
	top:15%;
	width: 90%;
	left:50%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 16px;
	color:red;
}

#joinId {
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

#joinName {
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

#joinPw {
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

#joinConfirmPw {
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

#birthDate {
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

#joinSubmit {
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
	cursor: pointer;
	bottom:10%;
}

.joinInput {
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

.joinInput:active,
.joinInput:focus,
.joinInput:hover {
	background: #f5f5f5;
	outline: none;
	background-color: green;
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

input::placeholder { opacity: 1 }
</style>

<script type="text/javascript">
/*비밀번호 일치 검사*/

function isJoinSame() {
	var pw1 = $("#joinPw").val();
	var pw2 = $("#joinConfirmPw").val();
	
	if(pw1.length < 6 || pw1.length > 30){
			$("#joinErr").text("비밀번호를 6자 이상 입력해주세요.");
			$("#joinPw").css("background-color", "pink");
			$("#joinPwDummy").val("false");
    }
	if(pw1.length > 5){
    	if(pw1 == pw2 && pw2 == pw1) {
    		$("#joinErr").text(" ");
    		$("#joinPw").css("background-color", "#3ecd3eb8");
    		$("#joinConfirmPw").css("background-color", "#3ecd3eb8");
    		$("#dummyPw").val($("#joinPw").val());
    		$("#joinPwDummy").val("true");
        } else if(pw2 == "") {
        	$("#joinErr").text("비밀번호를 한번 더 입력해주세요.");
        	$("#joinPw").css("background-color", "#3ecd3eb8");
			$("#joinConfirmPw").css("background-color", "pink");
			$("#joinPwDummy").val("false");
        } else {
            $("#joinErr").text("비밀번호가 일치하지 않습니다.");
			$("#joinPw").css("background-color", "pink");
			$("#joinConfirmPw").css("background-color", "pink");
			$("#joinPwDummy").val("false");
        }
    } 
}

function checkID(){
	var id = $("#joinId").val();
	var email = $("#joinId").val();
	var agent = navigator.userAgent.toLowerCase();
	var joinErr = document.getElementById('joinErr');		
	

	
	if(id.length < 5 || id.indexOf('.') == -1 || id.indexOf('@') == -1){
		$("#joinErr").text("이메일을 다시 확인해주세요.");
		$("#joinId").css("background-color", "pink");
		$("#joinIdDummy").val("false");
		$("#joinId").focus();
	} else {
		$.ajax({
			type:'get',
			dataType:'text',
			data: 'email='+email,
			url: '${pageContext.request.contextPath}/emailCount.do',
			success: function(rData, textStatus, xhr){
				
				if(rData == 1){
					$("#joinErr").text("이미 등록된 이메일 입니다.");
					$("#joinId").css("background-color", "pink");
					$("#joinIdDummy").val("false");
				}else{
					$("#joinErr").text(" ");
					$("#joinId").css("background-color", "#3ecd3eb8");
					$("#dummyId").val($("#joinId").val());
					$("#joinIdDummy").val("true");
				}
			},
			error: function(xhr, status, e){
				alert("문제 발생 : " + e);
			}
		});
		
	}
	
}

function sendEmailCode() {

	var email = $("#joinId").val();

	$.ajax({
		type : 'get',
		dataType : 'text',
		data : 'email=' + email,
		url : '${pageContext.request.contextPath}/mailCheck.do',

		success : function(data) {

			alert("인증 번호가 발송되었습니다." + data),
			sessionStorage.setItem("sentCode", data);
			
			var typeCode = prompt("이메일로 발송된 인증번호를 입력해주세요.","");
			
			console.log(typeCode);
			
			if (typeCode != null) {
				if (data == typeCode) {

					alert("인증 되었습니다.")
					document.getElementById("joinAction").submit();
					return true;
					
				} else {
					var tryCount = 0;
					while(true){
					    
						var typeCode = prompt("인증 번호가 일치하지 않습니다. 다시 입력해주세요.","");
				        
						if(data==typeCode){
							alert("인증 되었습니다.")
							document.getElementById("joinAction").submit();
							return true;
							}
				            
						else{tryCount++;}
				        
						if(tryCount > 3){
							alert("3회 이상 틀렸습니다. 다시 진행해주세요.")
							location.reload();
							break;}
					}
				}
			}
			
		}

	});

}


function checkName(){
	var name = $("#joinName").val();
	var joinErr = document.getElementById('joinErr');		
	var returnValue = "false";

		$.ajax({
			type:'get',
			dataType:'text',
			data: 'name='+name,
			url: '${pageContext.request.contextPath}/nameCount.do',
			success: function(rData, textStatus, xhr){
				if(rData == 1){
					$("#joinErr").text("이미 등록된 이름 입니다.");
					$("#joinNameDummy").val("false");
				}else{
					$("#joinErr").text(" ");
					$("#joinName").css("background-color", "#3ecd3eb8");
					$("#dummyName").val($("#joinName").val());
					$("#joinNameDummy").val("true");
				}
			},
			error: function(xhr, status, e){
				alert("문제 발생 : " + e);
			}
		});
		return returnValue;
}


function checkBirth() {
	var birth = $("#birthDate").val();
    
	if(birth.include('-') == 2 && birth.length() == 10){
    	$("#joinErr").text(" ");
    	$("#birthDate").css("background-color", "#3ecd3eb8");
    	return true;
    } else {
    	$("#joinErr").text("생년월일을 다시 확인해주세요.");
    }
}

function join(){
	var idTest = $("#joinIdDummy").val();
	var nameTest = $("#joinNameDummy").val();
	var pwTest = $("#joinPwDummy").val();
	
	if (idTest=="true" && nameTest=="true" && pwTest=="true"){
		$("#joinErr").text("잠시만 기다려주세요. 인증 메일을 발송하고 있습니다.");
		new sendEmailCode();
	} else {
		$("#joinErr").text("입력하신 정보를 다시 확인해주세요.");
	}
	
}

function birthTypeChange() {
	$("#birthDate").attr("type", "date");
	
}

function handleOnInput(e) {
	e.value = e.value.replace(/[^a-z0-9@.-_]/ig, '')
}

function handleOnInputName(e)  {
	  e.value = e.value.replace(/[^ㄱ-힣a-zA-Z0-9]/ig, '')
	}

</script>


		<div id ="joinForm">
			<h2>회 원 가 입</h2><br>
			<p id="joinErr"></p>
			
			
				<div>
					<input type="password" id="joinId" class="joinInput" style="text-transform: lowercase" placeholder="이메일" required="required" onchange="checkID()" oninput="handleOnInput(this)" onfocus="this.type='text'">
				</div>
				<div>
					<input type="text" id="joinName" class="joinInput" placeholder="닉네임" required="required" onchange="checkName()" oninput="handleOnInputName(this)">
				</div>
				<div>
					<input type="password" id="joinPw" class="joinInput" placeholder="비밀번호" required="required" onchange="isJoinSame()">
				</div>
				<div>
					<input type="password" id="joinConfirmPw" class="joinInput" placeholder="비밀번호 확인" required="required" onchange="isJoinSame()">
				</div>
				
				
				
		
		<form id="joinAction" name="joinAction" action="${pageContext.request.contextPath }/join.do" method="post">
		
					<input type="email" id="dummyId" name="id" style="display:none">
					<input type="text" id="dummyName" name="name" style="display:none">
					<input type="password" id="dummyPw" name="pw" style="display:none">
					<input type="text" id="dummyChannel" name="channel" value="web" style="display:none">
				<div>
					<input type="text" id="birthDate" name="birthDate" class="joinInput" placeholder="생년월일" onfocus="birthTypeChange()">
				</div>	
					<input type="submit" id="joinForm" value="가입하기" style="display:none">
		</form>
					<input id="joinSubmit" name="joinSubmit" value="메일 인증하고 가입하기" readonly="readonly" onclick="join()">
		</div>
		<div class="links">
			<a><label for="tab01">로그인</label></a> &emsp;|&emsp;<a><label for="tab03">PW 찾기</label></a>
		</div>
					<input type="hidden" id="joinIdDummy" value="">
					<input type="hidden" id="joinNameDummy" value="">
					<input type="hidden" id="joinPwDummy" value="">
	
</html>