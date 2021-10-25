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

<title>My Page Update For owners</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">


<style>
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

.time_left {
	float: left;
	width: 50%;
	border: none;
	float: left;
}

.time_right {
	float: right;
	padding-right: 150px;
	width: 50%;
	border: none;
}

.time_input {
	padding: 5px 10px;
	border: none;
	height: 50px;
	font-size: 13px;
	margin-bottom: 10px;
	border-bottom: 1px solid #ebebeb;
}

.guBox {
	border-radius: 5px;
	text-align: center;
	width: 50%;
	margin-bottom: 10px;
	border-bottom: 1px solid #ebebeb;
}
</style>
<script type="text/javascript">
	function myPage_updateStore() {
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
						<h2>가맹점 정보 수정</h2>
					</div>
					<div class="customer-account-container">
						<div class="customer-formbox">
							<form action="./myPage_updateStore.do" method="post">
								<div class="field_row">
									<div class="field_title">가게 이름</div>
									<div class="field_label">
										<input type="text" class="input-text" placeholder=""
											name="shop_name" value="${mystore.shop_name }">
									</div>
								</div>

								<div class="field_row">
									<div class="field_title">주소</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_loc"
											placeholder="" value="${mystore.shop_loc }">
									</div>
								</div>
								<div class="field_row">
									<div class="field_title">현재 해당 구</div>
									<div class="field_label">
										<select name="shop_gu" class="guBox">
											<option value="${mystore.shop_gu }" selected="selected">설정하세요.</option>
											<c:forEach items="${list }" var="l">
												<option value="${l.shop_gu }">${l.shop_gu }</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="field_row">
									<div class="field_title">연락처</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_tel"
											placeholder="" value="${mystore.shop_tel }">
									</div>

								</div>


								<div class="field_row">
									<div class="field_title">
										<div class="time_left">오픈 시간</div>
										<div class="time_right">마감 시간</div>
									</div>
									<div class="field_label">
										<div class="time_left">
											<input type="text" name="shop_opentime" class="time_input"
												value="${mystore.shop_opentime }">
										</div>
										<div class="time_right">
											<input type="text" name="shop_closetime" class="time_input"
												value="${mystore.shop_closetime }">
										</div>
									</div>
								</div>



								<div class="field_row">
									<div class="field_title">
										<br>알립니다
									</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_notice"
											value="${mystore.shop_notice }">
									</div>
								</div>




								<button id="" class="button_submit"
									onclick="return myPage_updateStore()" type="submit">가맹점
									수정</button>
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