<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>My Page Update Password</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">

<style>
.customer-content {
	float: center;
	padding-bottom: 50px;
	border-bottom: 0.5px solid #d8d8d8;
}

.customer-content-header {
	padding-bottom: 40px;
	position: relative;
	border-bottom: 5px solid black;
	background-color: white;
	font-size: 15px;
	margin-bottom: 35px;
	font-weight: bold;
	position: relative;
}

.customer-account-container {
	top: 50%;
	left: 25%;
	position: relative;
}

.field_row {
	font-size: 15px;
}

.field_title {
	padding-bottom: 10px;
	margin-bottom: 10px;
}

.input-text {
	margin-bottom: 10px;
	width: 500px;
	height: 50px;
	font-size: 20px;
	text-align: center;
}

.button_submit {
	width: 500px;
	height: 50px;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	background-color: green;
	color: white;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
	});

	function PW1Check() {
		var pw1 = $("#pw11").val();
		//alert(pw1);
		//alert(pw1.length);
		if (pw1.length < 7) {
			$("#checkResult1").css("color", "red");
			$("#checkResult1").text("비밀번호는 일곱 글자 이상이어야 합니다.");
			$("#pw1").focus();
			$("#pwEdit").attr("disabled", true);
			return false;
		} else {
			$("#checkResult1").css("color", "green");
			$("#checkResult1").text("사용할 수 있습니다.");
			return true;
		}
	}
	function PW2Check() {
		var pw1 = $("#pw11").val();
		var pw2 = $("#pw2").val();
		if (pw1 != pw2) {
			$("#checkResult2").css("color", "red");
			$("#checkResult2").text("입력값이 일치하지 않습니다.");
			$("#pw1").focus();
			$("#pwEdit").attr("disabled", true);
			return false;
		} else {
			$("#checkResult2").css("color", "green");
			$("#checkResult2").text("일치합니다.");
			$("#pwEdit").attr("disabled", false);
			return true;
		}
	}
	function mypageUpdate() {
		if (confirm("수정하시겠습니까?")) {
			alert("수정 되었습니다.");
			return true;
		} else {
			alert("취소 되었습니다.");
			return false;
		}
	}
</script>
</head>
<body>

	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- Mypage menu -->
	<div class="container">
		<%@ include file="./myPage_menu.jsp"%>

		<!-- Mypage Content -->
		<div class="column middle">
			<div class="customer-content">
				<div class="customer-content-section">
					<div class="customer-content-header">
						<h1>비밀번호 변경</h1>
					</div>
					<div class="customer-account-container">
						<form action="./myPage_updatePW.do" method="post"
							onsubmit="submit()">
							<div class="customer-formbox">
								<div class="field_row">
									<div class="field_title">새로운 비밀번호 입력</div>
									<div class="field_label">

										<input type="password" placeholder="비밀번호를 입력하세요." name="pw1"
											id="pw11" class="input-text" required="required"
											onchange="return PW1Check()">
										<p id="checkResult1"></p>
										<!-- 										<--	data-parsley-trigger="keyup"
											data-parsley-required-message="필수 입력 항목입니다."
											data-parsley-equalto-message=""
											data-parsley-required="true" -->
									</div>

								</div>

								<div class="field_row">
									<div class="field_title">새로운 비밀번호 재입력</div>
									<div class="field_label">
										<input type="password" placeholder="비밀번호를 입력하세요." name="pw2"
											id="pw2" class="input-text" required="required"
											onchange="return PW2Check()">
										<p id="checkResult2"></p>
										<!-- data-parsley-trigger="keyup"
											data-parsley-required-message="."
											data-parsley-equalto-message="입력값이 일치하지 않습니다."
											data-parsley-required="true" -->
									</div>

								</div>
							</div>




							<button class="button_submit" id="pwEdit" type="submit" onclick="return mypageUpdate()"
								disabled="disabled">비밀번호 수정</button>
						</form>
					</div>


				</div>
			</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
</body>
</html>
