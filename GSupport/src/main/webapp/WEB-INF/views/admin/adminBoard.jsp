<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin | 게시판 관리</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/images/favicon.png">
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

<link href="../resources/css/adminPage.css" rel="stylesheet"> 
<link href="../resources/css/adminPage_menu.css" rel="stylesheet">
<style>
table{
	 width:200%;
}

a{
	color: white;
    margin-left: 10px;
}

a:hover{color: gold; text-decoration:none;}

.windowOpen{
	cursor: pointer;
}

.windowOpen:hover{color: gold;}

</style> 
<script type="text/javascript">
var pageNo = 1;
var gradeOption = document.getElementById("gradeOption").value;
		
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
		var gradeOption = document.getElementById("gradeOption").value;
		return linkPage(pageNo, gradeOption);
	}
	
	function linkPage(pageNo, gradeOption){
		var gradeOption = document.getElementById("gradeOption").value;
		location.href="./adminBoard.do?board_cate="+${board_cate}+"&pageNo=" + pageNo + "&gradeOption=" + gradeOption;
	}
	
</script>

<body>

	<header>
		<%@ include file="./component/navbarm.jsp"%>	
	</header>

	<main>
		<%@ include file="./component/adminPage_menu.jsp"%>
		
		<div id="adminContainer">
			
			<h1>
				<a href="./adminBoard.do?board_cate=0" <c:if test="${board_cate eq 0}">style="color:gold;"</c:if> >공지사항</a> | 
				<a href="./adminBoard.do?board_cate=1" <c:if test="${board_cate eq 1}">style="color:gold;"</c:if>> 가맹점 게시판</a> | 
				<a href="./adminBoard.do?board_cate=2" <c:if test="${board_cate eq 2}">style="color:gold;"</c:if>> 이용자 게시판</a> 				
			</h1>
			
			<div class="adminContainerOne">
			
			<form action="./adminBoard.do" method="post" id="BoardOrder" name="BoardOrder">
				<table>
					<tr>
						<th class="w1"> <input type="checkbox" name="checkall" onclick="selectAll(this)"> </th>
						<th class="w1"> No </th>
						<th class="w5">제목</th>
						<th class="w10">내용</th>
						<th class="w5">아이디</th>
						<th class="w5">닉네임</th>
						<th class="w1"> 
							<select onchange="selectOption()" id="gradeOption">
							<option value="" selected> 등급 선택 </option>
								<c:forEach items="${gradeList }" var="i">
									<c:if test="${i eq gradeOption }"> <!-- ip가 같으면 선택됨  -->
										<option value="${i }" selected>${i }</option>
									</c:if>
									<c:if test="${i ne gradeOption }">
										<option value="${i }">${i }</option>
									</c:if>
								</c:forEach>
							</select>
						</th>
						<th class="w7">이메일</th>
						<th class="w3">조회수</th>
						<th class="w3">좋아요수</th>
						<th class="w3">삭제여부</th>
						<th class="w3">등록날짜</th>
						<th class="w5">파일이름</th>
					</tr> 
					<c:choose>
						<c:when test="${fn:length(list) gt 0 }">
							<c:forEach items='${list }' var="l">
								<tr>
									<td class="w1">
										<input type="checkbox" name="check" value="${l.get('board_no')}"  onclick='checkSelectAll()' >
									</td> 
									<td class="w1" id="boardNo">${l.get("board_no") } </td>
									<td class="w7 windowOpen"  onclick="return windowOpen(${l.get('board_no') })">${l.get("board_title") } </td>
									<td class="w10">${fn:substring(l.get("board_content"), 0, 15 )}</td>
									<td class="w5">${l.get("member_id") } </td>
									<td class="w5">${l.get("member_name") } </td>	
									<td class="w3">${l.get("member_grade") } </td>
									<td class="w7">${l.get("member_email") } </td>
									<td class="w3">${l.get("board_count") } </td>
									<td class="w4">${l.get("board_like") } </td>
									<td class="w4">${l.get("board_delete") } </td>
									<td class="w5">${fn:substring(l.get("board_date"), 0, fn:length("l.get('board_date')") )}</td>													
									<td class="w10">${l.get("board_orifile") } </td>
									<td class="categoryNum" style="display: none;">${l.get("board_category")} </td>
								</tr>				
							</c:forEach>		
						</c:when>
						<c:otherwise>
							<tr id="adminNone">
								<td colspan="13">게시판 기록이 없습니다... <td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</form>	
			
			</div>
		
			<div class="adminLogPaging">
				<ui:pagination paginationInfo="${paginationInfo }" type="text" jsFunction="linkPage"/>
				<button type="button" onclick="checkDelete(document.forms['BoardOrder'])" class="adminDelBtn">삭제하기</button>		
			</div>	
		
		</div>
	
	</main>
	
	<div class="modal fade">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    </div>
	  </div>
	</div>
	
</body>
</html>

<script type="text/javascript">

function windowOpen(num){
	var win = window.open("/GSupport/detail.do?board_no="+num, '게시판 상세보기', 'width=1000, height=800,'+ 
			'scrollbars=yes, resizable=no, top=0, left=250' );
}

</script>

