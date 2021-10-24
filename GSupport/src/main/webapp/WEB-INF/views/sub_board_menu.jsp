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
			location.href="./write.do?categoryNo=${categoryNo}";
	}
}

</script>


<div id="sub_board_menu">
	<c:if test="${board_name eq board_name }"><a href="/GSupport/board.do?categoryNo=${categoryNo}"> ${board_name} </a></c:if>
	<c:if test="${detail.board_name eq detail.board_name }"><a href="/GSupport/board.do?categoryNo=${param.categoryNo }"> ${detail.board_name} </a></c:if>
	<nav>
		<ul id="sub_list">
			<li id="bwrite"><a onclick="javascript:bwrite();" >글쓰기</a></li>			
		</ul>		
	</nav>
</div>