<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 글쓰기</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/favicon.png">
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">

<script>
function writeCheck(){
	if(!confirm("글을 저장하시겠습니까?")) {
		return false;
	}
}	

</script>
<style>
#boardContainer{
margin-top:100px;
height: auto;
overflow: hidden;
}

#write_area{
margin-bottom:50px;
}

#write_submit_btn:hover{
	background-color:green;
	color:white;
	border:none;
	transition: 800ms ease all;
	
}

</style>

</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- board -->
	<div id="boardContainer">
		
		<div id="write_form">
			<div id="content_title"> 
				<h2> 글쓰기 </h2>
			</div>
			<div id="write_area">
				<form action="./write.do" method="post" enctype="multipart/form-data" onsubmit="return writeCheck();">
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
					
					<!-- 보드제목 -->
					<input type="text" id="board_title" name="board_title" placeholder="제목을 입력해주세요(40자 이내)">
					
					<!-- summernote -->
					<%@ include file="./component/summernote.jsp"%>	
					
					<!-- file -->
					<input type="file" name="file" accept=".gif, .png, .jpg, .jpeg">
					
					<button type="submit" id="write_submit_btn">글쓰기</button>
				
				</form>
			</div>
		</div>
		
	</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>