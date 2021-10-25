<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page Bookmark</title>
<script type="text/javascript">
	function linkPage(pageNo) {
		location.href = "./myPage_bookmark.do?pageNo=" + pageNo;
	}
</script>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<script src="../assets/js/core/bootstrap.min.js" type="text/javascript"></script>
<style>
.customer_content_reserv {
	min-height: 350px;
	font-size:13px;
}

.customer_content_reservHistory {
	background-color: #ffffff;
	padding: 10px;
	float: left;
	width: 50%;
}

.customer_content_reservHistory_header {
	text-align: center;
	background-color: #00000008;
	border: 1px solid #e5e5e5;
	height: 40px;
	padding: 5px;
}

.customer_content_reservHistory_content {
	line-height: 30px;
	border: 1px solid #e5e5e5;
	border-top: none;
	padding: 10px 20px 10px 20px;
	text-align: center;
}

.button_submit1 {
	float: right;
	width: auto;
	height: 20px;
	font-size: 10px;
	text-align: center;
	font-weight: bold;
	background-color: white;
	color: green;
	border: none;
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
			<div class="customer_content">
				<div class="customer-content-section">
					<div class="customer-content-header">
						<h2>즐겨찾기 목록</h2>
					</div>
					<div class="customer_content_reserv">
						<c:forEach items="${list }" var="l">
							<div class="customer_content_reservHistory">
								<div class="customer_content_reservHistory_header">
									<a href="./storeDetail.do?shop_no=${l.shop_no }">${l.shop_name }</a>
									<button class="button_submit1" type="submit">
										<img src="resources/images/star_after.png"
											style="height: 20px;">
									</button>
								</div>
								<div class="customer_content_reservHistory_content">
									<div class="customer_content_reservHistory_content_detail">
										${l.shop_loc } <br> ${l.shop_tel } <br>
										${l.shop_opentime } ~ ${l.shop_closetime }

									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
				<div id="boardPaging">
					<ui:pagination paginationInfo="${paginationInfo }" type="text"
						jsFunction="linkPage" />
				</div>
			</div>
		</div>


	</div>




	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>


</body>
</html>