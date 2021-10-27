<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 게시판</title>
<script type="text/javascript">
function linkPage(pageNo){
	<c:if test="${searchName != null}">
		var search = "&searchName=${searchName}&search=${search}";
		location.href="./board.do?pageNo=" + pageNo + "&categoryNo=" + ${categoryNo} + search;
	</c:if>
	<c:if test="${searchName == null}">
		location.href="./board.do?pageNo=" + pageNo + "&categoryNo=" + ${categoryNo};
	</c:if>
	
}
</script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<style>
#boardPaging {
	text-align: center;
	margin-top: 30px;
	text-decoration: none;
	font-size: large;
	letter-spacing: 1px;
}

#boardPaging a {
	text-decoration: none;
	color: black;
}

#boardPaging a:hover {
	font-weight: 700;
	color: green;
}

#boardLine {
	width: 100%;
	padding: 0px;
	cursor: pointer;
	min-height: 700px;
}

#boardLineClick:hover {
	font-weight: 700;
	color: green;
}
</style>

</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- board -->
	<div class="container">
		<!--서브메뉴바 -->
		<c:import url="./sub_board_menu.jsp" />
		<!-- 게시판 내용 -->
		<div id="content">
<%-- 			<div id="content_title_border">
				<c:if test="${board_name eq board_name }">
					<a href="/GSupport/board.do?categoryNo=${categoryNo}">
						${board_name} </a>
				</c:if>

			</div> --%>
			<ul class="board">
				<li class="fl tc w15 title t_line">번호</li>
				<li class="fl tc w50 title t_line">제목</li>
				<li class="fl tc w15 title t_line">글쓴이</li>
				<li class="fl tc w20 title">작성일</li>
			</ul>
			<ul id="boardLine">
				<c:forEach items="${list }" var="l">
					<li class="fl tc w15 list t_line lt_line">${l.board_no }</li>
					<li class="fl tc w50 list t_line lt_line" id="boardLineClick"
						onclick="location.href='./detail.do?categoryNo=${l.board_category }&board_no=${l.board_no}'">${l.board_title}<c:if test="${categoryNo ne 0 }">[${l.commentTotalCount }]</c:if></li>
					<li class="fl tc w15 list t_line lt_line"><c:choose>
							<c:when test="${member_grade eq 3 }">관리자</c:when>
							<c:otherwise>${l.member_name}</c:otherwise>
						</c:choose></li>
					<jsp:useBean id="today" class="java.util.Date" />
					<fmt:formatDate var="now" value="${today}" pattern="yyyyMMdd" />
					<fmt:formatDate var="write_date" value="${l.board_date}"
						pattern="yyyyMMdd" />
					<li class="fl tc w20 list lt_line"><c:choose>
							<c:when test="${write_date eq now}">
								<fmt:formatDate value="${l.board_date}" pattern="HH:mm" />
							</c:when>
							<c:otherwise>
								<fmt:formatDate value="${l.board_date}" pattern="yyyy.MM.dd" />
							</c:otherwise>
						</c:choose></li>
				</c:forEach>
			</ul>

			<!-- 글쓰기 -->
			<c:if test="${sessionScope.grade eq 3 && categoryNo eq 0  }">
				<a href="./write.do?categoryNo=${categoryNo }">글쓰기</a>
			</c:if>
			<c:if test="${sessionScope.grade gt 1 && categoryNo eq 1 }">
				<a href="./write.do?categoryNo=${categoryNo }">글쓰기</a>
			</c:if>
			<c:if test="${sessionScope.grade ne null && categoryNo eq 2 }">
				<a href="./write.do?categoryNo=${categoryNo }">글쓰기</a>
			</c:if>
			
			
			<!-- 페이징 -->
			<div id="boardPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text"
					jsFunction="linkPage" />
			</div>

			<!-- 검색 -->
			<div class="searchBox">
				<form action="./board.do">
					<select name="searchName" class="Cate_search">
						<option value="title"
							<c:if test="${searchName eq 'title' }">selected="selected"</c:if>>
							제목</option>
						<option value="content"
							<c:if test="${searchName eq 'content' }">selected="selected"</c:if>>
							내용</option>
						<option value="writer"
							<c:if test="${searchName eq 'writer' }">selected="selected"</c:if>>
							글쓴이</option>
					</select> <input type="text" name="search" value="${search}"
						class="Cate_searchbox" placeholder="내용을 입력해주세요."> <input
						type="hidden" name="categoryNo" value="${categoryNo }">
					<button type="submit" style="border: none; background: none;">
						<img
							src="http://localhost:8080/GSupport/resources/images/search.png"
							style="height: 45px; margin-left: 5px; vertical-align: middle;">
					</button>
				</form>
			</div>
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
	
</body>
</html>