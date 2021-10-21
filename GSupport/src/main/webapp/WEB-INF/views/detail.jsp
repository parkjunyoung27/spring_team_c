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
	background-color: #6FCC9870;
	font-weight: 700;
}
</style>

<script type="text/javascript">
function board_delete(no){
	var result = confirm("정말 삭제하시겠습니까?");
	if(result == true){
		location.href="./delete?board_no="+no;
	}
}
//alert("${detail.board_file}");
</script>

</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- board -->
	<div id="boardContainer">

		<!--서브메뉴바 -->
		<c:import url="./sub_board_menu.jsp" />

		<div id="content_title">
			<h2>${board_name }</h2>
		</div>
		<div id="bdetail_area">
			<div id="dtitle_area">
				<div id="dtitle">${detail.board_title}</div>

				<div id="dmember">${detail.member_name}</div>

				<div id="ddate">
					<jsp:useBean id="today" class="java.util.Date" />
					<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
					<fmt:formatDate var="write_date" value="${detail.board_date}" pattern="yyyyMMdd" />
					<c:choose>
						<c:when test="${write_date eq now}">
							<fmt:formatDate value="${detail.board_date}" pattern="HH:mm" />
						</c:when>
						<c:otherwise>
							<fmt:formatDate value="${detail.board_date}" pattern="yyyy.MM.dd" />
						</c:otherwise>
					</c:choose>
				</div>

			</div>

			<div id="dcontent">${detail.board_content }</div>

			<div id="dcontent">
				<c:if test="${detail.board_file ne null }">
				</c:if>
				<img alt="Can't_load_this_image" src="./resources/upfile/upload/${detail.board_file }">
			</div>

			<div id="detail_btn">
				<c:if test="${sessionScope.id eq detail.member_id}">
					<button onclick="location.href='./update.do?categoryNo=${param.categoryNo }&board_no=${detail.board_no }'">수정하기</button>
					<button onclick="return board_delete(${detail.board_no })">삭제하기</button>
				</c:if>
			</div>

			<!-- 댓글달기 -->
			<%@ include file="./component/comment.jsp"%>

		</div>
	</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>