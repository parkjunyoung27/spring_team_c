<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 글쓰기</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">

<script>
function writeCheck(){
	var result = confirm("글을 저장하시겠습니까?");	
	return result;
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
				<h2> 글쓰기 </h2>
			</div>
			<div id="wrtie_area">
				<form action="./write.do" method="post" enctype="multipart/form-data">
					<select id="write_select" name="board_cate">
						<c:if test="${sessionScope.grade gt 6 }">
						<option value="1">자주하는질문</option>
						<option value="2">공지사항</option>
						</c:if>
						<option selected="selected" value="3" name="board_cate">사용자</option>
					</select>
					<input type="text" id="board_title" name="board_title" placeholder="제목을 입력해주세요(40자 이내)">
					<!-- summernote -->
					<%@ include file="./component/summernote.jsp"%>	
					<input type="file" name="file">
					<button type="submit" id="write_submit_btn">글쓰기</button>
				
				</form>
			</div>
		</div>
		
	</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>