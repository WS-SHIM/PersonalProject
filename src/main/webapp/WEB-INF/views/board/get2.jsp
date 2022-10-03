<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 먹지?</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.11/handlebars.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3991ef6aea5096bb617fa9b3c7a2a715&libraries=services"></script>
</head>
<body>
<div class="container">
 <%@ include file="../include/nav.jsp" %>
 <div class="panel-heading">
   <div class="panel-body">
   	<h2>${get.title}</h2>
   	<li >메뉴  -  ${get.menu}</li>
   	<li>주소  -  ${get.address}</li>
   	<li>전화번호  -  ${get.tel}</li>
   	<li>영업시간  -  ${get.time}</li>
	<div><img src="${contextPath}/resources/upload/${get.fileName}" height="300px" width="300px"></div>
	<br><br>
	<span>지도</span>
	<div id="map" style="width:100%;height:300px;"></div>
	
		<div style="text-align: right">
		<c:if test="${mvo.memID  == 'admin'}">
		 <button class="btn btn-primary" onclick="location.href='/board/modify2?bno=<c:out value="${get.bno}"/>'">수정</button>
		</c:if>
	     <button class="btn btn-info" onclick="location.href='/board/list2'">리스트</button>
	   </div>
  </div>
 </div>
 <br><br><br><br>
</div>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('${get.address}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${get.title}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
</body>
</html>