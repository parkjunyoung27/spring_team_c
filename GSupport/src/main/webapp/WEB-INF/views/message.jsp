<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>messages</title>
<style type="text/css">
* {
	box-sizing: border-box;
}

body {
	background-color: white;
	font-family: Arial;
}

#container {
	width: 750px;
	height: 700px;
	background: #eff3f7;
	margin: 0 auto;
	font-size: 0;
	border-radius: 5px;
	overflow: hidden;
}

aside {
	width: 260px;
	height: auto;
	background-color: #7c7d7f;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

main {
	width: 490px;
	height: 400px;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
	background-color: #eff3f7;
}

aside header {
	padding: 30px 20px;
}

aside input {
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0 50px 0 20px;
	background-color: #5e616a;
	border: none;
	border-radius: 3px;
	color: #fff;
	background-image:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat: no-repeat;
	background-position: 170px;
	background-size: 40px;
}

aside input::placeholder {
	color: #fff;
}

aside ul {
	padding-left: 20px;
	margin: 0;
	list-style-type: none;
	height: 400px;
	overflow-y: scroll;
	border-bottom: 2px solid #fff;
	
}
::-webkit-scrollbar {
	width:10px;
	background-color:transparent;
}


aside li {
	padding: 10px 0;
}

aside li:hover {
	background-color: #5e616a;
}

h2, h3 {
	margin: 0;
}

aside li img {
	border-radius: 50%;
	margin-left: 20px;
	margin-right: 8px;
}

aside li div {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
}

aside li h2 {
	font-size: 14px;
	color: #fff;
	font-weight: normal;
	margin-bottom: 5px;
}

aside li h3 {
	font-size: 12px;
	color: #7e818a;
	font-weight: normal;
}

.status {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 7px;
}

.green {
	background-color: #58b666;
}

.orange {
	background-color: #ff725d;
}

.blue {
	background-color: #6fbced;
	margin-right: 0;
	margin-left: 7px;
}

main header {
	height: 110px;
	padding: 10px 20px 10px 40px;
}

main header>* {
	display: inline-block;
	vertical-align: middle;
}

main header img:first-child {
	width: 15%;
}

main header img:last-child {
	width: 40px;
	margin-top: 8px;
}

main header div {
	margin-left: 10px;
	margin-right: 140px;
}

main header h2 {
	font-size: 16px;
	margin-bottom: 5px;
}

main header h3 {
	font-size: 14px;
	font-weight: normal;
	color: #7e818a;
}

#chat {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 400px;
	border-top: 2px solid #fff;
	border-bottom: 2px solid #fff;
}

#chat li {
	padding: 10px 30px;
}

#chat h2, #chat h3 {
	display: inline-block;
	font-size: 13px;
	font-weight: normal;
}

#chat h3 {
	color: #bbb;
}

#chat .entete {
	margin-bottom: 5px;
}

#chat .message {
	padding: 20px;
	color: #fff;
	line-height: 25px;
	max-width: 90%;
	display: inline-block;
	text-align: left;
	border-radius: 5px;
}

#chat .me {
	text-align: right;
}

#chat .you .message {
	background-color: #58b666;
}

#chat .me .message {
	background-color: #6fbced;
}

#chat .triangle {
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}

#chat .you .triangle {
	border-color: transparent transparent #58b666 transparent;
	margin-left: 15px;
}

#chat .me .triangle {
	border-color: transparent transparent #6fbced transparent;
	margin-left: 375px;
}

.main send {
	height: 100px;
	padding: 20px 30px 10px 20px;
}

.main send sendID {
	resize: none;
	border: none;
	display: block;
	width: 100%;
	height: 80px;
	border-radius: 3px;
	padding: 20px;
	font-size: 13px;
	margin-bottom: 13px;
}

.main send sendID::placeholder {
	color: #ddd;
}

.main send img {
	height: 30px;
	cursor: pointer;
}

