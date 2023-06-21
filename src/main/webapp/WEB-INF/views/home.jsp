<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 공통 script & css -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- GNB -->
	<c:import url="${path}/resources/js/GNB.jsp" />
	<!-- LNB -->

	<!-- CONTENTS -->
	<div class="container-xl bg-light">
		<div class="row">
			<button onclick="location.href='/member/loginForm'">로그인</button>
			<br> ${nickName}님환영 ${code}
		</div>
		<div class="row">
			<button onclick="location.href='/member/logOut'">로그아웃</button>
		</div>
		<div class="row">
			<button onclick="location.href='/member/mypage'">마이페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/gallery/'">갤러리</button>
		</div>
		<div class="row">
			<button onclick="location.href='/community/toNotice'">커뮤니티-공지게시판으로</button>
		</div>
		<div class="row">
			<button onclick="location.href='/chat/testlink'">채팅</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
		<div class="row">
			<button onclick="location.href='/admin/'">관리자 페이지</button>
		</div>
	</div>
	<!-- GNB -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
	<script type="text/javascript">
		// Contents 위치 조정.
		$(document).ready(function() {
			var container = $('.container-xl');
			var gnbHeight = $('.fixed-gnb').outerHeight(); // GNB의 높이를 가져옴
			console.log(gnbHeight)

			container.css('margin-top', gnbHeight + 'px');
		});
	</script>
</body>
</html>