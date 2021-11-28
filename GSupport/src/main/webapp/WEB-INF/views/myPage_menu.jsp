<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="./resources/css/myPage.css" rel="stylesheet">

<div class="column side">
	<div class="account_profile">
		<div class="title">
			<h2>마이페이지<br></h2>
			<span class="name"><br>안녕하세요, <br> <strong>${sessionScope.name}</strong> 님
				</span>
		</div>
	</div>
	<div class="customer_side">
		<h3 class="customer_side_title">예약 관리</h3>
		<ul class="customer_side_list">
		<li><a href="myPage_reserv.do" class="a1">사용자 예약 </a></li>
		<c:if test="${sessionScope.grade ne 1 && sessionScope.shop_no ne null}">
			<li><a href="myPage_reservCheck.do?shop_no=${sessionScope.shop_no}" class="a2">가맹점 예약 </a></li>
		</c:if>
		</ul>
	</div>


	<div class="customer_side">
		<h3 class="customer_side_title">활동</h3>
		<ul class="customer_side_list">
			<li><a href="message.do" class="a3">쪽지함 </a></li>
			<li><a href="./myPage_board.do" class="a4">작성한 게시글 </a></li>
		</ul>
	</div>

	<div class="customer_side">
		<h3 class="customer_side_title">즐겨찾기</h3>
		<ul class="customer_side_list">
			<li><a href="myPage_bookmark.do" class="a5">즐겨찾기 목록</a></li>
		</ul>

		<div class="customer_side">
			<h3 class="customer_side_title">나의 정보</h3>
			<ul class="customer_side_list">
				<li><a href="./myPage_update.do" class="a6">회원정보 수정 </a></li>
				<c:choose>
				<c:when test="${sessionScope.grade ne 2}">
					<li><a href="./myPage_registStore.do" class="a7">가맹점 등록 </a></li>
				</c:when>
				<c:when test="${sessionScope.grade ne 1}">
					<li><a href="./myPage_updateOwner.do" class="a8">가맹점 수정 </a></li>
				</c:when>
				</c:choose>	
				<li><a href="./myPage_updatePW.do" class="a9">비밀번호 변경 </a></li>
				<li><a href="./myPage_delete.do" class="a10">회원 탈퇴 </a></li>
			</ul>
		</div>

	</div>
</div>
