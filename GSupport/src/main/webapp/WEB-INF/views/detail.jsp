<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 상세보기</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">

<style type="text/css">
#detail_btn button:hover {
	background-color: white;
	font-weight: 700;
	color:green;
}
</style>

<script type="text/javascript">
function board_delete(no1, no2){
	var result = confirm("정말 삭제하시겠습니까?");
	if(result == true){
		location.href="./delete.do?categoryNo="+no1+"&board_no="+no2;
	}
}
</script>

</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- board -->
	<div class="container">

		<!--서브메뉴바 -->
		<c:import url="./sub_board_menu.jsp" />
		<div id="content">
<%-- 			<div id="content_title_border">
				<c:if test="${detail.board_name eq detail.board_name }">
					<a href="/GSupport/board.do?categoryNo=${param.categoryNo }">
						${detail.board_name} </a>
				</c:if>

				</div> --%>

		<div id="bdetail_area">
			<div id="content_title">
				<div id="dtitle">${detail.board_title}<br>
				</div>

			</div>
			<div id="dtitle_area">

				<div id="dmember">${detail.member_name}
					<div id="detail_btn">
						<c:if test="${sessionScope.id eq detail.member_id }">
							<button	onclick="location.href='./update.do?categoryNo=${param.categoryNo }&board_no=${detail.board_no }'">수정하기</button>
						</c:if>
						<c:if test="${sessionScope.id eq detail.member_id || sessionScope.grade eq '3' }">
							<button	onclick="return board_delete( ${param.categoryNo }, ${detail.board_no })">삭제하기</button>
						</c:if>
					</div>

					<div id="ddate">
						<jsp:useBean id="today" class="java.util.Date" />
						<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
						<fmt:formatDate var="write_date" value="${detail.board_date}"
							pattern="yyyyMMdd" />
						<c:choose>
							<c:when test="${write_date eq now}">
								<fmt:formatDate value="${detail.board_date}" pattern="HH:mm" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${detail.board_date}"
									pattern="yyyy.MM.dd" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>

			<div id="dcontent">${detail.board_content }</div>

			<div id="dcontent">
				<c:if test="${detail.board_orifile ne '' }">
				<img alt="Can't_load_this_image"
					src="./resources/upfile/upload/${detail.board_file }">
				</c:if>
			</div>

			<!-- 댓글쓰기 --> 
			<c:if test="${sessionScope.id ne null }">
				<%@ include file="./component/comment.jsp"%>
			</c:if>
			


			
			

		</div>
		</div>
	</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>