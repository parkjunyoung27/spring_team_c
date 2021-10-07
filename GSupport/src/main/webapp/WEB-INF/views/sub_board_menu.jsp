<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
function bwrite(){
	if("${id}" == ""){
		var result = confirm("로그인하셔야 합니다. 로그인창으로 이동하시겠습니까?");
		if(result == true){
			location.href="./login.do";
		}
	}else{
			location.href="./write.do"
	}
}

</script>


<div id="sub_board_menu">
	<a href="/board"> 게시판 </a>
	<nav>
		<ul id="sub_list">
			<c:forEach items="${boardCategoryList}" var="bcl">
			<li id="menu_margin"><a href="./board?bcno=${bcl.bcno }">${bcl.category_name }</a></li>
			</c:forEach>
			<li id="bwrite"><a onclick="bwrite()">글쓰기</a><li>			
		</ul>		
	</nav>
</div>