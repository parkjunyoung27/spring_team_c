<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | 구글 통계</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="../resources/css/adminPage.css" rel="stylesheet"> 
<link href="../resources/css/adminPage_menu.css" rel="stylesheet">
<style>

.adminContainerOne{
	text-align: center;
    display: table-cell;
    vertical-align: middle;
    line-height: 500px;
}

</style> 


<body>
	<header>
		<%@ include file="./component/navbarm.jsp"%>	
	</header>

	<main>
		<%@ include file="./component/adminPage_menu.jsp"%>
		
		<div id="adminContainer">
			
			<h1>구글 통계</h1>
			
			<div class="adminContainerOne">
			
				"서비스 준비중입니다..."
				
			</div>
		
		
		</div>
	
	</main>

	
</body>
</html>