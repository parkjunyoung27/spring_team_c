<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | 이용자 현황</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="../resources/css/adminPage.css" rel="stylesheet"> 
<link href="../resources/css/adminPage_menu.css" rel="stylesheet">
<style>

</style> 


<body>
	<header>
		<%@ include file="./component/navbarm.jsp"%>	
	</header>

	<main>
		<%@ include file="./component/adminPage_menu.jsp"%>
		
		<div id="adminContainer">
			
			<h1 onclick="location.href='./adminMember.do'">이용자 리스트</h1>
			
			<div class="adminContainerOne">
			
						<form action="./adminLog.do" method="post" id="LogOrder" name="LogOrder">
				<table>
					<tr>
						<th class="w5"> <input type="checkbox" name="checkall" onclick="selectAll(this)"> </th>
						<th class="w7"> No </th>
						<th class="w15"> 
							<select onchange="selectOption()" id="ip">
							<option value="" selected> ip 선택 </option>
								<c:forEach items="${ipList }" var="i">
									<c:if test="${i eq ip }"> <!-- ip가 같으면 선택됨  -->
										<option value="${i }" selected>${i }</option>
									</c:if>
									<c:if test="${i ne ip }">
										<option value="${i }">${i }</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
						<th class="w15">
							<select onchange="selectOption()" id="target">
								<option value="" selected>target 선택</option>
								
								<c:forEach items="${targetList }" var="t">
									<c:if test="${target eq t }">
										<option value="${t }"  selected>${t }</option>
									</c:if>
									<c:if test="${target ne t }">
										<option value="${t }">${t }</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
						<th class="w15">id</th>
						<th class="w15">날짜</th>
						<th class="w15">data</th>
					</tr> 
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<c:forEach items='${list }' var="l">
								<tr>
									<td class="w5">
										<input type="checkbox" name="check" value="${l.get('log_no')}"  onclick='checkSelectAll()' >
									</td> 
									<td class="w7">${l.get("log_no") } </td>
									<td class="w15">${l.get("log_ip") } </td>
									<td class="w15">${l.get("log_target") } </td>
									<td class="w15">
										<c:choose>
											<c:when test="${l.get('log_id') != null }">
											${l.get("log_id") }
											</c:when>
											<c:otherwise>
											null
											</c:otherwise>
										</c:choose>
									</td>		
									<td class="w15"> </td>
									<td class="w15"></td>
								</tr>				
							</c:forEach>		
						</c:when>
						<c:otherwise>
							<tr id="adminLogNone">
								<td colspan="6">로그 기록이 없습니다... <td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</form>	
				
				
			
			
			</div>
		
		
		</div>
	
	</main>

	
</body>
</html>