<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page Update</title>
<link href="./resources/css/index.css" rel="stylesheet">
<style>
.container {
	margin-top: 30px;
	text-decoration: none;
	font-size: large;
	letter-spacing: 1px;
	min-height: 1400px;
}

.customer-content {
	float: center;
	padding-bottom: 50px;
	border-bottom: 1px solid #d8d8d8;
}

.customer-content-header {
	padding-bottom: 40px; position : relative;
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
						<h1>회원 정보 수정</h1>
					</div>
					<div class="customer-account-container">
						<div class="customer-formbox">
							<form method="POST" class="" action="account">
								<div class="field_row">
									<div class="field_title">이름</div>
									<div class="field_label">
										<input type="text" class="input-text"
											data-parsley-trigger="keyup"
											data-parsley-required-message="필수 입력 항목입니다."
											data-parsley-equalto-message="입력값이 일치하지 않습니다."
											data-parsley-required="true" placeholder="이름"
											readonly="readonly" value="">
									</div>

								</div>

								<div class="field_row">
									<div class="field_title">이메일</div>
									<div class="field_label">
										<input type="text" class="input-text"
											data-parsley-trigger="keyup"
											data-parsley-required-message="필수 입력 항목입니다."
											data-parsley-equalto-message="입력값이 일치하지 않습니다."
											data-parsley-required="true" placeholder="이름"
											readonly="readonly" value="">
									</div>

								</div>

								<div class="field_row">
									<div class="field_title">연락처</div>
									<div class="field_label">
										<input type="text" class="input-text"
											data-parsley-trigger="keyup"
											data-parsley-required-message="필수 입력 항목입니다."
											data-parsley-equalto-message="입력값이 일치하지 않습니다."
											data-parsley-required="true" placeholder="이름"
											readonly="readonly" value="">
									</div>

								</div>



							</form>

							<button class="button_submit" type="submit">회원정보 수정</button>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>


	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
</body>
</html>