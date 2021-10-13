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

<title>My Page Update</title>
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
	left: 5%;
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
									<div class="field_title">이메일</div>
									<div class="field_label">
										<input type="text" class="input-text" placeholder=""
											readonly="readonly" value="${sessionScope.email}">
									</div>
								</div>

								<div class="field_row">
									<div class="field_title">이름</div>
									<div class="field_label">
										<input type="text" class="input-text" placeholder=""
											readonly="readonly" value="${sessionScope.name}">
									</div>

								</div>
								
								<div class="field_row">
									<div class="field_title">아이디</div>
								<form action="./myinfoUpdate.do" method="post">
									<div class="field_label">
										<input type="text" class="input-text" placeholder=""
											value="${sessionScope.member_id}">
									</div>
									
									</form>
								</div>

								<div class="field_row">
									<div class="field_title">연락처</div>
									<div class="field_label">
										<input type="text" class="input-text" value="${sessionScope.phonenum }">
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
	<%@ include file= "./component/footer.jsp"%>
	

</body>
</html>