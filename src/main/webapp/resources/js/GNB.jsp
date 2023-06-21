<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Golbal Navigation Bar</title>
<!-- 공통 script -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="${path}/resources/js/scripts.jsp" />

<style type="text/css">
.fixed-gnb {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	z-index: 9999;
 	background-color: #F2F2F2;
}
</style>
</head>
<body>
	<div class="container-fluid fixed-gnb">
		<div class="row">
			<div class="col-3 d-flex justify-content-center p-0">
				<img class="w-50 h-100" src="${path}/resources/img/kh_logo.png">
			</div>
			<div class="col-7">
				<div class="row h-100">
					<div class="col-3 p-0">
						<button class="btn btn-outline-secondary btn-lg w-100 h-100" onclick="location.href='/gallery/';">갤러리</button>
					</div>
					<div class="col-3 p-0">
						<button class="btn btn-outline-secondary btn-lg w-100 h-100" onclick="location.href='/community/toBoard?code=1001&currentPage=1';">커뮤니티</button>
					</div>
					<div class="col-3 p-0">
						<c:if test="${sessionScope.memberType eq 2000}">
							<button class="btn btn-outline-secondary btn-lg w-100 h-100" onclick="location.href='/admin/';">관리자페이지</button>
						</c:if>
						<c:if test="${sessionScope.memberType ne 2000}">
							<c:if test="${not empty sessionScope.code}">
								<button class="btn btn-outline-secondary btn-lg w-100 h-100" onclick="location.href='/member/mypage';">마이페이지</button>
							</c:if>
							<c:if test="${empty sessionScope.code}">
								<button class="btn btn-outline-secondary btn-lg w-100 h-100" onclick="alert('로그인을 해주세요.'); location.href='/member/loginForm';">마이페이지</button>
							</c:if>
						</c:if>
					</div>
				</div>
			</div>
			<div class="col-2 p-0">
				<c:if test="${empty sessionScope.code}">
					<button class="btn btn-outline-secondary btn-lg w-100 h-100" onclick="location.href='/member/loginForm'">LOGIN</button>
				</c:if>
				<c:if test="${not empty sessionScope.code}">
					<div class="row">
						<div class="col-12 p-0">60:00</div>
					</div>
					<div class="row">
						<div class="col-12 p-0">LOGOUT</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>