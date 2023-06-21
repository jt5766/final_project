<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FOOTER</title>
</head>
<body>
	<div class="container-fluid bg-dark text-light">
		<div style="display: flex; padding: 20px; align-items: center;">
			<div style="flex: 1;">
				<img class="logo" src="${path}/resources/img/kh_logo.png" alt="">
			</div>
			<div style="flex: 3; padding: 20px;">
				<div>
					<a href="" onclick="popup()">개인정보 처리 방침</a>
					|
					<a href="${path}/resources/js/way_to_come.jsp">오시는 길</a>
				</div>
				<div>회사명:㈜배신자들 대표이사:XXX 사업자 등록번호:XXX-XX-XXXXX E.XXX@XXXX.XXX F.XXX-XXX-XXXX</div>
				<div>서울특별시 중구 남대문로 120 그레이츠 청계 (구 대일빌딩) 3F, E class</div>
				<div>[Kreate Hub] Allrights reserved.</div>
			</div>
		</div>
	</div>
	<script>
		function popup() {
			const url = "${path}/resources/js/privacy_policy.jsp";
			const name = "Kreate Hub 개인정보 처리 방침";
			const option = "width = 500, height = 500, top = 100, left = 200, location = no"
			window.open(url, name, option);
			return false;
		}
	</script>
</body>
</html>