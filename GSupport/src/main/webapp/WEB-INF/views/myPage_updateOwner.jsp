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
						<h1>가맹점 정보 수정</h1>
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
											placeholder="" 
											value="${mystore.shop_loc }">
								</div>

								<div class="field_row">
									<div class="field_title">구</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_gu"
											value="${mystore.shop_gu }">
									</div>
								</div>

								</div>
								<div class="field_row">
									<div class="field_title">연락처</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_tel"
											placeholder="" 
											value="${mystore.shop_tel }">
									</div>

								</div>


								<div class="field_row">
									<div class="field_title">오픈 시간</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_opentime"
											value="${mystore.shop_opentime }">
									</div>
			
								</div>
																<div class="field_row">
									<div class="field_title">마감 시간</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_closetime"
											value="${mystore.shop_closetime }">
									</div>
			
								</div>
								
								<div class="field_row">
									<div class="field_title">알립니다</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_notice"
											value="${mystore.shop_notice }">
									</div>
								</div>




								<button id="" class="button_submit"
									onclick="return myPage_updateStore()" type="submit">정보 수정</button>
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