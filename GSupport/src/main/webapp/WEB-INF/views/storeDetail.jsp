<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${storeDetail.shop_name }: 자세히보기</title>
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/storeDetail.css" rel="stylesheet">

<style type="text/css">

</style>

<script type="text/javascript">
//이게 예약 취소버튼을 눌러도 예약이 된것처럼 DB에 올라가서 처리가 됩니다. 
function ask(){
	if(confirm("예약하시겠습니까?")){
		alert("예약 되었습니다.")
		location.href='./storeReserv.do?shop_no=${storeDetail.shop_no}';
	} else {
		alert("예약이 취소되었습니다.");	
		return false;
	}
}
</script>
</head>

<body>

	<!-- navbar -->
	<%@ include file= "./component/navbar.jsp"%>

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
			<img alt="storeImg" src="resources/images/logo.png" style="max-width: 85%; max-height: 250px;"><br>
			<h2>${storeDetail.shop_name } </h2>
			<%-- <c:if test="${sessionScope.id ne null }">
				<a href="./storeLike.do?shop_no=${storeDetail.shop_no }">즐겨찾기</a>[ ${storeDetail.shop_like } ]
			</c:if> --%>
			<br> 
			<hr style="margin:0; height: 2px; margin-bottom:10px; width: 70%;">
			<p><b>연락처 : </b> ${storeDetail.shop_tel } </p> 
			<p><b>운영시간 : </b>${storeDetail.shop_opentime } ~ ${storeDetail.shop_closetime } </p> 
			<p><b>위치 : </b>${storeDetail.shop_loc } </p>
			<p><b style="color:red; margin:0;">알립니다.</b></p>
			<div class="store_notice" style="padding:5px;">
				마음껏 연락주세요!
			</div>

		</div>
		<div id="storeReserv">
			<form action="./storeReserv.do" method="post" id="reservForm">
				<div id="map" style="width:80%;height:210px; border: 1px solid black; margin-right: 18%;"></div>
				
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
				</script>
			
				<c:choose>
				<c:when test="${sessionScope.id ne null }">
				<div id="storeReservDetail">
					<h2 style="margin-top:10px; margin-bottom:10px;">예약하기</h2>
					<div id="possible_time">
					<% for(int i=9; i<=22; i++){ %>
						<%for(int j=0; j<2; j++) {%>
							<input type="radio" class="time_btn" id="reservTime" name="reservTime" required="required" value="<%=i%>:<%=j*3%>0"><%=i%>:<%=j*3%>0
						<%} %>
					<% }%>	
					
					</div>
					<p>이름 : <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required="required" class="reserv_input" value="${sessionScope.name }" disabled="disabled"></p> 
					<p>연락처 : <input type="text" id="phoneNum" name="phoneNum" placeholder="연락처를 입력하세요" required="required" class="reserv_input"> </p>
					<p>인원 : <input type="number" value="1" min="1" max="5" id="people" name="people"required="required" class="reserv_input" style="width:10%"> </p>
					<p>날짜 : <input type="date" required="required" class="reserv_input" id="date" name="date"></p>
					<p>요구사항 : <input type="text" id="request" name="request" placeholder="특이사항 있으시면 입력해주세요." class="reserv_input" style="text-align:right;"></p>
					<input type="hidden" id="shop_no" name="shop_no" value="${storeDetail.shop_no }">
					<input type="hidden" id="shop_name" name="shop_name" value="${storeDetail.shop_name }">
					<div id="reserve_btn_area"><button class="reserv_btn1" type="submit" onclick="return ask()">예약하기</button></div>				
						<button class="reserv_btn" onclick="location.href='./storeList.do'" style="margin-right:20%">돌아가기</button>
						<button class="reserv_btn"  type="reset" id="join_reset" style="margin-right:3%">초기화하기</button>
				</div>
				</c:when>
				<c:otherwise>
					예약을 원하시면 로그인 해주세요.<br>
					<a href='./login.do'>로그인하기</a>
				</c:otherwise>
				</c:choose>
				
			</form>
		</div>
	</div>
	<!-- footer -->
	<%@ include file= "./component/footer.jsp"%>
</body>
</html>