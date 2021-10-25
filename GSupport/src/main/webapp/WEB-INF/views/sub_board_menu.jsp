<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

#sub_board_menu a:hover {
	color: black;
	font-weight: bold;
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
		<li><a href="./board.do?categoryNo=0">공지사항</a></li>
		<li><a href="./board.do?categoryNo=2">문의사항</a></li>
		<li><c:if test="${sessionScope.grade ne 1 }">
				<a href="/GSupport/board.do?categoryNo=${categoryNo}"> 가맹점 게시판</a>
			</c:if>
		</li>
	</ul>
</div>