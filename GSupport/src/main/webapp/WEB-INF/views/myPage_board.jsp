<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 작성한 게시글</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/myPage.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
</head>
<style>
/* 게시판 목록 */
/* 공통옵션 */
ul li {
	list-style: none;
}

.fl {
	float: left;
}

.tc {
	text-align: center;
}

.board {
	width: 100%;
	padding: 0px;
}

.w10 {
	width: 10%;
}

.w15 {
	width: 15%;
}

.w20 {
	width: 20%;
}

.w50 {
	width: 50%;
}

.title1 {
	margin-top: 10px;
	height: 50px;
	line-height: 50px;
	background: white;
	font-weight: bold;
	border-bottom: 0.5px solid #c8c8c8;
	letter-spacing: 7px;
	font-size: medium;
}

.list {
	margin-top: 20px;
	height: 40px;
	background: white;
	border-bottom: 1px solid #ebebeb;
	letter-spacing: 1px;
}

#boardLine {
	font-size: 13px;
}
</style>
<body>

	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<div class="container">
		<!-- Mypage menu -->
		<%@ include file="./myPage_menu.jsp"%>
		<div class="column middle">
			<div class="customer-content">
				<div class="customer-content-section">
					<div class="customer-content-header">
						<h1>작성한 게시글</h1>
					</div>
				</div>
				<ul class="board">
					<li class="fl tc w15 title1 t_line">번호</li>
					<li class="fl tc w50 title1 t_line">제목</li>
					<li class="fl tc w15 title1 t_line">글쓴이</li>
					<li class="fl tc w20 title1">작성일</li>
				</ul>
				<ul id="boardLine">
					<c:forEach items="${board }" var="board">
						<li class="fl tc w15 list t_line lt_line">${board.board_no }</li>
					<li class="fl tc w50 list t_line lt_line" id="boardLineClick"
						onclick="location.href='./detail.do?categoryNo=${board.board_category }&board_no=${board.board_no}'">${board.board_title}[${board.board_count }]</li>
						<li class="fl tc w15 list t_line lt_line">
							${board.member_name}</li>
						<jsp:useBean id="today" class="java.util.Date" />
						<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
						<fmt:formatDate var="write_date" value="${board.board_date}"
							pattern="yyyyMMdd" />
						<li class="fl tc w20 list lt_line"><c:choose>
								<c:when test="${write_date eq now}">
									<fmt:formatDate value="${board.board_date}" pattern="HH:mm" />
								</c:when>
								<c:otherwise>
									<fmt:formatDate value="${board.board_date}"
										pattern="yyyy.MM.dd" />
								</c:otherwise>
							</c:choose></li>
					</c:forEach>
				</ul>
			</div>

		</div>
		<!-- 		board_name=공지사항, board_date=2021-10-22 00:45:44.0, board_no=151,
		member_grade=3, board_count=0}] 1
 -->
	</div>


	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>



</body>
</html>