<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FOOTER</title>
    <c:set var="path" value="${pageContext.request.contextPath}" />
    <c:import url="${path}/resources/js/scripts.jsp" />
</head>

<body>
    <div class="container-fluid" style="border: solid black 1px;">
        <div style="display: flex; padding: 20px; align-items: center;">
            <div style="flex: 1;">
                <img src="kh_logo.png" alt="" class="logo">
            </div>
            <div style="flex: 3; padding: 20px;">
                <div>
                    <a href="" onclick="popup()">개인정보 처리 방침</a> | <a href="">오시는 길</a>
                </div>
                <div>
                    회사명:㈜배신자들 대표이사:이석준 사업자 등록번호:XXX-XX-XXXXX
                    E.XXX@XXXX.XXX F.XXX-XXX-XXXX
                </div>
                <div>
                    서울특별시 중구 남대문로 120 그레이츠 청계 (구 대일빌딩) 3F, E class
                </div>
                <div>
                    [Kreate Hub] Allrights reserved.
                </div>
            </div>
        </div>
    </div>
    <script>
        function popup() {
            const url = "";
            const name = "Kreate Hub 개인정보 처리 방침";
            const option = "width = 500, height = 500, top = 100, left = 200, location = no"
            window.open(url, name, option);
            return false;
        }
    </script>
</body>

</html>