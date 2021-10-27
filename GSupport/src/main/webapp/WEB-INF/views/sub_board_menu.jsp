<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

#sub_board_menu a:hover {
	color: black;
	font-weight: bold;
}
.sub_board_menu_button{
	font-size:15px;
	color:grey;
	border:none;
	background:white;
	cursor:point;
}

</style>
<script type="text/javascript">
	function bwrite() {
		if ("${id}" == "") {
			var result = confirm("로그인하셔야 합니다. 로그인창으로 이동하시겠습니까?");
			if (result == true) {
				location.href = "./login.do";
			}
		} else {
			location.href = "./write.do?categoryNo=${categoryNo}";
		}
	}
</script>


<div id="sub_board_menu">
	<div id="board_content" style="margin-bottom:20px;">
		<h2>게시판</h2>
	</div>
	<ul style="line-height: 40px;">
		<li>
		<button type="submit" class="sub_board_menu_button" onclick="location.href='./board.do?categoryNo=0'" 
		<c:if test="${param.categoryNo eq 0 }">style="color:black; font-weight:800;"</c:if>>
		공지사항
		</button>
		</li>
		
		<li>
		<button type="submit" class="sub_board_menu_button" onclick="location.href='./board.do?categoryNo=2'" 
		<c:if test="${param.categoryNo eq 2 }">style="color:black; font-weight:800;"</c:if>>
		문의사항
		</button>
		</li>
		<c:if test="${sessionScope.grade gt 1 }">
			<li>
			<button type="submit" class="sub_board_menu_button" onclick="location.href='./board.do?categoryNo=1'" 
			<c:if test="${param.categoryNo eq 1 }">style="color:black; font-weight:800;"</c:if>>
			점주 게시판 
			</button>
<!--	
		<li><a href="./board.do?categoryNo=0">공지사항</a></li>
		<li><a href="./board.do?categoryNo=2">문의사항</a></li>
		<li><c:if test="${sessionScope.grade gt 1 }">
				<a href="/GSupport/board.do?categoryNo=${categoryNo}"> 점주게시판</a>
			</c:if>
 -->
		</li>
		</c:if>
	</ul>
</div>