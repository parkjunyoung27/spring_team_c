<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page Reservation</title>
<script type="text/javascript">
	function linkPage(pageNo) {
		location.href = "./myPage_reserv.do?pageNo=" + pageNo;
	}
	function cancel(no){
		if(confirm("예약 취소하시겠습니까?")){
			location.href='./reservCancel.do?shop_no='+no
		}
	}
</script>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<style>
.reserv {
	height: auto;
	padding: 10px;
	border-radius: $border-radius-extreme;
	background-color: #fafafa;
	box-shadow: 4px 4px 10px -5px rgb(0 0 0/ 15%);
	margin-bottom: 20px;
	margin-right: 0px;
	position: relative;
	text-align: center;
	border: 0 none;
	display: table-cell;
	border: 0 none;
	font-size: 15px;
}

.reserv .reserv-body {
	padding: 15px 15px 10px
}

.customer_content_reservHistory {
	border-top: 1px solid #141414;
	background-color: #ffffff;
	margin-top: 20px;
	padding: 10px;
}

.customer_content_reservHistory_header {
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 10px;
	height: 40px;
	padding-left: 10px;
	padding-right:10px;
	font-size:20px;
}

.customer_content_reservHistory_content {
    line-height: 30px;
	border-bottom: 1px solid #e5e5e5;
	padding: 10px 20px 10px 20px;
	font-size: 15px;
}

.button_submit {
	float: right;
	font-size: 14px;
	text-align: center;
	font-weight: bold;
	background-color: green;
	color: white;
	margin-right:20px;
}

.date {
	font-size:17px;
	float: right;
	text-align: center;
}
</style>
<body>

	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<div class="container">
		<!-- Mypage menu -->
		<%@ include file="./myPage_menu.jsp"%>

		<!-- Mypage Content -->
		<div class="column middle">

			<div class="activity">
				<div class="reserv">

					<div class="reserv-body">
						<h3 class="reserv-title">
							<a href="./myPage_reserv.do?status=wait">예약 대기 중<br>
						<c:if test="${wait eq null}">0</c:if>
						<c:if test="${wait ne null}">${wait }</c:if> 개
							</a>
						</h3>

					</div>

				</div>

				<div class="reserv">
					<div class="reserv-body">
						<h3 class="reserv-title">
							<a href="./myPage_reserv.do?status=success">예약 승인<br>
						<c:if test="${success eq null}">0</c:if>
						<c:if test="${success ne null}">${success }</c:if> 개
							</a>
						</h3>
						
					</div>
				</div>

				<div class="reserv">
					<div class="reserv-body">
						<h3 class="reserv-title">
							<a href="./myPage_reserv.do?status=cancel">예약 취소<br>
						<c:if test="${cancel eq null}">0</c:if>
						<c:if test="${cancel ne null}">${cancel }</c:if> 개
							</a>
						</h3>

					</div>
				</div>

			</div>

			<div class="customer_content">
				<h1>예약 목록</h1>
				<c:forEach items="${reserve }" var="r">

					<div class="customer_content_reservHistory">
						<div class="customer_content_reservHistory_header">
							예약 번호 : ${r.reservation_no }
								<div class="date">
									<h3>${r.reservation_reservDate } ${r.reservation_reservTime } </h3>
								</div>
						</div>
						<div class="customer_content_reservHistory_content">
							<div class="customer_content_reservHistory_content_detail">
							<c:choose>
								<c:when
									test="${r.reservation_status eq 'cancel' || r.reservation_status eq 'success' }">
									<button class="button_submit" type="submit"
										onclick="return cancel(${r.shop_no})" disabled="disabled"
										style="background-color: red">예약 취소</button>
								</c:when>
								<c:otherwise>
									<button class="button_submit" type="submit"
										onclick="return cancel(${r.shop_no})">예약 취소</button>
								</c:otherwise>
							</c:choose>

								<h2>${r.shop_name }</h2>
								${r.people }명 <br> 예약 현황 :
								<c:choose>
									<c:when test="${r.reservation_status eq 'wait' }">
									<span style="color:green; font-weight:bold;">예약 대기 중</span>
									</c:when>
									<c:when test="${r.reservation_status eq 'success' }">
									<span style="color:blue; font-weight:bold;"> 예약 성공</span>
									</c:when>
									<c:when test="${r.reservation_status eq 'cancel' }">
										<span style="color:red; font-weight:bold;">예약 취소</span>
									</c:when>
								</c:choose>
								<h4>요구사항 : ${r.reservation_reservRequest }</h4>


							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="boardPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text"
					jsFunction="linkPage" />
			</div>
		</div>

	</div>




	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>


</body>
</html>