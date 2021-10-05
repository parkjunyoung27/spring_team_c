<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>종로구 가맹점</title>
<link href="./resources/css/index.css" rel="stylesheet">
<style>
	#storeSearchList:hover{
		background-color: #aaaaaa;
		cursor: pointer;
	}
	
</style>
</head>
<body>

<!-- navbar -->
<%@ include file= "./component/navbar.jsp"%>

<!-- main -->
<div class="header-img"></div>

<h1>가맹점 찾기</h1>
<h3 style="margin:10px 10px;">*종로구 가맹점*</h3>
<hr>
<div id="storeSearchContainer">
	
	<div id="searchButton">
		<button>종로구</button>
	</div>
	
	<hr>
		<!-- 카카오맵api -->
		<div id="map" style="width:95%;height:400px;"></div>
		<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d03474ad9928948587986771d90bb4e"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(37.56945089, 126.9867203560), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };
		
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();
		
		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		// 마커를 표시할 위치입니다 
		<c:forEach items="${list }" var="l">
		var position =  new kakao.maps.LatLng(${l.shop_wido }, ${l.shop_kyungdo });
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		  position: position,
		  clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		});
		
		// 아래 코드는 위의 마커를 생성하는 코드에서 clickable: true 와 같이
		// 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
		// marker.setClickable(true);
		
		// 마커를 지도에 표시합니다.
		marker.setMap(map);
		
		var positions = [
		    {
		        content: '<div><img src="resources/images/logo.png" width="100%" height="80" text-align: center;></div>'+'<div><b>${l.shop_name}</b></div>'+
		        '<div style="font-size:small;">${l.shop_tel}</div>'+'<div style="font-size:small;">${l.shop_loc}</div>', 
		        latlng: new kakao.maps.LatLng(${l.shop_wido }, ${l.shop_kyungdo })
		    },
		   
		];
		
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
		    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
		    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
		    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
		
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		/* 아래와 같이도 할 수 있습니다 */
		/*
		for (var i = 0; i < positions.length; i ++) {
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng // 마커의 위치
		    });
		
		    // 마커에 표시할 인포윈도우를 생성합니다 
		    var infowindow = new kakao.maps.InfoWindow({
		        content: positions[i].content // 인포윈도우에 표시할 내용
		    });
		
		    // 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
		    // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
		    (function(marker, infowindow) {
		        // 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
		        kakao.maps.event.addListener(marker, 'mouseover', function() {
		            infowindow.open(map, marker);
		        });
		
		        // 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
		        kakao.maps.event.addListener(marker, 'mouseout', function() {
		            infowindow.close();
		        });
		    })(marker, infowindow);
		}
		*/
		</c:forEach>
		</script>	
	<hr>
	<table id="storeSearchTable">
		<tr id="storeSearchColumn">
			<th>매장명</th>
			<th>연락처</th>
			<th>운영시간</th>
			<th>위치</th>
		</tr>
		<tbody>
		<c:forEach items="${list }" var="l">
			<tr id="storeSearchList" onclick="location.href='./storeDetail.do?shop_no=${l.shop_no}'">
				<td>${l.shop_name }</td>
				<td>${l.shop_tel }</td>
				<td>${l.shop_opentime } ~ ${l.shop_closetime }</td>
				<td>${l.shop_loc }</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</div>

<!-- footer -->
<%@ include file= "./component/footer.jsp"%>
	
</body>
</html>