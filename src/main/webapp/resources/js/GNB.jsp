<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Golbal Navigation Bar</title>
</head>
<body>
	<header class="navbar navbar-dark bg-dark navbar-expand-lg sticky-top">
		<nav class="container-fluid bd-guatter flex-wrap flex-lg-nowrap position-relative">
			<!-- 브랜드 - 로고 -->
			<a class="navbar-brand p-0 mx-auto mx-lg-5 my-0" href="/">
				<img class="logo" src="${path}/resources/img/kh_logo.png">
			</a>
			<!-- 토글 버튼 -->
			<div class="d-flex">
				<button class="navbar-toggler d-flex d-lg-none order-3 p-2" type="button" data-bs-toggle="offcanvas" data-bs-target="#bdNavbar" aria-controls="bdNavbar">
					<i class="bi bi-list"></i>
				</button>
			</div>
			<!-- 오프셋 -->
			<div class="offcanvas-lg offcanvas-end text-bg-dark flex-grow-1" tabindex="-1" id="bdNavbar" aria-labelledby="bdNavbarOffcanvasLabel" data-bs-scroll="true">
				<!-- 오프셋 헤더 -->
				<div class="offcanvas-header px-4 pb-0">
					<h5 class="offcanvas-title text-white" id="bdNavbarOffcanvasLabel">Kreate-Hub</h5>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
				</div>
				<!-- 오프셋 바디 -->
				<div class="offcanvas-body p-4 pt-0 p-lg-0 justify-content-between">
					<hr class="d-lg-none text-white-50">
					<ul class="navbar-nav flex-row flex-wrap bd-navbar-nav">
						<li class="nav-item col-12 col-lg-auto">
							<a class="nav-link py-2 px-0 px-lg-2 fs-1" href="/gallery/" aria-current="true">갤러리</a>
						</li>
						<li class="nav-item col-12 col-lg-auto">
							<a class="nav-link py-2 px-0 px-lg-2 fs-1" href="/community/toBoard?code=1001&currentPage=1" aria-current="true">커뮤니티</a>
						</li>
						<li class="nav-item col-12 col-lg-auto">
							<c:if test="${sessionScope.memberType eq 2000}">
								<a class="nav-link py-2 px-0 px-lg-2 fs-1" href="/admin/" aria-current="true">관리자페이지</a>
							</c:if>
							<c:if test="${sessionScope.memberType ne 2000}">
								<c:if test="${not empty sessionScope.code}">
									<a class="nav-link py-2 px-0 px-lg-2 fs-1" href="/member/mypage/" aria-current="true">마이페이지</a>
								</c:if>
								<c:if test="${empty sessionScope.code}">
									<a class="nav-link py-2 px-0 px-lg-2 fs-1" href="/member/loginForm/" onclick="alert('로그인을 해주세요.');" aria-current="true">마이페이지</a>
								</c:if>
							</c:if>
						</li>
					</ul>
					<hr class="d-lg-none text-white-50">
					<ul class="navbar-nav flex-row flex-wrap bd-navbar-nav">
						<li class="nav-item col-12 col-lg-auto">
							<c:if test="${empty sessionScope.code}">
								<a class="nav-link py-2 px-0 px-lg-2 fs-1" href="/member/loginForm/" aria-current="true">로그인</a>
							</c:if>
							<c:if test="${not empty sessionScope.code}">
								<a class="nav-link py-2 px-0 px-lg-2 fs-1" href="/member/logOut/" aria-current="true">로그아웃</a>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
</body>
</html>