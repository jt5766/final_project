<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header class="navbar navbar-dark bg-dark navbar-expand-lg text-secondary flex-column sticky-top mb-2">
	<!-- GNB -->
	<nav class="container-fluid bd-guatter border-bottom border-secondary flex-wrap flex-lg-nowrap position-relative">
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
				<h1 class="offcanvas-title text-light fw-bold" id="bdNavbarOffcanvasLabel">Kreate-Hub</h1>
				<button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close" data-bs-target="#bdNavbar"></button>
			</div>
			<!-- 오프셋 바디 -->
			<div class="offcanvas-body p-4 pt-0 p-lg-0 justify-content-between">
				<hr class="d-lg-none">
				<ul class="navbar-nav flex-row flex-wrap bd-navbar-nav">
					<li class="nav-item col-12 col-lg-auto">
						<a class="nav-link py-2 px-0 px-lg-2 fs-2" href="/gallery/" aria-current="true">갤러리</a>
						<ul class="navbar-nav d-flex d-lg-none flex-column flex-wrap bd-navbar-nav">
							<li class="nav-item col-12">
								<c:forEach items="${gallery}" var="item">
									<a class="nav-link py-0 ps-4 fs-3" href="/gallery/category/${item.code}?page=1" aria-current="true">- ${item.name}</a>
								</c:forEach>
							</li>
						</ul>
					</li>
					<li class="nav-item col-12 col-lg-auto">
						<a class="nav-link py-2 px-0 px-lg-2 fs-2" href="/community/toBoard?code=1001&currentPage=1" aria-current="true">커뮤니티</a>
						<ul class="navbar-nav d-flex d-lg-none flex-column flex-wrap bd-navbar-nav">
							<li class="nav-item col-12">
								<c:forEach items="${community}" var="item">
									<a class="nav-link py-0 ps-4 fs-3" href="/community/toBoard?code=${item.code}&currentPage=1" aria-current="true">- ${item.name}</a>
								</c:forEach>
							</li>
						</ul>
					</li>
					<li class="nav-item col-12 col-lg-auto">
						<c:if test="${sessionScope.memberType eq 9999}">
							<a class="nav-link py-2 px-0 px-lg-2 fs-2" href="/admin/home?pagecode=1001" aria-current="true">관리자페이지</a>
						</c:if>
						<c:if test="${sessionScope.memberType ne 9999}">
							<c:if test="${not empty sessionScope.code}">
								<a class="nav-link py-2 px-0 px-lg-2 fs-2" href="/member/my-page/gallery" aria-current="true">마이페이지</a>
							</c:if>
							<c:if test="${empty sessionScope.code}">
								<a class="nav-link py-2 px-0 px-lg-2 fs-2" href="/member/loginForm/" onclick="alert('로그인이 필요한 서비스입니다.\n로그인으로 이동합니다.');" aria-current="true">마이페이지</a>
							</c:if>
						</c:if>
					</li>
				</ul>
				<hr class="d-lg-none">
				<ul class="navbar-nav flex-row flex-wrap bd-navbar-nav">
					<li class="nav-item col-12 col-lg-auto">
						<c:if test="${empty sessionScope.code}">
							<a class="nav-link py-2 px-0 px-lg-2 fs-2" href="/member/loginForm/" aria-current="true">로그인</a>
						</c:if>
						<c:if test="${not empty sessionScope.code}">
							<a class="nav-link py-2 px-0 px-lg-2 fs-2" href="/member/logOut/" aria-current="true">로그아웃</a>
						</c:if>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- LNG -->
	<nav class="container-fluid bd-guatter d-none d-lg-flex flex-column flex-wrap flex-lg-nowrap position-relative">
		<c:choose>
			<c:when test="${param.pageName eq 'gallery'}">
				<!-- Title -->
				<div class="row justify-content-center">
					<div class="col mt-3 text-light fs-1 fw-bold">갤 러 리</div>
				</div>
				<!-- Button -->
				<div class="row mt-2 justify-content-center">
					<div class="col btn-group" role="group">
						<c:forEach items="${gallery}" var="item">
							<c:choose>
								<c:when test="${item.code eq param.btnNum}">
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off" checked>
								</c:when>
								<c:otherwise>
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off">
								</c:otherwise>
							</c:choose>
							<label class="btn btn-outline-secondary text-center" for="btnradio${item.code}" style="width: 150px" onclick="location.href='/gallery/category/${item.code}?page=1'">${item.name}</label>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:when test="${param.pageName eq 'community'}">
				<!-- Title -->
				<div class="row justify-content-center">
					<div class="col mt-3 text-light fs-1 fw-bold">커 뮤 니 티</div>
				</div>
				<!-- Button -->
				<div class="row mt-2 justify-content-center">
					<div class="col btn-group" role="group">
						<c:forEach items="${community}" var="item">
							<c:choose>
								<c:when test="${item.code eq param.btnNum}">
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off" checked>
								</c:when>
								<c:otherwise>
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off">
								</c:otherwise>
							</c:choose>
							<label class="btn btn-outline-secondary text-center" for="btnradio${item.code}" style="width: 150px" onclick="location.href='/community/toBoard?code=${item.code}&currentPage=1'">${item.name}</label>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:when test="${param.pageName eq 'mypage'}">
				<!-- Title -->
				<div class="row justify-content-center">
					<div class="col mt-3 text-light fs-1 fw-bold">마 이 페 이 지</div>
				</div>
				<!-- Button -->
				<div class="row mt-2 justify-content-center">
					<div class="col btn-group" role="group">
						<c:forEach items="${mypage}" var="item">
							<c:choose>
								<c:when test="${item.code eq param.btnNum}">
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off" checked>
								</c:when>
								<c:otherwise>
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off">
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${item.code eq 1001}">
									<label class="btn btn-outline-secondary text-center" for="btnradio${item.code}" style="width: 150px" onclick="location.href='/member/my-page/gallery'">${item.name}</label>
								</c:when>
								<c:when test="${item.code eq 1002}">
									<label class="btn btn-outline-secondary text-center" for="btnradio${item.code}" style="width: 150px" onclick="location.href='/member/my-page/community'">${item.name}</label>
								</c:when>
								<c:when test="${item.code eq 1003}">
									<label class="btn btn-outline-secondary text-center" for="btnradio${item.code}" style="width: 150px" onclick="location.href='/chat/testlink'">${item.name}</label>
								</c:when>
								<c:when test="${item.code eq 1004}">
									<label class="btn btn-outline-secondary text-center" for="btnradio${item.code}" style="width: 150px" onclick="location.href='/member/myinfo'">${item.name}</label>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:when test="${param.pageName eq 'adminpage'}">
				<!-- Title -->
				<div class="row justify-content-center">
					<div class="col mt-3 text-light fs-1 fw-bold">관 리 자 페 이 지</div>
				</div>
				<!-- Button -->
				<div class="row mt-2 justify-content-center">
					<div class="col btn-group" role="group">
						<c:forEach items="${adminpage}" var="item">
							<c:choose>
								<c:when test="${item.code eq param.btnNum}">
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off" checked>
								</c:when>
								<c:otherwise>
									<input type="radio" class="btn-check" name="btnradio" id="btnradio${item.code}" autocomplete="off">
								</c:otherwise>
							</c:choose>
							<label class="btn btn-outline-secondary text-center" for="btnradio${item.code}" style="width: 150px" onclick="location.href='/admin/home?pagecode=${item.code}'">${item.name}</label>
						</c:forEach>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<!-- Title -->
				<div class="row justify-content-center">
					<div class="col mt-3 text-light fs-1 fw-bold">K H에 오신것을 환영합니다.</div>
				</div>
				<!-- Button -->
			</c:otherwise>
		</c:choose>
	</nav>
</header>
