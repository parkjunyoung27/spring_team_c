<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | 이용자 현황</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="../resources/css/adminPage.css" rel="stylesheet"> 
<link href="../resources/css/adminPage_menu.css" rel="stylesheet">
<style>
table{
width:180%;
}

.windowOpen:hover{color: gold;}
</style> 
<script type="text/javascript">
var pageNo = 1;
var channel = document.getElementById("channel").value;
var grade = document.getElementById("grade").value;
		
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
		var channel = document.getElementById("channel").value;
		var grade = document.getElementById("grade").value;
		return linkPage(pageNo, channel, grade);
	}
	
	function linkPage(pageNo, channel, grade){
		var channel = document.getElementById("channel").value;
		var grade = document.getElementById("grade").value;
		location.href="./adminMember.do?pageNo=" + pageNo + "&channel=" + channel + "&grade=" + grade;
	}

</script>


<body>
	<header>
		<%@ include file="./component/navbarm.jsp"%>	
	</header>

	<main>
		<%@ include file="./component/adminPage_menu.jsp"%>
		
		<div id="adminContainer">
			
			<h1 onclick="location.href='./adminMember.do'">이용자 리스트(${totalCount}명)</h1>
			
			<div class="adminContainerOne">
			
						<form action="./adminLog.do" method="post" id="memberNowOrder" name="memberNowOrder">
				<table>
					<tr>
						<th class="w3"> <input type="checkbox" name="checkall" onclick="selectAll(this)"> </th>
						<th class="w3">No</th>
						<th class="w7">아이디</th>
						<th class="w5">닉네임</th>
						<th class="w3">
							<select onchange="selectOption()" id="grade">
								<option value="" selected>등급 선택</option>
								
								<c:forEach items="${gradeList }" var="t">
									<c:if test="${grade eq t }">
										<option value="${t }"  selected>${t }</option>
									</c:if>
									<c:if test="${grade ne t }">
										<option value="${t }">${t }</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
						<th class="w3"> 
							<select onchange="selectOption()" id="channel">
							<option value="" selected> channel 선택 </option>
								<c:forEach items="${channelList }" var="i">
									<c:if test="${i eq channel }"> <!-- ip가 같으면 선택됨  -->
										<option value="${i }" selected>${i }</option>
									</c:if>
									<c:if test="${i ne channel }">
										<option value="${i }">${i }</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
						<th class="w5">상태</th>
						<th class="w5">생일</th>
						<th class="w5">회원가입일</th>
						<th class="w10">이메일</th>
						<th class="w7">전화번호</th>
					</tr> 
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<c:forEach items='${list }' var="l">
								<tr>
									<td class="w3">
										<input type="checkbox" name="check" value="${l.get('member_no')}"  onclick='checkSelectAll()' >
									</td> 
									<td class="w3">${l.get("member_no") } </td>
									<td class="w7">${l.get("member_id") } </td>
									<td class="w5">${l.get("member_name") } </td>
									<td class="w3">${l.get("member_grade") } </td>
									<td class="w3">${l.get("member_channel") } </td>
									<td class="w5">${l.get("member_status") } </td>
									<td class="w5">
									${fn:substring(l.get("member_birth"), 0, fn:length("l.get('member_birth')")-2 )}
									</td>
									<td class="w5">${fn:substring(l.get("member_since"), 0, fn:length("l.get('member_since')")-2 )} </td>
									<td class="w10">${l.get("member_email") } </td>
									<td class="w7">${l.get("member_phonenum") } </td>
								</tr>				
							</c:forEach>		
						</c:when>
						<c:otherwise>
							<tr id="adminLogNone">
								<td colspan="6">조건에 맞는 이용자가 없습니다... <td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</form>	
					
			</div>
			
			<div class="adminLogPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
				<button type="button" onclick="checkDelete(document.forms['memberNowOrder'])" class="adminDelBtn">삭제하기</button>		
			</div>	
		
		
		</div>
	
	</main>

	
</body>
</html>