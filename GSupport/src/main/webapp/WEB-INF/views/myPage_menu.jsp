<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="./resources/css/myPage.css" rel="stylesheet">

	<div class="column side">
		<div class="account_profile">
			<div class="title">
				<h1>
					마이페이지<br>
				</h1>
				<span class="name"><strong>${sessionScope.name}</strong> 님
					안녕하세요</span>
			</div>
		</div>
		<div class="customer_side">
			<h1 class="customer_side_title">나의 정보</h1>
			<ul class="customer_side_list">
				<li><a href="./myPage_update.do">회원정보 수정 </a></li>
				<li><a href="./myPage_updatePW.do">비밀번호 변경 </a></li>
				<li><a href="./myPage_delete.do">회원 탈퇴 </a></li>
			</ul>
		</div>

		<div class="customer_side">
			<h1 class="customer_side_title">예약 관리</h1>
			<ul class="customer_side_list">
				<li><a href="myPage_reserv.do">사용자 예약 확인하기 </a></li>
				<li><a href="myPage_reserv2.do">업주 예약 확인하기 </a></li>
			</ul>
		</div>

		<div class="customer_side">
			<h1 class="customer_side_title">활동</h1>
			<ul class="customer_side_list">
				<li><a href="">쪽지함 </a></li>
				<li><a href="">쪽지 보내기 </a></li>
			</ul>
		</div>

		<div class="customer_side">
			<h1 class="customer_side_title">즐겨찾기</h1>
			<ul class="customer_side_list">
				<li><a href="myPage_bookmark.do">즐겨찾기 관리 </a></li>
			</ul>
		</div>
	</div>
