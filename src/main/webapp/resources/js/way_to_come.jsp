<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Kreate Hub 오시는 길</title>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e7252ffaa17ffd29198c0279af09c9f9&libraries=services"></script>
</head>

<body>
    <div style="text-align: center;">
        <h2>Kreate Hub 오시는 길</h2>
        <div id="map" style="width:100%;height:350px;"></div>
        <div>
            서울특별시 중구 남대문로 120 그레이츠 청계(구 대일빌딩) 3F E class
        </div>
    </div>
        <script>
            var mapContainer = document.getElementById('map'),
            mapOption = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };
            var map = new kakao.maps.Map(mapContainer, mapOption);
            var geocoder = new kakao.maps.services.Geocoder();
            geocoder.addressSearch('서울특별시 중구 남대문로 120 그레이츠 청계', function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: coords
                });
                var infowindow = new kakao.maps.InfoWindow({
                    content: '<div style="width:150px;text-align:center;padding:6px 0;">Kreate Hub</div>'
                });
                infowindow.open(map, marker);
                map.setCenter(coords);
            }
        });    
        </script>
</body>

</html>