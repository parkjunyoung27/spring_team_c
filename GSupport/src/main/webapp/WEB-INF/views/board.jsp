<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 게시판</title>
<script type="text/javascript">
function linkPage(pageNo){
	location.href="./board.do?pageNo=" + pageNo;
}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">
</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- board -->
	<div id="boardContainer">

		<!--서브메뉴바 -->
		<c:import url="./sub_board_menu.jsp" />
		<!-- 게시판 내용 -->
		<div id="content">

			<div id="content_title_border">
				<div id="content_title">
					<h2></h2><!-- 게시판 이름 연결 -->
					<!-- <h2> ${category } </h2> -->
				</div>
			</div>
			<ul class="board">
				<li class="fl tc w10 title t_line">번호</li>
				<li class="fl tc w50 title t_line">제목</li>
				<li class="fl tc w10 title t_line">글쓴이</li>
				<li class="fl tc w20 title">작성일</li>
			</ul>
			<ul class="board" onclick="location.href='./detail?board_no=${board_no}'">
				<c:forEach items="${list }" var="l">
					<li class="fl tc w10 list t_line lt_line">${l.board_no }</li>
					<li class="fl tc w50 list t_line lt_line">${l.board_title}[${l.board_count }]</li>
					<li class="fl tc w10 list t_line lt_line">
						<c:choose>
							<c:when test="${member_grade eq 3 }">관리자</c:when>
							<c:otherwise>${l.member_id}</c:otherwise>
						</c:choose>
					</li>
					<li class="fl tc w20 list lt_line">${l.board_date}</li>
				</c:forEach>
			</ul>
		</div>
		<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
	</div>
	

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>