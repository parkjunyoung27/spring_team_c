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
	    <a href="./">
	    	<img src="./resources/images/logo2.png" alt="logo" class="logo"> 
    	</a>
    	<ul id="menu">
	       <li class="menuli"> <a href="./about.do" class="">About</a></li>
	       <li class="menuli"> <a href="./storeGuList.do" class="">가맹점 찾기</a></li>
	       <li class="menuli"> <a href="./board.do" class="">게시판</a>
					<ul class="son">
						<li><a>공지사항</a></li>
						<li><a>가맹점주</a></li>
						<li><a>사용자</a></li>
					</ul>
	       </li>
		   <li class="menuli">
		   	    <c:choose>
					<c:when test="${sessionScope.name ne null}">
		      			 <a href="./message.do" class="">Q</a>
						${sessionScope.name}님 ${sessionScope.authUser}&ensp;<a onclick="onLogoutClick();">로그아웃</a>
						<ul class="son">
							<li><a href="./myPage.do">내 정보</a></li>
							<li><a>쪽지</a></li>
							<li><a>로그아웃</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<a href="${pageContext.request.contextPath}/login.do">로그인</a>
					</c:otherwise>
				</c:choose>
			</li>
    	</ul>
    </div>
    
    