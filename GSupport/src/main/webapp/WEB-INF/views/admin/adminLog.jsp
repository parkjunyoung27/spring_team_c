<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | 로그 관리</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="../resources/css/adminPage.css" rel="stylesheet"> 
<link href="../resources/css/adminPage_menu.css" rel="stylesheet">
<style>

</style> 
<script type="text/javascript">
var pageNo = 1;
var ip = document.getElementById("ip").value;
var target = document.getElementById("target").value;
		
	function checkSelectAll()  {
		  // 전체 체크박스
		  const checkboxes //전체 갯수 선택했을때 갯수 세기 
		    = document.querySelectorAll('input[name="check"]');
		  // 선택된 체크박스
		  const checked // 체크된 갯수 세기
		    = document.querySelectorAll('input[name="check"]:checked');
		  // select all 체크박스
		  const selectAll 
		    = document.querySelector('input[name="checkall"]');
		  
		  if(checkboxes.length === checked.length)  { //전체선택했을 때
		    selectAll.checked = true;
		  }else {
		    selectAll.checked = false;
		  }
		}
	
	function selectAll(selectAll)  { // 전체체크 선택시
	  const checkboxes  //check의 element를 모두 찾아서 노드리스트형태로 리턴, 20개의 체크박스 엘리먼트가 리턴
	     = document.getElementsByName('check');
	  
	//이 목록을 반복하여 cehcked값을  전체선택의 check값과 동일하게 변경
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	
	
	function checkDelete(form){
		
		var sum = 0;
		var count = form.check.length; //form.name값.길이
		for(var i =0; i<count; i++){
			if(form.check[i].checked == true){ //checkbox 체크되어있는지 확인
				sum += 1;
			}
		}
		
		if(sum > 0){
			var test= confirm(sum+"개 삭제하시겠습니까?");
			if(test == true){
				form.submit();
				alert("삭제됐습니다.");
			}else{
				alert("취소됐습니다.");
			}
		}else{
			return false;
		}		

	}
	
	function selectOption(){
		var ip = document.getElementById("ip").value;
		var target = document.getElementById("target").value;
		return linkPage(pageNo, ip, target);
	}
	
	function linkPage(pageNo, ip, target){
		var ip = document.getElementById("ip").value;
		var target = document.getElementById("target").value;
		location.href="./adminLog.do?pageNo=" + pageNo + "&ip=" + ip + "&target=" + target;
	}

</script>

<body>
	<header>
		<%@ include file="./component/navbarm.jsp"%>	
	</header>

	<main>
		<%@ include file="./component/adminPage_menu.jsp"%>
		
		<div id="adminContainer">
			
			<h1 onclick="location.href='./adminLog.do'">로그 관리(${totalCount}건)</h1>
			
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
									<td class="w15">${l.get("log_date") } </td>
									<td class="w15">${fn:substring(l.get("log_data"), 0, 15 )}...</td>
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
			
			<div class="adminLogPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
				<button type="button" onclick="checkDelete(document.forms['LogOrder'])">삭제하기</button>		
			</div>	
		
		</div>
	
	</main>

	
</body>
</html>