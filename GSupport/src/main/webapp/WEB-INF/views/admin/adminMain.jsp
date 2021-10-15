<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | 대시 보드</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="../resources/css/adminPage.css" rel="stylesheet"> 
<link href="../resources/css/adminPage_menu.css" rel="stylesheet">
<style>
.adminContainerList:hover{box-shadow: 10px 10px 10px;}
.adminContainerList2:hover{box-shadow: 10px 10px 10px;}
</style> 
<!-- 왼쪽 사이드 메뉴 스크립트 -->

<body>
	<header>
		<%@ include file="./component/navbarm.jsp"%>	
	</header>

	<main>
		<%@ include file="./component/adminPage_menu.jsp"%>
		
		<div id="adminContainer">
			
			<h1>대시보드</h1>
			
			<div class="adminContainerList" onclick="location.href='./adminShopNow.do'">
				<div class="adminLogo">
						<img src="../resources/images/shop.png">
				</div>
				<div class="adminReport">
					<h3>가맹점 관리</h3>
					
					<ul>
						<li>총 가맹점 수 : </li>
						<li>총 예약 건수 : </li>
						<li>예약 많은 지역 : </li>
					</ul>
					
				</div>
			</div>
			<div class="adminContainerList" onclick="location.href='./adminMember.do'">
				<div class="adminLogo">
					<img src="../resources/images/user.png">
				</div>
				<div class="adminReport">
					<h3>이용자 관리</h3>
					
					<ul>
						<li>총 회원 수 : </li>
						<li>평균 예약 건수 : </li>
						<li>이번달 회원가입 : </li>
						<li>예약 적은 지역 : </li>
					</ul>
					
				</div>
			</div>
			<div class="adminContainerList" onclick="location.href='./adminBoard.do?boardNo=0'">
				<div class="adminLogo">
					<img src="../resources/images/board.png">
				</div>
				<div class="adminReport">
					<h3>게시판 관리</h3>
					
					<ul>
						<li>공지사항 게시글 : </li>
						<li>가맹점 게시글 : </li>
						<li>이용자 게시글 : </li>
						<li>가장 많이 쓴 회원 : </li>
					</ul>
					
				</div>
			</div>
			<div class="adminContainerList" onclick="location.href='./adminLog.do'">
				<div class="adminLogo">
					<img src="../resources/images/log.png">
				</div>
				<div class="adminReport">
					<h3>로그 관리</h3>
					
					<ul>
						<li>총 로그 기록 : </li>
						<li>오늘의 로그 기록 : </li>
						<li>접속 많은 시간 : </li>
					</ul>
					
				</div>
			</div>
			<div class="adminContainerList2" onclick="location.href='./adminAnalytics.do'">
				<div class="adminLogo2">
					<img src="../resources/images/analytics.png">
				</div>
				<div class="adminReport2">
					<h3>구글 통계</h3>
					<p>"호스팅 후 서비스 예정"</p>
				</div>
			</div>
			

		
		</div>
	
	</main>

	
</body>
</html>