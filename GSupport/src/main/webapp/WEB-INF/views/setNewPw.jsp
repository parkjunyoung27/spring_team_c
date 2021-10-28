<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | PW</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script type="text/javascript"
	src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
#newPwForm {
	margin: 0 auto;
	height: 500px;
	width: auto;
	border: none;
	padding: 10px;
	border-radius: 5px;
	background-color: #EEEFF177;
}

#newPwForm p {
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

#setPwErr {
	position:fixed;
	top:40%;
	width: 90%;
	left:50%;
	border: none;
	border-radius: 5px;
	transform:translate(-50%);
	text-align: center;
	margin-bottom: 0px;
	font-size: 15px;
}

#setNPemail {
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

#setNewPw {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	padding-left: 24px;
	display: none;
	bottom:45%;
}

#setNewConfirmPw {
	position:fixed;
	width: 60%;
	left:50%;
	height: 40px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	transform:translate(-50%);
	padding-left: 24px;
	display: none;
	bottom:35%;
}

#sendCodeSubmit {
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
	bottom:20%;
}

#setNewPwSubmit {
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
	display:none;
	bottom:20%;
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
	
	function memberValidate() {
		
		var email = $("#setNPemail").val();
		
		$.ajax({
			type:'get',
			dataType:'text',
			data: 'email='+email,
			url: '${pageContext.request.contextPath}/emailCount.do',
			success: function(rData, textStatus, xhr){
				
				if(rData == 1){
					$("#setPwErr").text("잠시만 기다려주세요. 인증 메일을 발송하고 있습니다.");
					new sendNewPwEmailCode();
				}else{
					alert("가입되지 않은 이메일 입니다.")
				}
			},
			error: function(xhr, status, e){
				alert("문제 발생 : " + e);
			}
		});
		
	}
	
	function sendNewPwEmailCode() {

		var email = $("#setNPemail").val();
		
		$.ajax({
			type : 'get',
			dataType : 'text',
			data : 'email=' + email,
			url : '${pageContext.request.contextPath}/mailCheck.do',

			success : function(data) {

				sessionStorage.setItem("sentCode", data);
				$("#setPwErr").text("");
				var typeCode = prompt("이메일로 발송된 인증번호를 입력해주세요." + data,"");
				
				console.log(typeCode);
				
				if (typeCode != null) {
					if (data == typeCode) {

						alert("인증 되었습니다.")
						$("#setNewPw").css("display", "inline");
						$("#setNewConfirmPw").css("display", "inline");
						$("#setNewPwSubmit").css("display", "inline");
						$("#setNPemail").css("display", "none");
						$("#sendCodeSubmit").css("display", "none");
						$("#setNewPwEmailDummy").val($("#setNPemail").val());
						return true;
						
					} else {
						var tryCount = 0;
						while(true){
						    
							var typeCode = prompt("인증 번호가 일치하지 않습니다. 다시 입력해주세요.","");
					        
							if(data==typeCode){
								alert("인증 되었습니다.")
								$("#setNewPw").css("display", "inline");
								$("#setNewConfirmPw").css("display", "inline");
								$("#setNewPwSubmit").css("display", "inline");
								$("#setNPemail").css("display", "none");
								$("#sendCodeSubmit").css("display", "none");
								$("#setNewPwEmailDummy").val($("#setNPemail").val());
								
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
	
	
	function isSame() {
		var pw1 = $("#setNewPw").val();
		var pw2 = $("#setNewConfirmPw").val();
	    
		if(pw1.length < 6 || pw1.length > 30){
				$("#setPwErr").text("비밀번호를 6자 이상 입력해주세요.");
				$("#setNewPw").css("background-color", "pink");
				$("#setNewPwDummy").val("false");
	    }
		if(pw1.length > 5){
	    	if(pw1 == pw2 && pw2 == pw1) {
	    		$("#setPwErr").text(" ");
	    		$("#setNewPw").css("background-color", "#3ecd3eb8");
	    		$("#setNewConfirmPw").css("background-color", "#3ecd3eb8");
	    		$("#setNewPwSubmit").prop("type", "submit");
	        } else if(pw2 == "") {
	        	$("#setPwErr").text("비밀번호를 한번 더 입력해주세요.");
	        	$("#setNewPw").css("background-color", "#3ecd3eb8");
				$("#setNewConfirmPw").css("background-color", "pink");
				$("#setNewPwDummy").val("false");
	        } else {
	            $("#setPwErr").text("비밀번호가 일치하지 않습니다.");
				$("#setNewPw").css("background-color", "pink");
				$("#setNewConfirmPw").css("background-color", "pink");
				$("#setNewPwDummy").val("false");
	        }
	    } 
	}
	

</script>

</head>

		<div id="newPwForm">
			<p>
				<img src="./resources/images/logo.png" alt="logo" class="logo"
					width="60%"><br>&emsp;"Don't you get hungry"
			</p>
			<div id="setPwErr"></div>

			
				<input type="text" id="setNPemail" name="email" class="text-field" oninput="handleOnInput(this)" placeholder="이메일을 입력하세요"
					required="required" style="text-transform: lowercase">
				<input id="sendCodeSubmit" type="text" readonly="readonly" value="이메일 인증하기" onclick="memberValidate()">
			
			<form action="${pageContext.request.contextPath}/setNewPw.do"
				method="post">
				<div>
					<input type="password" id="setNewPw" name="pw" class="setNewInput" placeholder="비밀번호" required="required" onchange="isSame()" >
				</div>
				<div>
					<input type="password" id="setNewConfirmPw" class="setNewInput" placeholder="비밀번호 확인" required="required" onchange="isSame()">
				</div>
				<input type="hidden" id="setNewPwEmailDummy" name="email">
				<input id="setNewPwSubmit" name="setNewPwSubmit" value="비밀번호 변경하기">
			</form>
		</div>

				
				<div class="links">
					<a><label for="tab01">로그인</label></a> &emsp;|&emsp;<a><label for="tab02">회원가입</label></a>
				</div>

			<input type="hidden" id="setNewPwDummy" value="">
</html>
