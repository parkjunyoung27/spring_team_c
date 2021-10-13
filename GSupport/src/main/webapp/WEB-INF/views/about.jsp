<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<style>
* {
	box-sizing: border-box;
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
	background-color: #5AA733;
	height: 200px;
	border-radius: 20px;
	color:white;	
}

.column.a {
	color:white;
}

/* Middle column */
.column.middle {
	margin-left: 10px;
	width: 70%;
	background-color: white;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}
</style>
</head>
<body>


	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- main -->
	<div class="container">
			<div class="column side">
				<div class="title">G원사격</div>
				<div>
					<a href=""> G원사격이란 </a> <br>
				</div>
				<div>
					<a href=""> 문의사항?</a>
				</div>
			</div>

			<div class="column middle">
				<h2>
					어린이 급식지원사업 전 과정을 전자카드 시스템화 함으로써<br> 효율과 신속성, 투명성을 높여 어린이 복지행정의
					신기원을 이루게 되었습니다.
				</h2>

				<p>그간 대부분의 지방자치단체는 어린이 복지 차원에서 급식지원사업을 벌여 왔습니다. 식권의
					발행-배부-사용-집계-결제의 전 과정이 효율적이지 못하고, 실시간 집계의 어려움 등으로 행정적인 소모와 가맹점의 불편,
					이용 어린이의 불편이 가중 되어 왔습니다.<br></p>
				<p>이에 당사는 각 자치단체와의 협의 하에 이 사업의 개선의 개선을 도모하게 되었고 이 사업 전 과정을 전자카드
					시스템화 함으로써 신속성, 투명성을 높여 어린이복지행정의 신기원을 이루게 되었습니다.<br></p>
				<p>그간 대부분의 지방자치단체는 어린이 복지 차원에서 급식지원사업을 벌여 왔습니다. 식권의
					발행-배부-사용-집계-결제의 전 과정이 효율적이지 못하고, 실시간 집계의 어려움 등으로 행정적인 소모와 가맹점의 불편,
					이용 어린이의 불편이 가중 되어 왔습니다.<br></p>
				<h2> 시스템의 특징 </h2>
				<p>급식지원비를 포인트 방식으로 변경하고 관리 하여 횟수, 금액 단위, 사용 실적의 실시간 집계가 가능하게 되었습니다. <br>
				</p>
				<p>카드 소지자들의 사용 내역을 전자적으로 승인 사용하여 집계-입금의 전 과정이 투명하고 편리합니다.<br></p>
				<p>가맹점의 입금 주기가 빨라져 경영사의 어려움을 해소 할 수 있습니다.<br></p>
			</div>
		</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>