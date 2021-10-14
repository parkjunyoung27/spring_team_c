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

.input-text-readonly {
	margin-bottom: 10px;
	width: 500px;
	height: 50px;
	font-size: 20px;
	text-align: center;
	background-color: #C8C8C8;
	font-weight: bold;
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
						<h1>회원 정보 수정</h1>
					</div>
					<div class="customer-account-container">
						<div class="customer-formbox">
							<form action="./myPage_update.do" method="post">
								<div class="field_row">
									<div class="field_title">아이디</div>
									<div class="field_label">
										<input type="text" class="input-text-readonly" name="id"
											value="${myinfo.member_id}" readonly="readonly">
									</div>
								</div>

								<div class="field_row">
									<div class="field_title">이름</div>
									<div class="field_label">
										<input type="text" class="input-text-readonly" name="name"
											placeholder="" readonly="readonly"
											value="${myinfo.member_name}">
									</div>

								</div>

								<div class="field_row">
									<div class="field_title">이메일</div>
									<div class="field_label">
										<input type="text" class="input-text" placeholder=""
											name="email" value="${myinfo.member_email }">
									</div>
								</div>

								<div class="field_row">
									<div class="field_title">연락처</div>
									<div class="field_label">
										<input type="text" class="input-text" name="phonenum"
											value="${myinfo.member_phonenum }">
									</div>

								</div>


								<button id="" class="button_submit"
									onclick="return mypageUpdate()" type="submit">회원정보 수정</button>
							</form>
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