<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<!-- <link rel="stylesheet" type="text/css" href="style.css">
 -->
<style>
* {
	margin: 0;
	padding: 0;
}

.container2 {
	position: relative;
	width: 100%;
	height: 100vh;
	overflow: auto;
	scroll-snap-type: y mandatory;
}

.container2 .section1 {
	position: relative;
	width: 100%;
	height: 100vh;
	background-blend-mode: muliply;
	scroll-snap-align: start;
}

.container2 .section1:nth-child(1) {
	background:
		url("./resources/images/about.png");
	background-size: cover;
	background-attachment: fixed;
}

.container2 .section1:nth-child(2) {
	background: blue;
	background-size: cover;
	background-attachment: fixed;
}

.container2 .section1:nth-child(3) {
	background: yellow;
	background-size: cover;
	background-attachment: fixed;
}

.container2 .section1 .content1 {
	position: absolute;
	bottom: 50px;
	left: 50px;
	max-width: 700px;
}

.container2 .section1 .content1 h2 {
	background: green;
	color: white;
	font-weight: 600;
	display: inline-block;
	padding: 10px 20px;
	font-size: 2em;
}

.container2 .section1 .content1 p {
	background: green;
	color: white;
	font-weight: 600;
	padding: 10px 20px;
	margin-top: 10px;
}
</style>

<script>
	
</script>
</head>
<body>
	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>
	<div class="container2">
		<div class="section1">
			<div class="content1">
			</div>
		</div>
		
	</div>


</body>
</html>