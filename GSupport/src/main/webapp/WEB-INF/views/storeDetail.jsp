<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${storeDetail.shop_name }: 자세히보기</title>
<style type="text/css">
#storeName {
	width: 50%;
	float: left;
}

#storeReserv {
	width: 50%;
	float: right;
}
</style>
<script type="text/javascript">
function doOpenCheck(chk){
    var obj = document.getElementsByName("reservTime");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}
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
	<div id="storeName">
		<img alt="storeImg" src="resources/images/logo.png" style="width: 300px;height:300px;"><br>
		<b>${storeDetail.shop_name }</b><br> 
		연락처 : ${storeDetail.shop_tel } <br> 
		운영시간 : ${storeDetail.shop_opentime } ~ ${storeDetail.shop_closetime } <br> 
		위치 : ${storeDetail.shop_loc }
		<br>
		<p><button onclick="location.href='./jongnoStore.do'">돌아가기</button>
	</div>
<div id="storeReserv">
<div id="map" style="width:300px;height:300px;"></div>
<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3d03474ad9928948587986771d90bb4e
"></script>
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

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
</script>
	<form action="./storeReserv.do" method="post">
		<div id="storeReservDetail">
			이름 : <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required="required"> <br> 
			연락처 : <input type="text" id="phoneNum" name="phoneNum" placeholder="연락처를 입력하세요" required="required"> <br> 
			날짜 : <input type="date" id="date" name="date" required="required"><br>
			시간 : 	오전 <input type="checkbox" name="reservTime" value="amTime" onclick="doOpenCheck(this);">
					오후 <input type="checkbox" name="reservTime" value="pmTime" onclick="doOpenCheck(this);"><br>
					<input type="hidden" name="shop_no" value="${storeDetail.shop_no }">
			<p><button onclick="return ask();">예약하기</button>
		</div>
	</form>
</div>
	
</body>
</html>