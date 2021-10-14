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

<title>My Page Delete</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">


<style>

/* Middle column */
.column.middle {
	margin-left: 10px;
	width: 70%;
	background-color: white;
}

.customer_content {
	border-top: 1px solid #141414;
	background-color: #ffffff;
	margin-top: 20px;
	padding: 10px;
}

.customer_content_header {
	border-bottom: 1px solid #e5e5e5;
	margin-bottom: 20px;
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
<script type="text/javascript">
function mypageDelete(){
	if(confirm("탈퇴하시겠습니까?")){
		alert("탈퇴 되었습니다.");
		return true;
	} else{
		alert("취소 되었습니다.");
		return false;
	}
}

function move(){
	location.href="./index.do";
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
			<div class="customer_content">
				<div class="customer_content_header">
					<h1>회원 탈퇴</h1>
					<div class="customer_content_detail">
						<p>
							탈퇴신청시 아래 사항을 확인하시기 바랍니다. <br> 회원탈퇴 후 재가입 시에는 신규가입으로 처리되며,
							탈퇴하신 ID는 다시 사용하실 수 없습니다. <br> 회원탈퇴 후 재가입은 탈퇴일로부터 30일 이후
							가능합니다. <br>
						</p>
					</div>
					<form action="./mypageDelete.do" method="post">
						<button onclick="return mypageDelete()" class="button_submit" type="submit">회원 탈퇴하기</button>
					</form>
				</div>
			</div>
		</div>


	</div>


	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>


</body>
</html>