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
	function myPage_registStore() {
		if (confirm("등록하시겠습니까?")) {
			alert("등록신청 되었습니다. 관리자 승인 후 등록됩니다.");
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
						<h1>가맹점 등록</h1>
					</div>
					<div class="customer-account-container">
						<div class="customer-formbox">
							<form action="./myPage_registStore.do" method="post">
								<div class="field_row">
									<div class="field_title">가게 이름</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_name" value="${sessionScope.name }" readonly="readonly">
									</div>
								</div>
												
								<div class="field_row">
									<div class="field_title">주소</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_loc" placeholder="주소를 입력해주세요" required="required" >
								</div>

								<div class="field_row">
									<div class="field_title">구</div>
									<div class="field_label">
										<select name="shop_gu">
								<c:forEach items="${list }" var="l">
									<option value="${l.shop_gu }" >${l.shop_gu }</option>
								</c:forEach>
							</select>
									</div>
								</div>

								</div>
								<div class="field_row">
									<div class="field_title">연락처</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_tel"
											placeholder="연락처를 입력해주세요" required="required"
											>
									</div>

								</div>


								<div class="field_row">
									<div class="field_title">오픈 시간</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_opentime" required="required"
											placeholder="오픈 시간을 입력해주세요 ex)09:00">
									</div>
			
								</div>
																<div class="field_row">
									<div class="field_title">마감 시간</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_closetime" required="required"
											placeholder="마감 시간을 입력해주세요 ex)21:00">
									</div>
			
								</div>
								
								<div class="field_row">
									<div class="field_title">알립니다</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_notice" 
											placeholder="공지사항이 있다면 입력해주세요">
									</div>
								</div>




								<button id="" class="button_submit"
									onclick="return myPage_registStore()" type="submit">가맹점 등록</button>
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