<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<footer class="bd-footer text-light bg-dark py-4 mt-2 ">
	<div class="container-fluid py-2 px-4">
		<div class="row">
			<!-- 로고 -->
			<div class="col-3 d-flex">
				<a class="p-0 m-auto" href="/">
					<img class="logo" src="${path}/resources/img/kh_logo.png">
				</a>
			</div>
			<!-- 내용 -->
			<div class="col-9">
				<div class="row mt-1">
					<div class="col-auto">
						<a class="link-light" href="javascript:void(0)" onclick="popup()">개인정보처리방침</a>
					</div>
					<div class="col-auto">
						<a class="link-light" href="${path}/resources/js/way_to_come.jsp">오시는길</a>
					</div>
				</div>
				<div class="row mt-1">
					<address class="text-secondary m-0">
						<span>회사명.</span> ㈜배신자들 <span class="ms-3">대표이사.</span> 강병준 <span class="ms-3">사업자등록번호.</span> XXX-XX-XXXXX <span class="ms-3">E.</span>
						<a class="link-secondary" href="javascript:void(0)">rkqudwns@naver.com</a>
						<span class="ms-3">T.</span> 010-3011-1687
						<br>
						<span>주소.</span> 서울특별시 중구 남대문로 120 그레이츠 청계 (구 대일빌딩) 3F, E class
					</address>
				</div>
				<div class="row mt-1">
					<div>[Kreate Hub] All rights reserved.</div>
				</div>
			</div>
		</div>
	</div>
</footer>
<script type="text/javascript">
	function popup ( ) {
		const url = "${path}/resources/js/privacy_policy.jsp";
		const name = "Kreate-Hub 개인정보처리방침";
		const option_width = window.screen.width / 2;
		const option_height = window.screen.height;
		const option_screenX = (window.screen.width - option_width) / 2;
		const option_screenY = 0;
		const option_location = "no";
		const option = "width=" + option_width + ",height=" + option_height + ",left=" + option_screenX + ",top=" + option_screenY + ",location=" + option_location;
		return window.open(url, name, option);
	}

	$(window).on("load resize", function ( ) {
		var screenHeight = $(window).outerHeight();
		var gbnHeight = $("header").outerHeight();

		$(".container-xl").css("min-height", screenHeight - gbnHeight);
	})
</script>
