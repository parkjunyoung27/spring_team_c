<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.guName }가맹점</title>
<link rel="icon" href="${pageContext.request.contextPath }/resources/images/favicon.png">
<link href="./resources/css/index.css" rel="stylesheet">
<link href="./resources/css/base.css" rel="stylesheet">

<script type="text/javascript">
function linkPage(pageNo){
	<c:if test="${search != null}">
	location.href="./storeList.do?guName=${guName}&shop_wido=${list[0].shop_wido }&shop_kyungdo=${list[0].shop_kyungdo }&pageNo="+pageNo+"&search=${search}";
	</c:if>
	<c:if test="${search == null}">
	location.href="./storeList.do?guName=${guName}&shop_wido=${list[0].shop_wido }&shop_kyungdo=${list[0].shop_kyungdo }&pageNo="+pageNo;
	</c:if>
}
</script>
<style>

/* Left column */
.column.side {
	width: 20%;
	border-style: solid 1px;
	height: auto;
	float: left;
	border-radius: 20px;
}

.column.middle {
	width: 75%;
	float: right;
	background-color: white;
}

.container_header {
	border-bottom: 1px solid #e5e5e5;
	border-top: 1px solid #e5e5e5;
	padding: 10px;
}

#storeSearchContainer {
	margin-top: 10px;
}

div#map {
	margin: 0 auto;
}

#storeSearchTable {
	width: 100%;
	margin-top: 20px;
}

#storeSearchColumn {
	background-color: forestgreen;
	height: 37px;
	font-weight: 600;
	color: white;
	font-size: larger;
	letter-spacing: 5px;
}

#storeSearchList {
	height: 35px;
	text-align: center;
	font-size: medium;
	font-weight: 500;
}

div#searchButton {
	margin-top: 30px;
}

#searchButton button {
	text-align: center;
	background: #ffffff;
	box-shadow: 1px 1px 1px 1px #b7b7b7;
	color: #666666;
	border: none;
	border-radius: 4px;
	position: sticky;
	height: 40px;
	width: 45%;
	font-size: 0.8em;
	padding: 3px;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	margin: 3px;
	position: sticky;
}

#searchButton button:hover {
	background: green;
	color: white;
	font-weight: 700;
}

#searchButton button:before, #searchButton button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: white;
	transition: 400ms ease all;
}

#searchButton button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

#storeSearchList:hover {
	background-color: #228b224d;
	color:white;
	cursor: pointer;
}

div#paging {
	text-align: center;
	margin-top: 30px;
	text-decoration: none;
	font-size: large;
	letter-spacing: 1px;
	padding: 10px;
	margin-bottom: 15px;
}

div#paging a {
	text-decoration: none;
	color: black;
}

div#paging a:hover {
	font-weight: 700;
}

#storeListNone {
	width: 100%;
	height: 300px;
	text-align: center;
	vertical-align: middle;
	/* 	line-height: 300px;*/
	font-weight: 700;
	letter-spacing: 1px;
	font-size: larger;
}
.searchBox{
text-align: center;
margin-top:10px;
}

.Cate_search {
	width: 80px;
	height: 40px;
	border-radius: 5px;
	text-align: center;
	font-size:15px;
	vertical-align: middle;
	
}

.Cate_searchbox {
	width:250px;
	height:40px;
	background-color: white;
	border-radius:5px;
	text-align: center;
	font-size:15px;
	vertical-align: middle;
}

</style>
</head>
<body>

	<!-- navbar -->
	<%@ include file="./component/navbar.jsp"%>

	<!-- main -->
	<div class="container">
		<div class="column side">
			<div class="account_profile">
				<div class="title">

					<div class="container_header">
						<h1>가맹점 찾기</h1>
					</div>


					<div id="storeSearchContainer">
						<h2 style="color: green; font-weight: bold; padding: 10px 0 0 20px;">
							${param.guName }</h2>

						<div id="searchButton">
							<c:forEach items="${list2 }" var="l2">
								<button type="submit" onclick="location.href='./storeList.do?guName=${l2.shop_gu}&shop_wido=${l2.gu_wido }&shop_kyungdo=${l2.gu_kyungdo }'"
								<c:if test="${param.guName eq l2.shop_gu }">style="	background: green; color: white; font-weight: 700;"</c:if>>${l2.shop_gu }</button>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="column middle">

			<!-- 카카오맵api -->
			<div id="map" style="width: 95%; height: 400px;"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d03474ad9928948587986771d90bb4e"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = { 
		        center: new kakao.maps.LatLng(${list[0].shop_wido}, ${list[0].shop_kyungdo}), // 지도의 중심좌표
		        level: 6 // 지도의 확대 레벨
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
		<c:if test="${l.shop_wido ne '' || l.shop_kyungdo ne ''}">
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
		</c:if>
		</c:forEach>
		
		</script>
			<c:choose>
				<c:when test="${fn:length(list) > 0}">
					<table id="storeSearchTable">
						<tr id="storeSearchColumn">
							<th>매장명</th>
							<th>연락처</th>
							<th>운영시간</th>
							<th>위치</th>
						</tr>
						<tbody>
							<c:forEach items="${list }" var="l">
								<tr id="storeSearchList"
									onclick="location.href='./storeDetail.do?shop_no=${l.shop_no}'">
									<td>${l.shop_name }</td>
									<td>${l.shop_tel }</td>
									<td><c:choose>
											<c:when
												test="${l.shop_opentime eq '00:00' && l.shop_closetime eq '00:00' }">
					00:00 ~ 24:00
				</c:when>
											<c:otherwise>
					${l.shop_opentime } ~ ${l.shop_closetime }
				</c:otherwise>
										</c:choose></td>
									<td>${l.shop_loc }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<!-- 페이징 -->
					<!-- 1.
	1. pom설정
	2. pagination설정
	3. 데이터베이스에서 값 가져오기 - 페이징 해보기
	4. 데이터 묶어오기
	 -->
					<div id="paging">
						<ui:pagination paginationInfo="${paginationInfo }" type="text"
							jsFunction="linkPage" />
					</div>

					<!-- 검색 -->
					<div style="text-align: center;">
						<form action="./storeList.do">
							<select name="guName" class="Cate_search">
								<c:forEach items="${list2 }" var="l2">
									<option value="${l2.shop_gu }"
										<c:if test ="${guName eq l2.shop_gu}">selected="selected"</c:if>>${l2.shop_gu }
									</option>
								</c:forEach>
							</select>
							<%-- <input type="hidden" name="guName" value="${guName}"> --%>
							<input type="hidden" name="shop_wido"
								value="${list[0].shop_wido }"> <input type="hidden"
								name="shop_kyungdo" value="${list[0].shop_kyungdo }"> 
								<input type="text" name="search" value="${search }" class="Cate_searchbox" placeholder="찾으시는 가게를 입력해주세요.">
							<button type="submit" style="border: none; background: none;">
								<img src="./resources/images/search.png" style="height: 45px; margin-left:5px; vertical-align: middle;">
							</button>
						</form>
					</div>

				</c:when>
				<c:otherwise>
					<div id="storeListNone">해당 지역에 가맹점이 존재하지 않습니다.</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<!-- footer -->
	<%@ include file="./component/footer.jsp"%>

</body>
</html>