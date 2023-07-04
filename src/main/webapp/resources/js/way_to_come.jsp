<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kreate-Hub : 오시는길</title>
<!-- 공통 script & css -->
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
<!-- 카카오 맵 API -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7252ffaa17ffd29198c0279af09c9f9&libraries=services"></script>
</head>
<body>
	<!-- GNB -->
	<c:import url="${path}/resources/js/GNB.jsp" />
	<!-- LNB -->

	<!-- CONTENTS -->
	<div class="container-xl">
		<div class="row">
			<div class="col-12 fs-1 fw-bold text-center">Kreate-Hub 오시는 길</div>
		</div>
		<div class="row justify-content-center">
			<div class="col-12" id="map" style="width: 1000px; height: 500px;"></div>
		</div>
		<div class="row">
			<div class="col-12 text-center">서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 3F E class</div>
		</div>
	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
	<script type="text/javascript">
		// Contents 위치 조정.
		$(document).ready(function ( ) {
			var container = $('.container-xl');
			var gnbHeight = $('.fixed-gnb').outerHeight(); // GNB의 높이를 가져옴

			container.css('margin-top', gnbHeight + 'px');
		});
	</script>
	<!-- script - Contents -->
	<script>
		var mapContainer = document.getElementById('map') // 지도를 표시할 div 
		var mapOption = {
			// 지도의 중심좌표
			center : new kakao.maps.LatLng(37.5679257, 126.983023),
			// 지도의 확대 레벨
			level : 3,
			// 지도종류
			mapTypeId : kakao.maps.MapTypeId.ROADMAP
		};

		// 지도를 생성한다 
		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new kakao.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		// 지도에 마커를 생성하고 표시한다
		var marker = new kakao.maps.Marker({
			// 마커의 좌표
			position : new kakao.maps.LatLng(37.5679257, 126.983023),
			// 마커를 표시할 지도 객체
			map : map

		});
		// 마커 위에 표시할 인포윈도우를 생성한다
		var infowindow = new kakao.maps.InfoWindow({
			// 인포윈도우에 표시할 내용
			content : '<div style="width:150px;text-align:center;padding:6px 0;">Kreate-Hub</div>'
		});

		// 인포윈도우를 지도에 표시한다
		infowindow.open(map, marker);
	</script>
</body>
</html>