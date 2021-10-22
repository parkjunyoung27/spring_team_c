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

.head {
	height: 100px;
	padding: 10px 20px 10px 20px;
	background-color: white;
}

#message_container {
	width: 750px;
	height: 700px;
	background: white;
	margin: 0 auto;
	font-size: 0;
	outline: 1px solid grey;
	border-radius: 10px;
	overflow: hidden;
}

aside {
	width: 40%;
	height: auto;
	background-color: #2e4f90;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
}

main {
	width: 60%;
	height: 400px;
	display: inline-block;
	font-size: 15px;
	vertical-align: top;
	background-color: white;
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
	padding: 20px;
	margin: 0;
	list-style-type: none;
	height: 400px;
	overflow-y: scroll;
	border-bottom: 2px solid #fff;
}

::-webkit-scrollbar {
	width: 10px;
	background-color: transparent;
}

aside li {
	padding: 10px 0;
}

aside li:hover {
	background-color: #ffffff3d;
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
	margin-left: 350px;
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
	white-space: normal;
	padding: 10px;
	color: black;
	line-height: 15px;
	display: inline-block;
	text-align: left;
	border-radius: 5px;
	height: 100px;
	width: 500px;
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
	white-space: normal;
	width: auto;
	height: auto;
	padding: 20px;
	background: white;
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
				<div id="message_container">

					<div class="head">
						<div>
							<img
								src="http://localhost:8080/GSupport/resources/images/logo2.png"
								alt="" style="height: 80px; float: left; padding: 10px;">
							<div
								style="font-size: 20px; transform: translateY(30px); float: left; width: 600px;">
											
							</div>
						</div>
					</div>

					<aside>
						<ul>
							<c:forEach items="${list }" var="q">
								<li
									onclick="location.href='./message.do?openmsg=${q.question_sender }&sendId=${q.member_id} '"
									<c:if test="${q.question_read eq 0}">style="font-weight:bold" NEW</c:if>
									<c:if test="${q.question_read eq 1}">style="color:gray;"</c:if>>
									<div>
										<h2 id="getSender" onclick="selectSender('${q.member_id }')">${q.member_name }(${q.member_id })</h2>
									</div>
							</c:forEach>

						</ul>
					</aside>
					<main>
					<ul id="chat">
					<c:forEach items="${detailList }" var="dl">
						<c:choose>
							<c:when test="${sessionScope.member_no eq dl.question_recipient }">
									<li class="you">
										<div class="entete">
											<span class="status green"></span>
											<h2>${sessionScope.member_id}</h2>
											<h3>${dl.question_date}</h3>
										</div>
										<div class="triangle"></div> 
											<div id="receivedMessage" class="message">
												${dl.question_content }</div>
											<br>

									</li>
							</c:when>
							<c:otherwise>
									<li class="me">
										<div class="entete">
											<span class="status green"></span>
										<h3>${dl.question_date}</h3>
										</div>
										<div class="triangle"></div> 
											<div id="sentMessage" class="message">
												${dl.question_content }</div>
											<br>
									</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</ul>
					</main>
					<div id="send">
						<form action="./message.do" method="post">
							<input type="text" id="sendID" name="sendID" class="send_id" value="${sendId}">
							 <br> <input
								type="text" name="content" placeholder="내용을 입력하세요."
								class="send_text">
							<button
								style="background-color: transparent; border: none; float: right; width: 200px; padding: 0px;">
								<img
									src="http://localhost:8080/GSupport/resources/images/send.png"
									alt="" style="width: 150px;">
							</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>