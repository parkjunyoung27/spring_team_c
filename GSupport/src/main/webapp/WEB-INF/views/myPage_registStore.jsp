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
	font-size: 20px;
	margin-bottom: 10px;
	border-bottom: 1px solid #ebebeb;
}
.guBox {
	border-radius: 5px;
	text-align: center;
	width: 50%;
	font-size: 20px;
	margin-bottom: 10px;
	border-bottom: 1px solid #ebebeb;
}
</style>
<script type="text/javascript">
	function myPage_registStore() {
		if (confirm("가맹점 등록 신청하시겠습니까?")) {
			alert("신청 되었습니다.");
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
 							<p>
								가맹점 등록시 아래 사항을 확인하시기 바랍니다. <br> 가맹점 등록은 업주 본인만 가능합니다.<br>
								등록하시기 전에 회원정보 수정을 통해 본인의 닉네임을 가맹점 이름과 동일하게 수정해주세요. <br> 
								가맹점 등록 신청시 관리자 검토 후 등록되며 가맹점 찾기/예약 서비스를 이용할 수 있습니다. <br><br><br><br><br>
							</p> 
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
							<select name="shop_gu" class="guBox">
								<option selected="selected" disabled="disabled">설정하세요.</option>
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
									<div class="field_title">
										<div class="time_left">오픈 시간</div>
										<div class="time_right">마감 시간</div>
									</div>
									<div class="field_label">
										<div class="time_left">
											<input type="text" name="shop_opentime" class="time_input" placeholder="ex)09:00">
										</div>
										<div class="time_right">
											<input type="text" name="shop_closetime" class="time_input" placeholder="ex)18:00">
										</div>
									</div>
								</div>

								<div class="field_row">
									<div class="field_title">
										<br>알립니다
									</div>
									<div class="field_label">
										<input type="text" class="input-text" name="shop_notice"
											placeholder="공지사항이 있다면 입력해주세요">
									</div>
								</div>



								<button id="" class="button_submit"
									onclick="return myPage_registStore()" type="submit" >가맹점 등록 신청</button>
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