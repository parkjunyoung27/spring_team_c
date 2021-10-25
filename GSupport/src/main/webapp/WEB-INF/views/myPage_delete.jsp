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

.customer-content-detail {
	line-height: 1.6;
	text-align: center;
}
</style>
<script type="text/javascript">
	function mypageDelete() {
		if (confirm("탈퇴하시겠습니까?")) {
			alert("탈퇴 되었습니다.");
			return true;
		} else {
			alert("취소 되었습니다.");
			return false;
		}
	}

	function move() {
		location.href = "./index.do";
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
						<h1>회원 탈퇴</h1>
					</div>
					<div class="customer-account-container">

						<div class="customer-content-detail">
							<p>
								탈퇴신청시 아래 사항을 확인하시기 바랍니다. <br> 회원탈퇴 후 재가입 시에는 신규가입으로 처리되며,<br>
								탈퇴하신 ID는 다시 사용하실 수 없습니다. <br> 회원탈퇴 후 재가입은 탈퇴일로부터 30일 이후
								가능합니다. <br>
							</p>
							<form action="./myPage_delete.do" method="post">
								<button onclick="return mypageDelete()" class="button_submit"
									type="submit">회원 탈퇴하기</button>
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