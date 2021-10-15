<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
</head>
<body>


	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>


	<!-- Slide Show -->
	<!-- <section>
		<img class="mySlides" src="./resources/images/header.png" style="width: 100%">
		<img class="mySlides" src="./resources/images/seoul2.jpeg" style="width: 100%">
		<img class="mySlides" src="./resources/images/seoul3.jpeg" style="width: 100%">
	</section> -->


	<!-- main -->
	<div class="container">
		<div class="header-img"></div>
	</div>

	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>



	<script>
		// Automatic Slideshow - change image every 3 seconds
		var myIndex = 0;
		carousel();

		function carousel() {
			var i;
			var x = document.getElementsByClassName("mySlides");
			for (i = 0; i < x.length; i++) {
				x[i].style.display = "none";
			}
			myIndex++;
			if (myIndex > x.length) {
				myIndex = 1
			}
			x[myIndex - 1].style.display = "block";
			setTimeout(carousel, 3000);
		}
	</script>

</body>
</html>