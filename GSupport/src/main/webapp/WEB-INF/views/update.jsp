<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 수정하기</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">

<script>
function writeCheck(){
	if(!confirm("수정하시겠습니까?")) {
		return false;
	}
}	
</script>
<style>

#write_submit_btn:hover{
	background-color:cadetblue;
	color:white;
}

</style>

</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- board -->
	<div id="boardContainer">

		<!--서브메뉴바 -->
		<c:import url="./sub_board_menu.jsp" />
		
		<div id="write_form">
			<div id="content_title">
				<h2> 수정하기 </h2>
			</div>
			<div id="wrtie_area">
				<form action="./update.do" method="post" enctype="multipart/form-data" onsubmit="return writeCheck()"  >
					<!-- 보드넘버 -->
					<input type="hidden" name="board_no" value="${update.board_no }">
					<!-- 보드 카테고리 -->
					<select id="write_select" name="board_cate">
					<c:if test="${param.categoryNo eq 2 }">
						<c:if test="${sessionScope.grade eq 3 }">
							<option value="0" >공지사항</option>
						</c:if>
						<c:if test="${sessionScope.grade ge 2 }">
							<option value="1" >점주게시판</option>
						</c:if>
							<option selected="selected" value="2" >문의사항</option>
					</c:if>
					<c:if test="${param.categoryNo eq 1 }">
						<c:if test="${sessionScope.grade eq 3 }">
							<option value="0" >공지사항</option>
						</c:if>
						<c:if test="${sessionScope.grade ge 2 }">
							<option selected="selected" value="1" >점주게시판</option>
						</c:if>
							<option value="2" >문의사항</option>
					</c:if>
					<c:if test="${param.categoryNo eq 0 }">
						<c:if test="${sessionScope.grade eq 3 }">
							<option selected="selected" value="0" >공지사항</option>
						</c:if>
						<c:if test="${sessionScope.grade ge 2 }">
							<option value="1">점주게시판</option>
						</c:if>
							<option value="2">문의사항</option>
					</c:if>
					</select>
					<input type="text" id="board_title" name="board_title" value="${update.board_title }">
					<!-- summernote -->
					<%@ include file="./component/summernote.jsp"%>

					<!-- file update -->
					
					<button id="write_submit_btn">수정하기</button>
				
				</form>
			</div>
		</div>
		
	</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>