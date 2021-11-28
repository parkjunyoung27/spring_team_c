<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${storeDetail.shop_name }:자세히보기</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/favicon.png">
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">
<link href="./resources/css/storeDetail.css" rel="stylesheet">

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap');

/* body {
    width: 80%;
    margin: 0 auto;
}
 */
#storeNameTitle span img:hover {
	background-image: url("./resources/images/star_after.png")
}

.col {
  display: block;
  float:left;
  margin-right: 5px;
}


.timelabel{
	position: relative;
	color: #fff;
	background-color: #aaa;
	font-size: 20px;
	text-align: center;
	height: 50px;
 	width: 100%;
	line-height: 50px;
	display: block;
	cursor: pointer;
	border: 3px solid transparent;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin-bottom: 5px;
}

<% for(int i=9; i<=22; i++){ %>
					
#time<%=i %>:checked + label{
background-color: #2fcc71;
}						
<% }%>	



</style>

<script type="text/javascript">
//이게 예약 취소버튼을 눌러도 예약이 된것처럼 DB에 올라가서 처리가 됩니다. 
function ask(form){
	//alert(document.getElementById("name").value);
	if (document.getElementById("name").value=="" || document.getElementById("phoneNum").value=="" 
			|| document.getElementById("people").value=="" || document.getElementById("date").value=="") {
		alert("입력칸이 비었습니다. 확인해주세요");
	return false;
	}
	var result =confirm("예약하시겠습니까?");
	//alert(result);
	
	if(result == true){
		form.submit();
		alert("예약 되었습니다.");
		return true;
		
	} else {
		alert("예약이 취소되었습니다.");	
		return false;
	}
	
}

