<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 메인화면</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	<a href="/community/toBoard?code=1001&currentPage=1">공지</a>
	<a href="/community/toBoard?code=1002&currentPage=1">자유</a>
	<a href="/community/toBoard?code=1003&currentPage=1">팁</a>
	<a href="/community/toBoard?code=1004&currentPage=1">질문</a>
	<a href="/community/toBoard?code=1005&currentPage=1">민원</a>
</body>
</html>