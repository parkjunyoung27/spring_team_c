<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 상세보기</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">

<style type="text/css">

#detail_btn button:hover{
background-color: #6FCC9870;
font-weight:700;
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
			<h2> ${board_name } </h2>
		</div>		
		<div id="bdetail_area">
			<div id = "dtitle_area">
				<div id="dtitle">
					${detail.board_title }
				</div>
		
				<div id="dmember">
					관리자
				</div>	
								
				<div id = "ddate">
					조회&ensp;:&ensp;1 &emsp;2021-10-07
				</div>			
						
			</div>
			
			<div id="dcontent">
				${detail.board_content }
			</div>
			
			<div id="dcontent">
				<c:if test="${detail.board_file ne null }">
				</c:if>
				<img alt="왜"  src="./resources/upfile/upload/${detail.board_file }">
			</div>
			
			<div id="detail_btn">
				<button onclick="location.href='./update.do'">수정하기</button>
				<c:if test="${sessionScope.id eq boardDTO.member_id}"> <button onclick="return board_delete(${boardDTO.board_no})">삭제하기</button> </c:if>
			</div>
		
			<!-- 댓글달기 -->
			<%@ include file="./component/comment.jsp"%>
		
		</div>
	</div>
	
	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
	
</body>
</html>