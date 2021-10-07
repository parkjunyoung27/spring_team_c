<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<link href="./resources/css/index.css" rel="stylesheet">
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<style>
* {
	box-sizing: border-box;
}

.container {
	height: 1000px;;
}

.row {
	margin-top: 200px;
	height: auto;
}

.title {
	font-size: 25px;
}

/* Create two unequal columns that floats next to each other */
.column {
	float: left;
	padding: 20px;
}

/* Left and right column */
.column.side {
	width: 25%;
	border-style: solid 1px;
	height: 200px;
	border-radius: 20px;
}

.customer_side {
	margin-top: 25px;
	margin-bottom: 25px;
}

.customer_side ul {
	list-style-type: none;
}
/* Middle column */
.column.middle {
	margin-left: 10px;
	width: 70%;
	background-color: white;
}

.activity {
	width: auto;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

.card {
	border-radius: $border-radius-extreme;
	box-shadow: 0 6px 10px -4px rgba(0, 0, 0, 0.15);
	background-color: #FFFFFF;
	color: $card-black-color;
	margin-bottom: 20px;
	margin-right: 0px;
	position: relative;
	border: 0 none;
	width: 25%;
	text-align: center;
	display: inline-block;
}

.card .card-body {
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
	margin-bottom: 20px;
}

.customer_content_reservHistory_content {
	border-bottom: 1px solid #e5e5e5;
	padding: 20px;
}
</style>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- main -->
	<div class="container">
		<div class="row">
			<div class="column side">
				<div class="account_profile">
					<div class="title">
						<h1>
							마이페이지<br>
						</h1>
						<span class="name"><strong>${sessionScope.name}</strong> 님
							안녕하세요</span>
					</div>
				</div>
				<div class="customer_side">
					<h1 class="customer_side_title">나의 정보</h1>
					<ul class="customer_side_list">
						<li><a href="">회원정보 수정 </a></li>
						<li><a href="">비밀번호 변경 </a></li>
						<li><a href="">회원정보 수정 </a></li>
						<li><a href="">회원 탈퇴 </a></li>
					</ul>
				</div>

				<div class="customer_side">
					<h1 class="customer_side_title">예약 관리</h1>
					<ul class="customer_side_list">
						<li><a href="">예약 확인하기 </a></li>
						<li><a href="">예약 변경 / 취소 </a></li>
					</ul>
				</div>

				<div class="customer_side">
					<h1 class="customer_side_title">활동</h1>
					<ul class="customer_side_list">
						<li><a href="">쪽지함 </a></li>
						<li><a href="">쪽지 보내기 </a></li>
					</ul>
				</div>

				<div class="customer_side">
					<h1 class="customer_side_title">즐겨찾기</h1>
					<ul class="customer_side_list">
						<li><a href="">즐겨찾기 관리 </a></li>
					</ul>
				</div>
			</div>

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
						<div class="card-body">
							<h4 class="card-title">쪽지</h4>
							<p class="card-text">??개</p>
							<a href="#" class="btn btn-primary">쪽지함</a>
						</div>
					</div>

					<div class="card">
						<div class="card-body">
							<h4 class="card-title">즐겨찾기</h4>
							<p class="card-text">??건</p>
							<a href="#" class="btn btn-primary">Go somewhere</a>
						</div>
					</div>
				</div>

				<c:forEach items="${reserve }" var="r">
					<div class="customer_content">
						<h1>예약 리스트</h1>
						<div class="customer_content_reservHistory">
							<div class="customer_content_reservHistory_header">
							예약 번호 : ${r.reservation_no } </div>
							<div class="customer_content_reservHistory_content">
								<div class="customer_content_reservHistory_content_detail">
									가게이름 : ${r.shop_no } <br> 
									예약날짜 : ${r.reservation_reservDate } <br> 
									예약시간 : ${r.reservation_reservTime } <br> 
									몇 명 : ${r.reservation_people } <br>

								</div>
							</div>
						</div>
				</c:forEach>
				<div class="customer_content">
					<h1>즐겨찾기 리스트</h1>
					<div class="customer_content_reservHistory">
						<div class="customer_content_reservHistory_header">
							<div class="customer_content_reservHistory_content">
								<div class="customer_content_reservHistory_content_detail">

									<%-- <c:forEach items="${list }" var="w">
 		${w.board_no} / 
 		${w.board_title }<br>
					</c:forEach> --%>
								</div>
							</div>
						</div>




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