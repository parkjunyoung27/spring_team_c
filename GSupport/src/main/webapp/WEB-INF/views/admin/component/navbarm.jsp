<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>	

	<script>
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
		}
	
	$(function(){
		$(".son").hide();
		   $("#menu li").on("mouseover focusin",function(){
		      $(this).children(".son").stop().slideDown(500);
		   }).on("mouseout focusout",function(){
		      $(this).children(".son").stop().slideUp(500);
		   });
	});
	
	</script>
	
    <!-- Navigation -->
    <div class="navbar">
	    <a href="./access.do">
	    	G원사격 - 관리페이지
    	</a>
    	<ul id="menu">
	       <li class="menuli"> <a href="#" class="">가맹점 관리</a></li>
	       <li class="menuli"> <a href="#" class="">회원 관리</a></li>
	       <li class="menuli"> <a href="#" class="">게시판 관리</a>
				<ul class="son">
					<li><a href="./board.do?boardNo=0">공지사항</a></li>
					<li><a href="./board.do?boardNo=1">가맹점주</a></li>
					<li><a Href="./board.do?boardNo=2">문의사항</a></li>
				</ul>
	       </li>
		   <li class="menuli">
		   	    <c:choose>
					<c:when test="${sessionScope.id ne null}">
						<a onclick="onLogoutClick();">로그아웃</a>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/admin/access.do">로그인</a>
					</c:otherwise>
				</c:choose>
			</li>
    	</ul>
    </div>
    
    