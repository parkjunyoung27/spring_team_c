<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
	<script type="text/javascript">
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
		}
	</script>
	
    <!-- Navigation -->
    <div class="navbar">
	    <a href="./">
	    	<img src="./resources/images/logo2.png" alt="logo" class="logo"> 
    	</a>
    	<ul id="menu">
	       <li> <a href="" class="">About</a></li>
	       <li> <a href="./storeGuList.do" class="">가맹점 찾기</a></li>
	       <li> <a href="" class="">가맹점주</a></li>
		   <li><c:choose>
				<c:when test="${sessionScope.name ne null}">
					${sessionScope.name}님 ${sessionScope.authUser}&ensp;<a onclick="onLogoutClick();">로그아웃</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/login.do">로그인</a>
				</c:otherwise>
			</c:choose>
			</li>
    	</ul>
    </div>