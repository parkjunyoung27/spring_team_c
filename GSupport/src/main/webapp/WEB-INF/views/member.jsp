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