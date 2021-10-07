<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>G원사격 | 상세보기</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/board.css" rel="stylesheet">
</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- board -->
	<div id="boardContainer">

		<!--서브메뉴바 -->
		<c:import url="./sub_board_menu.jsp" />


	</div>
	
	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
	
</body>
</html>