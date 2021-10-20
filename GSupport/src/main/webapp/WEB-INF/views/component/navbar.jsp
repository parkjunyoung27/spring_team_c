<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
input#sidebar {
	diplay: none;
}

.sidebar1 {
	background-color: #f5f5f5;
	position: relative;
	z-index: 4;
}

.sidebar1>div {
	max-width: 0;
	margin: 0 auto;
	position: relative;
	min-height: 0;
}

.sidebar1 label.menu {
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translateY(-50%);
	width: 24px;
	height: 24px;
	background: url('./images/GSupport.png') 0 0 no-repeat;
	cursor: pointer;
}

.container1 {
	max-width: 1200px;
	margin: 0 auto;
}

.container1 img {
	max-width: 100%;
}

.sidebar_content {
	position: fixed;
	top: -500px;
	left: 50%;
	width: 50%;
	max-width: 500px;
	height: 500px;
	transform: translate(-50%);
	border-radius: 5px;
	background: #999;
	overflow: auto;
	transition: all .35s;
	z-index: 5;
}

.sidebar_content>ul {
	margin: 20px;
}

.sidebar_content>ul>li {
	border_bottom: 1px solid #ccc;
	list-style: none;
}

.sidebar_content>ul>li>a {
	display: inline-block;
	width: auto;
	color: #fff;
	padding: 10px;
	margin: 10px;
	background: #f5f5f5;
}

.sidebar_content label[for*='sidebar'] {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: -1;
}

.background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, .8);
	transition: all .35s;
	opacity: 0;
	visibility: hidden;
	z-index: 1;
}

#channel_icon {
	position: relative;
	width: 18px;
	height: 18px;
	bottom: -2px;
}

input#sidebar:checked ~ sidebar1 label {
	background-position: -24px 0;
}

input#sidebar:checked ~ .sidebar_content {
	top: 25%;
}

input#sidebar:checked ~ .background {
	opacity: 1;
	visibility: visible;
}

input[type="radio"] {
	display: none;
}
/* input[type="radio"] + label {display:inline-block;padding:20px;background:#ccc;color:#999;font-size:14px;cursor:pointer;} */
/* input[type="radio"] :checked + label {background:#aaa;color:#000;} */
.conbox {
	position: absolute;
	width: 100%;
	height: 100%;
	background: #aaa;
	margin: 0 auto;
	display: none;
}

input[id="tab01"]:checked ~ .con1 {
	display: block;
	transition: all .35s;
}

input[id="tab02"]:checked ~ .con2 {
	display: block;
	transition: all .35s;
}

input[id="tab03"]:checked ~ .con3 {
	display: block;
	transition: all .35s;
}
</style>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>
	function onLogoutClick() {
		location.href = '${pageContext.request.contextPath}/logout.do';
	}

	$(function() {
		$(".son").hide();
		$("#menu li").on("mouseover focusin", function() {
			$(this).children(".son").stop().slideDown(500);
		}).on("mouseout focusout", function() {
			$(this).children(".son").stop().slideUp(500);
		});
	});
	

	$(document).ready(function(){
		var joinChannel = sessionStorage.getItem("joinChannel");
		console.log(joinChannel);
		if(joinChannel == "google"){
			document.getElementById("tab04").click();
		}
	});

</script>

<!-- Navigation -->
<div class="navbar">
	<a href="./index.do"> <img src="./resources/images/logo.png"
		alt="logo" class="logo">
	</a>
	<ul id="menu">
		<li class="menuli"><a href="./about.do" class="">About</a></li>
		<li class="menuli"><a
			href="./storeList.do?guName=강남구&shop_wido=37.4979395100853&shop_kyungdo=127.02755368008152"
			class="">가맹점 찾기</a></li>
		<li class="menuli"><a href="./board.do?boardNo=0" class="">게시판</a>
			<ul class="son">
				<li><a href="./board.do?boardNo=0">공지사항</a></li>
				<li><a href="./board.do?boardNo=1">가맹점주</a></li>
				<li><a Href="./board.do?boardNo=2">문의사항</a></li>
			</ul></li>
		<li class="menuli"><c:choose>
				<c:when test="${sessionScope.name ne null}">
					<a>${sessionScope.name}님 <c:if test="${authUser eq 'kakao'}">
							<img id=channel_icon
								src="${pageContext.request.contextPath}/resources/images/kakao_channel.png">
						</c:if> <c:if test="${authUser eq 'naver'}">
							<img id=channel_icon
								src="${pageContext.request.contextPath}/resources/images/naver_channel.png">
						</c:if> <c:if test="${authUser eq 'google'}">
							<img id=channel_icon
								src="${pageContext.request.contextPath}/resources/images/google_channel.png">
						</c:if> <c:if test="${authUser eq 'web'}">
							<img id=channel_icon
								src="${pageContext.request.contextPath}/resources/images/web_channel.png">
						</c:if></a>

					<ul class="son">
						<li><a href="./myPage.do">내 정보</a></li>
						<li><a href="./message.do">쪽지</a></li>
						<li><a onclick="onLogoutClick();">로그아웃</a></li>
					</ul>

				</c:when>
				<c:otherwise>
					<a><label for="sidebar" class="menu">로그인</label></a>
				</c:otherwise>
			</c:choose></li>
	</ul>

	<input type="checkbox" id="sidebar" hidden="hidden">

	<div class="sidebar1">
		<label for="sidebar" class="menu"></label>
	</div>
	<div class="container1"></div>
	<div class="sidebar_content">


		<div class="tab_content">
			<input type="radio" name="tabmenu" id="tab01" checked>
			<label for="tab01"></label>
			<input type="radio" name="tabmenu" id="tab02">
			<label for="tab02"></label>
			<input type="radio" name="tabmenu" id="tab03">
			<label for="tab03"></label>
			<input type="radio" name="tabmenu" id="tab04">
			<label for="tab04"></label>
			<input type="radio" name="tabmenu" id="tab05">
			<label for="tab05"></label>

			<div class="conbox con1">
				<c:import url="/WEB-INF/views/login.jsp" />
			</div>
			<div class="conbox con2">
				<c:import url="/WEB-INF/views/join.jsp" />
			</div>
			<div class="conbox con3">
				<c:import url="/WEB-INF/views/member.jsp" />
			</div>
			<div class="conbox con4">
				<c:import url="/WEB-INF/views/oAuthJoin.jsp" />
			</div>
			<div class="conbox con5">
				<c:import url="/WEB-INF/views/member.jsp" />
			</div>
		</div>




	</div>
	<label for="sidebar" class="background"></label>

</div>

