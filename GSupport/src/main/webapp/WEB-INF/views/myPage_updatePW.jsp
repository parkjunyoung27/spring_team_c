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
	border-bottom: 1px solid #d8d8d8;
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
	font-size: 20px;
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
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
	});
	function PW1Check() {
		var pw1 = $("#pw1").val();
		if (pw1 == "" || pw1.length < 7) {
			$("#checkResult1").css("color", "red");
			$("#checkResult1").text("비밀번호는 일곱 글자 이상이어야 합니다.");
			$("#pw1").focus();
			$("#submit").attr("disabled", true);
			return false;
		} else {
			$("#checkResult1").css("color", "green");
			$("#checkResult1").text("");
			return true;
		}
	}
	function PW2Check() {
		var pw1 = $("#pw1").val();
		var pw2 = $("#pw2").val();
		if (pw1 != pw2) {
			$("#checkResult2").css("color", "red");
			$("#checkResult2").text("비밀번호가 일치하지 않습니다.");
			$("#pw1").focus();
			$("#submit").attr("disabled", true);
			return false;
		} else {
			$("#checkResult2").css("color", "green");
			$("#checkResult2").text("");
			$("#submit").attr("disabled", false);
			return true;
		}
	}
	function submit() {
		alert("비밀번호가 수정되었습니다.");
	}
</script>
</head>
<body>

	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- Mypage menu -->
	<section class="container">
		<%@ include file="./myPage_menu.jsp"%>

		<!-- Mypage Content -->
		<div class="column middle">
			<div class="customer-content">
				<div class="customer-content-section">
					<div class="customer-content-header">
						<h1>비밀번호 변경</h1>
					</div>
					<div class="customer-account-container">
						<div class="customer-formbox">
							<form method="POST" class="" action="/myPage_updatePW.do">

								<!-- 								<div class="field_row">
									<div class="field_title">현재 비밀번호 입력</div>
									<div class="field_label">
										<input type="text" class="input-text"
											data-parsley-trigger="keyup"
											data-parsley-required-message="필수 입력 항목입니다."
											data-parsley-equalto-message="입력값이 일치하지 않습니다."
											data-parsley-required="true" placeholder="" value="">
									</div>-->


								<div class="field_row">
									<div class="field_title">새 비밀번호 입력</div>
									<div class="field_label">

										<input type="password" name="pw1" id="pw1" class="input-text"
											required="required" onchange="return PW1Check()">
										<p id="checkResult1"></p>
										<!-- 										<--	data-parsley-trigger="keyup"
											data-parsley-required-message="필수 입력 항목입니다."
											data-parsley-equalto-message="입력값이 일치하지 않습니다."
											data-parsley-required="true" -->
									</div>

								</div>

								<div class="field_row">
									<div class="field_title">새 비밀번호 재입력</div>
									<div class="field_label">
										<input type="password" name="pw2" id="pw2" class="input-text"
											required="required" onchange="return PW2Check()">
										<p id="checkResult2"></p>
										<!-- data-parsley-trigger="keyup"
											data-parsley-required-message="필수 입력 항목입니다."
											data-parsley-equalto-message="입력값이 일치하지 않습니다."
											data-parsley-required="true" -->
									</div>

								</div>
						</div>





						<button class="button_submit" id="submit" type="submit"
							disabled="disabled">비밀번호 수정</button>
						<c:if test="${param.msg eq 'ok'}">
							<script type="text/javascript">
								alert("비밀번호가 성공적으로 변경되었습니다.");
							</script>
						</c:if>
					</div>
					</form>

				</div>
			</div>
		</div>
	</section>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
</body>
</html>
