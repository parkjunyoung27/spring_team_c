<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | 가맹점 예약관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<link href="../resources/css/adminPage.css" rel="stylesheet"> 
<link href="../resources/css/adminPage_menu.css" rel="stylesheet">
<style>
table{
	width:200%;
}

.widoInput{
	text-align: center;
}
.kyungdoInput{
	text-align: center;
}
</style> 
<script type="text/javascript">
var pageNo = 1;
var gu = document.getElementById("gu").value;
		
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
		var count=1;
		
		if(form.check.length >=2){
			alert("길이 오케이");
			count = form.check.length;
			for(var i = 0; i<count; i++){
				if(form.check[i].checked == true){ //checkbox 체크되어있는지 확인
					sum += 1;
					if(document.querySelectorAll('.widoInput')[i].value == "" || document.querySelectorAll('.kyungdoInput')[i].value == "" ){
						alert("위도, 경도 모두 입력하세요.");
						return false;
					}
				}
			}
		}else{
			sum =1;
			//alert(document.getElementsByClassName("widoInput")[0].value);
			
			if(document.getElementsByClassName("widoInput")[0].value == "" || document.getElementsByClassName("kyungdoInput")[0].value == "" ){
				alert("위도, 경도 모두 입력하세요.");
				return false;
			}		
		}; //form.name값.길이
		
		
		
		if(sum > 0){
			var test= confirm(sum+"개 승인하시겠습니까?");
			if(test == true){
				form.submit();
				alert("승인되었습니다.");
			}else{
				alert("취소됐습니다.");
			}
		}else{
			return false;
		}
		

	}
	
	function selectOption(){
		var gu = document.getElementById("gu").value;
		return linkPage(pageNo, gu);
	}
	
	function linkPage(pageNo, ip, target){
		var gu = document.getElementById("gu").value;
		location.href="./adminShopAllow.do?pageNo=" + pageNo + "&gu=" + gu;
	}			
	
	
	
</script>

<body>
	<header>
		<%@ include file="./component/navbarm.jsp"%>	
	</header>

	<main>
		<%@ include file="./component/adminPage_menu.jsp"%>
		
		<div id="adminContainer">
			
			<h1>가맹점 승인대기</h1>
			
			<div class="adminContainerOne">
			
			<form action="./adminShopAllow.do" method="post" id="ShopNowOrder" name="ShopNowOrder">
				<table>
					<tr>
						<th class="w1"> <input type="checkbox" name="checkall" onclick="selectAll(this)"> </th>
						<th class="w1"> No </th>
						<th class="w7"> 상호명 </th>
						<th class="w5"> 위도 </th>
						<th class="w5"> 경도 </th>
						<th class="w3"> 
							<select onchange="selectOption()" id="gu">
							<option value="" selected> 지역구 선택 </option>
								<c:forEach items="${guList }" var="i">
									<c:if test="${i eq gu }"> <!-- gu가 같으면 선택됨  -->
										<option value="${i }" selected>${i }</option>
									</c:if>
									<c:if test="${i ne gu }">
										<option value="${i }">${i }</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
						<th class="w10"> 위치 </th>
						<th class="w5"> 전화번호 </th>
						<th class="w3"> 오픈시간 </th>
						<th class="w3"> 마감시간 </th>
						<th class="w10"> 내용 </th>
					</tr> 
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<c:forEach items='${list }' var="l">
								<tr>
									<td class="w1">
										<input type="checkbox" name="check" value="${l.get('shop_no')}"  onclick='checkSelectAll()' >
									</td> 
									<td class="w1" id="shopNo">${l.get("shop_no") } </td>
									<td class="w7">${l.get("shop_name") } </td>
									<td class="widoWrite w5" style="cursor:pointer;">
										<input class="widoInput" placeholder="위도를 입력해주세요." name="wido" value="${l.get('shop_wido') }">
									</td>	
									<td class="kyungdoWrite w5" style="cursor:pointer;">
										<input class="kyungdoInput" placeholder="경도를 입력해주세요." name="kyungdo" value="${l.get('shop_kyungdo') }">
									</td>											
									<td class="w3">${l.get("shop_gu") } </td>
									<td class="w10">${l.get("shop_loc") }</td>	
									<td class="w5">${l.get("shop_tel") }</td>	
									<td class="w3">${l.get("shop_opentime") }</td>	
									<td class="w3">${l.get("shop_closetime") }</td>	
									<td class="w10">
										<c:choose>
											<c:when test="${l.get('shop_notice') ne null}">
											${fn:substring(l.get("shop_notice"), 0, 15 )}
											</c:when>
											<c:otherwise>
											NULL
											</c:otherwise>
										</c:choose>
									</td>
								</tr>				
							</c:forEach>		
						</c:when>
						<c:otherwise>
							<tr id="adminNone">
								<td colspan="11">승인대기 가맹점이 없습니다... <td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</form>	
			
			</div>
		
			<div class="adminLogPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
				<button type="button" onclick="checkDelete(document.forms['ShopNowOrder'])" class="adminDelBtn">등록하기</button>		
			</div>	
		
		</div>
	
	</main>

	
</body>
</html>