.main send a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: bold;
	color: #6fbced;
	vertical-align: top;
	margin-left: 333px;
	margin-top: 5px;
	display: inline-block;
}

.send_text {
	padding: 20px;
	color: black;
	line-height: 25px;
	display: inline-block;
	text-align: center;
	border-radius: 5px;
	height:100px;
	width:500px;
}

.send_id {
	margin-bottom: 10px;
	text-align: center;
	padding: 2px;
	color: black;
	line-height: 10px;
	width: auto;
	display: inline-block;
	border-radius: 5px;
}

#send {
	width: auto;
	height: auto;
	padding: 20px;
}
/* body {
	margin: 0;
	padding: 0;
}

#message {
	
}

#box {
	float: left;
	width: 50%;
	height: 500px;
	background-color: lime;
}

#box table {
	height: 100px;
	border-collapse: collapse;
}

td {
	border-bottom: 1px gray solid;
}

#view {
	float: left;
	width: 50%;
	height: 500px;
	background-color: aqua;
	width: 50%;
}

#send {
	width: 90%;
	background-color: gray
}

#send input {
	width: 100%;
	height: 30px;
}
 */
</style>
<script type="text/javascript">
	function delMsg(no) {
		if (confirm("삭제하시겠습니까?")) {
			alert("쪽지를 삭제합니다.");
			var form = document.createElement("form");
			form.setAttribute("action", "./delMsg.do");
			form.setAttribute("method", "post");
			var data = document.createElement("input");
			data.setAttribute("type", "hidden");
			data.setAttribute("name", "no");
			data.setAttribute("value", no);
			form.appendChild(data);
			document.body.appendChild(form);
			form.submit();
			return false;
		}
	}

	$(".person").on('click', function() {
		$(this).toggleClass('focus').siblings().removeClass('focus');
	})
</script>
</head>
<body>


	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<div class="container">
		<!-- Mypage menu -->
		<%@ include file="./myPage_menu.jsp"%>

		<!-- Mypage Content -->
		<div class="column middle">

			<div id="container">

				<aside>
					<header>
						<input type="text" placeholder="search">
					</header>
					<ul>
						<c:forEach items="${list }" var="q">
							<li
								onclick="location.href='./message.do?openmsg=${q.question_no }'"
								<c:if test="${q.question_read eq 0}">style="font-weight:bold"</c:if>
								<c:if test="${q.question_read eq 1}">style="color:gray;"</c:if>>
								<div>
									<h2>${q.member_name }(${q.member_id })</h2>
								</div>
						</c:forEach>

					</ul>
				</aside>
				<main>
					<c:choose>
						<c:when test="${detail ne null }">
							<header>
								<img
									src="http://localhost:8080/GSupport/resources/images/logo2.png"
									alt="">
								<div>
									<h2>
										<br>보낸 사람 <br>
										${detail.member_name}(${detail.question_sender})
									</h2>
								</div>
								<span onclick="return delMsg(${detail. question_no})"><img
									src="http://localhost:8080/GSupport/resources/images/trash.png"></span>
							</header>
							<ul id="chat">
								<li class="you">
									<div class="entete">
										<span class="status green"></span>
										<h2>${detail.member_id}</h2>
										<h3>${detail.question_date}</h3>
									</div>
									<div class="triangle"></div>
									<div class="message">${detail.question_content}</div>
								</li>
							</ul>

						</c:when>
					</c:choose>
				</main>
				<div id="send">
					<form action="./message.do" method="post">
						<input type="text" name="sendID" value="${sendmsg }" placeholder="아이디를 입력하세요." class="send_id"> <br> 
						<input type="text" name="content" placeholder="내용을 입력하세요." class="send_text">
						<button style="background-color:transparent;border:none;float:right;width:200px; padding:0px;"><img src="http://localhost:8080/GSupport/resources/images/send.png" alt="" style="width:150px;"></button>
						
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>