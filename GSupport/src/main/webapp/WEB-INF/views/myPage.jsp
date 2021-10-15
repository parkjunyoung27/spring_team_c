<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script type="text/javascript">
	function linkPage(pageNo) {
		location.href = "./myPage.do?pageNo=" + pageNo;
	}
</script>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<style>
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
						<a href="" class="">
							<h4 class="card-title">예약</h4>
							<p class="card-text">??개</p>
						</a>
					</div>
				</div>


				<div class="card">
					<div class="card-body">
						<a href="" class="">
							<h4 class="card-title">쪽지</h4>
							<p class="card-text">??개 /안 읽은거 ??개</p>
						</a>
					</div>
				</div>

				<div class="card">
					<div class="card-body">
						<a href="myPage_bookmark.do" class="">
							<h4 class="card-title">즐겨찾기</h4>
							<p class="card-text">??건</p>
						</a>
					</div>
				</div>
			</div>

			<div class="customer_content">
				<h1>예약 리스트</h1>
				<c:forEach items="${reserve }" var="r">
					<div class="customer_content_reservHistory">
						<div class="customer_content_reservHistory_header">예약 번호 :
							${r.reservation_no }</div>
						<div class="customer_content_reservHistory_content">
							<div class="customer_content_reservHistory_content_detail">
								가게이름 : ${r.shop_name } <br> 예약자 : ${r.member_name } <br>
								예약날짜 : ${r.reservation_reservDate } <br> 예약시간 :
								${r.reservation_reservTime } <br> 몇 명 :
								${r.reservation_people } <br>

							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="boardPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text"
					jsFunction="linkPage" />
			</div>

			<div class="customer_content">
				<h1>즐겨찾기 리스트</h1>
				<div class="customer_content_reservHistory">
					<div class="customer_content_reservHistory_header">
						<div class="customer_content_reservHistory_content">
							<div class="customer_content_reservHistory_content_detail">

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