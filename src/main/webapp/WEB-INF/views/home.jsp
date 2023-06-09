<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<button onclick="location.href='/member/loginForm'">로그인</button>    ${code}님환영
	<hr>
	<button onclick="location.href='/member/logOut'">로그아웃</button>
	<hr>
	<button onclick="location.href='/member/mypage'">마이페이지</button>
	<hr>
	<button onclick="location.href='/gallery/'">갤러리</button>
	<hr>
	<button onclick="location.href='/community/toNotice'">커뮤니티-공지게시판으로</button>
	<hr>
	<button onclick="location.href='/chat/testlink'">채팅</button>
	<hr>
	<button onclick="location.href='/admin/'">관리자 페이지</button>
	<hr>
</body>
</html>