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


.button_submit {
	float:right;
	width: 100px;
	height: 30px;
	font-size: 20px;
	text-align: center;
	font-weight: bold;
	background-color: green;
	color: white;
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
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">예약</h4>
						<p class="card-text">??개</p>
						<a href="#" class="btn btn-primary">예약 확인</a>
					</div>
				</div>

				<div class="card">
				<a href="" class="">
					<div class="card-body">
						<h4 class="card-title">쪽지</h4>
						<p class="card-text">??개 /안 읽은거 ??개</p>
					</div>
				</a>
				</div>

				<div class="card">
					<div class="card-body">
						<h4 class="card-title">즐겨찾기</h4>
						<p class="card-text">??건</p>
						<a href="#" class="btn btn-primary">즐겨찾기</a>
					</div>
				</div>
			</div>

			<div class="customer_content">
				<h1>예약 목록</h1>
				<c:forEach items="${reserve }" var="r">
					<div class="customer_content_reservHistory">
						<div class="customer_content_reservHistory_header">예약 번호 :
							${r.reservation_no }
							<c:choose>
								<c:when test="${r.reservation_status eq 'cancel' || r.reservation_status eq 'success' }">
									<button class="button_submit" type="submit" onclick="return cancel(${r.shop_no})" disabled="disabled" style="background-color: red">예약 취소</button>
								</c:when>
								<c:otherwise>
									<button class="button_submit" type="submit" onclick="return cancel(${r.shop_no})">예약 취소</button>
								</c:otherwise>
							</c:choose>
							<button class="button_submit" type="submit">예약 승인</button>
							</div>
						<div class="customer_content_reservHistory_content">
							<div class="customer_content_reservHistory_content_detail">
								가게이름 : ${r.shop_name } <br> 예약자 : ${r.member_name } <br>
								예약날짜 : ${r.reservation_reservDate } <br> 예약시간 :
								${r.reservation_reservTime } <br> 몇 명 :
								${r.people }명 <br>
								요구사항 : ${r.reservation_reservRequest } <br>
								예약현황 : 	
								<c:choose>
									<c:when test="${r.reservation_status eq 'wait' }">
										예약 확인중
									</c:when>
									<c:when test="${r.reservation_status eq 'success' }">
										예약 성공
									</c:when>
									<c:when test="${r.reservation_status eq 'cancel' }">
										예약 취소
									</c:when>
								</c:choose>
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
	<%@ include file= "./component/footer.jsp"%>
	

</body>
</html>