function like(no){
	if(confirm("즐겨찾기에 추가 하시겠습니까?")){
		location.href="./storeLike.do?shop_no="+no
	}
}
function disLike(no){
	if(confirm("즐겨찾기를 해제 하시겠습니까?")){
		location.href="./storeDisLike.do?shop_no="+no
	}
}
</script>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
    var dtToday = new Date();
    
    var month = dtToday.getMonth() + 1;
    var day = dtToday.getDate();
    var year = dtToday.getFullYear();
    if(month < 10)
        month = '0' + month.toString();
    if(day < 10)
        day = '0' + day.toString();
    
    var maxDate = year + '-' + month + '-' + day;

    // or instead:
    // var maxDate = dtToday.toISOString().substr(0, 10);

    $('#date').attr('min', maxDate);
});
</script>
<body>

	<!-- Navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<div class="container">
	<script>
	//마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(${storeDetail.shop_wido}, ${storeDetail.shop_kyungdo});  
	
	//마커를 생성합니다
	var marker = new kakao.maps.Marker({
	position: markerPosition
	});
	
	//마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	</script>


	<div class="detail_container">
		<div id="storeName">
			<img alt="storeImg" src="resources/images/logo.png"
				style="max-width: 85%; max-height: 250px;"><br>
			<div id="storeNameTitle">
				<h3>${storeDetail.shop_name }
				<c:if test="${sessionScope.id ne null }">
				<c:choose>
				<c:when test="${list eq 0 }">
					<span style="line-height: 50px;vertical-align: sub; cursor:pointer;" onclick="return like(${storeDetail.shop_no})">
						<img src="resources/images/star_before.png">
					 </span>
				</c:when>
				<c:when test="${list eq 1 }">
					<span style="line-height: 50px;vertical-align: sub; cursor:pointer;" onclick="return disLike(${storeDetail.shop_no})">
						<img src="resources/images/star_after.png">
					 </span>
				</c:when>
				<c:otherwise>
					<span style="line-height: 50px;vertical-align: sub; cursor:pointer;">
						<img src="resources/images/star_after.png">
					 </span>				
				</c:otherwise>
				</c:choose>
				</c:if>
					<%-- <c:if test="${sessionScope.id ne null }">
						<c:choose>
							<c:when test="true">
								<span
									style="line-height: 50px; vertical-align: sub; cursor: pointer;"
									onclick="return star(${storeDetail.shop_no})"> <img
									src="resources/images/star_before.png"> [
									${storeDetail.shop_bookmark } ]
								</span>
							</c:when>
							<c:otherwise>
								<span
									style="line-height: 50px; vertical-align: sub; cursor: pointer;">
									<img src="resources/images/star_after.png">
								</span>
							</c:otherwise>
						</c:choose>
					</c:if> --%>
				</h3>
			</div>
			<br>
			<hr style="margin: 0; height: 2px; margin-bottom: 10px; width: 85%;">
			<p>
				<b>연락처 : </b> ${storeDetail.shop_tel }
			</p>
			<p>
				<b>운영시간 : </b>${storeDetail.shop_opentime } ~
				${storeDetail.shop_closetime }
			</p>
			<p>
				<b>위치 : </b>${storeDetail.shop_loc }
			</p>
			<p>
				<b style="color: red; margin: 0;">알립니다.</b>
			</p>
			<div class="store_notice" style="padding: 5px;">
				<c:choose>

					<c:when test="${storeDetail.shop_notice ne null}">
				${storeDetail.shop_notice }
			</c:when>
					<c:otherwise>
				마음껏 연락주세요!
			</c:otherwise>
				</c:choose>
			</div>

		</div>
		<div id="storeReserv">
			<form action="./storeReserv.do" method="post" id="reservForm">
				<div id="map"
					style="width: 100%; height: 210px; border: 1px solid black; margin-right: 18%;"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d03474ad9928948587986771d90bb4e"></script>
				<script type="text/javascript">
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = { 
					    center: new kakao.maps.LatLng(${storeDetail.shop_wido}, ${storeDetail.shop_kyungdo}), // 지도의 중심좌표
					    level: 3 // 지도의 확대 레벨
					};
					
					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
					
					//마커가 표시될 위치입니다 
					var markerPosition  = new kakao.maps.LatLng(${storeDetail.shop_wido}, ${storeDetail.shop_kyungdo}); 
					
					//마커를 생성합니다
					var marker = new kakao.maps.Marker({
					position: markerPosition
					});
					
					//마커가 지도 위에 표시되도록 설정합니다dz
					marker.setMap(map);
					
					var iwContent = '<div style="padding:5px; font-size:small;"><a href="https://map.kakao.com/link/map/${storeDetail.shop_name },${storeDetail.shop_wido}, ${storeDetail.shop_kyungdo}" style="color:black; text-decoration:none;" target="_blank">${storeDetail.shop_name }</a></div>' 
						// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						
					    iwPosition = new kakao.maps.LatLng(${storeDetail.shop_wido}, ${storeDetail.shop_kyungdo}); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					  
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					infowindow.open(map, marker);
				</script>

				<c:choose>
				<c:when test="${sessionScope.id ne null }">
				<div id="storeReservDetail">
					<h2 style="margin-top:10px; margin-bottom:10px;">예약하기</h2>
					<div id="possible_time">
					<% for(int i=9; i<=22; i++){ %>
					
						<div class="radio_check">
							<input type="radio" id="time<%=i %>" name="reservTime" required="required" value="<%=i%>:00" style="display:none"> 
							<label class="timelabel" class="col" for="time<%=i%>"><%=i%>:00</label>
						</div>
						
					<% }%>	
					
					</div>
					<p>이름 : <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required="required" class="reserv_input" value="${sessionScope.name }" disabled="disabled"></p> 
					<p>연락처 : <input type="text" id="phoneNum" name="phoneNum" placeholder="연락처를 입력하세요" required="required" class="reserv_input"> </p>
					<p>인원 : <input type="number" value="1" min="1" max="5" id="people" name="people" class="reserv_input" style="width:10%"> </p>
					<p>날짜 : <input type="date" required="required" class="reserv_input" id="date" name="date"></p>
					<p>요구사항 : <input type="text" id="request" name="request" placeholder="특이사항 있으시면 입력해주세요." class="reserv_input" style="text-align:center;"></p>
					<input type="hidden" id="shop_no" name="shop_no" value="${storeDetail.shop_no }">
					<input type="hidden" id="shop_name" name="shop_name" value="${storeDetail.shop_name }">
					<div id="reserve_btn_area">
						<button class="reserv_btn1" type="button" onclick="return ask(document.forms['reservForm'])">예약하기</button>
					</div>				
						<button class="reserv_btn" onclick="location.href='./storeList.do'" style="margin-right:10%">돌아가기</button>
						<button class="reserv_btn"  type="reset" id="join_reset" style="margin-right:3%">초기화하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<div id="noReserv">
						예약을 원하시면 로그인을 해주세요.<br><br>
						<a href='./login.do'>로그인하기</a>
					</div>
				</c:otherwise>
					<%-- <c:when test="${sessionScope.id ne null }">
						<div id="storeReservDetail">
							<h2 style="margin-top: 10px; margin-bottom: 10px;">예약하기</h2>
							<div id="possible_time">
								<%
								for (int i = 9; i <= 22; i++) {
								%>
								<%
								for (int j = 0; j < 2; j++) {
								%>
								<input type="radio" class="time_btn" id="reservTime"
									name="reservTime" required="required" value="<%=i%>:<%=j * 3%>0"><%=i%>:<%=j * 3%>0
								<%
								}
								%>
								<%
								}
								%>

							</div>
							<p>
								이름 : <input type="text" id="name" name="name"
									placeholder="이름을 입력하세요" required="required"
									class="reserv_input" value="${sessionScope.name }"
									disabled="disabled">
							</p>
							<p>
								연락처 : <input type="text" id="phoneNum" name="phoneNum"
									placeholder="연락처를 입력하세요" required="required"
									class="reserv_input">
							</p>
							<p>
								인원 : <input type="number" value="1" min="1" max="5" id="people"
									name="people" required="required" class="reserv_input"
									style="width: 10%">
							</p>
							<p>
								날짜 : <input type="date" required="required" class="reserv_input"
									id="date" name="date">
							</p>
							<p>
								요구사항 : <input type="text" id="request" name="request"
									placeholder="특이사항 있으시면 입력해주세요." class="reserv_input"
									style="text-align: right;">
							</p>
							<input type="hidden" id="shop_no" name="shop_no"
								value="${storeDetail.shop_no }"> <input type="hidden"
								id="shop_name" name="shop_name"
								value="${storeDetail.shop_name }">
							<div id="reserve_btn_area">
								<button class="reserv_btn1" type="submit" onclick="return ask()">예약하기</button>
							</div>
							<button class="reserv_btn"
								onclick="location.href='./storeList.do'"
								style="margin-right: 20%">돌아가기</button>
							<button class="reserv_btn" type="reset" id="join_reset"
								style="margin-right: 3%">초기화하기</button>
						</div>
					</c:when>
					<c:otherwise>
						<div id="noReserv">
							예약을 원하시면 로그인을 해주세요.<br>
							<br> <a href='./login.do'>로그인하기</a>
						</div>
					</c:otherwise> --%>
				</c:choose>

			</form>
		</div>
	</div>
	</div>
	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>
</body>
</html>