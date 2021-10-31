<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About</title>
<!-- <link rel="stylesheet" type="text/css" href="style.css">
 -->
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
<link href="./resources/css/index.css" rel="stylesheet">
<style>
body {
}
*,
:after,
:before {
  box-sizing: border-box;
  margin: 0;
  padding: 0;
}

section {
  height: 100vh;
  width: 100%;
  display: table;
  	background:
		url("${pageContext.request.contextPath}/resources/images/about3.png");
  background-size:cover;
}

section.ok{
	  	background:
		url("${pageContext.request.contextPath}/resources/images/about2.png");
	background-size: cover;
	background-attachment: fixed;
}

p{
  color: white;
  font-family: arial;
  display: table-cell;
  text-align: center;
  vertical-align: middle;
}

.scroll-down {
  opacity: 1;
  -webkit-transition: all .5s ease-in 3s;
  transition: all .5s ease-in 3s;
}

.scroll-down {
  position: absolute;
  bottom: 30px;
  left: 50%;
  margin-left: -16px;
  display: block;
  width: 32px;
  height: 32px;
  border: 2px solid #FFF;
  background-size: 14px auto;
  border-radius: 50%;
  z-index: 2;
  -webkit-animation: bounce 2s infinite 2s;
  animation: bounce 2s infinite 2s;
  -webkit-transition: all .2s ease-in;
  transition: all .2s ease-in;
  transform: scale(1)
}

.scroll-down:before {
    position: absolute;
    top: calc(50% - 8px);
    left: calc(50% - 6px);
    transform: rotate(-45deg);
    display: block;
    width: 12px;
    height: 12px;
    content: "";
    border: 2px solid white;
    border-width: 0px 0 2px 2px;
}

@keyframes bounce {
  0%,
  100%,
  20%,
  50%,
  80% {
    -webkit-transform: translateY(0);
    -ms-transform: translateY(0);
    transform: translateY(0);
  }
  40% {
    -webkit-transform: translateY(-10px);
    -ms-transform: translateY(-10px);
    transform: translateY(-10px);
  }
  60% {
    -webkit-transform: translateY(-5px);
    -ms-transform: translateY(-5px);
    transform: translateY(-5px);
  }
}

::-webkit-scrollbar{
    width: 10px;
    background-color: transparent;
}


/* 
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
	background:black;
	background-size: cover;
	background-attachment: fixed;
}

.container2 .section1:nth-child(2) {
	background:url("http://localhost:8080/GSupport/resources/images/about2.png");
	background-size: cover;
	background-attachment: fixed;
}

.container2 .section1:nth-child(3) {
	background:blue;
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
} */


</style>

<script>
	
</script>
</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>
	
<section>
<!-- <p>SCROLL DOWN CSS</p> -->
<a href="#" class="scroll-down" address="true"></a>
</section>
<section class="ok">
<!-- <p>OK SCROLL !</p> -->
</section>

<!-- 	<div class="container2">
		<div class="section1">
			<div class="content1">
				<h2>가맹점 등록을 원하시나요?</h2>
				<p>1. 회원가입을 한다
				2. 닉네임을 가맹정명으로 설정한다.
				3. 가맹점 정보를 등록한다.
				4. 관리자의 승인 후 사용이 가능!
				</p>
			</div>
		</div>
		<div class="section1">
			<div class="content1">
			</div>
		</div>
		<div class="section1">
			<div class="content1">
			</div>
		</div>
	</div>
 -->
  <script type="text/javascript">
 $(function() {
	    $('.scroll-down').click (function() {
	      $('html, body').animate({scrollTop: $('section.ok').offset().top }, 'slow');
	      return false;
	    });
	  });
 </script>
 

</body>
</html>