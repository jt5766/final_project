<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 공지사항</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>
* {
	box-sizing: border-box;
	border: 1px solid black;
	text-align: center;
}

#table_list {
	margin: auto;
}
</style>
</head>
<body>
	<div>
		<div>GNB</div>
		<div>
			커뮤니티
			<div>
				<input type="button" value="공지 사항">
				<input type="button" value="자유">
				<input type="button" value="팁">
				<input type="button" value="질문">
				<input type="button" value="민원">
			</div>
		</div>
		<div>
			<select name="" id="">
				<option value="검색옵션">검색옵션</option>
			</select>
			<input type="button" value="검색">
			<input type="text">
			<a href="#">NEW / OLD / MAX(COUNT)</a>
		</div>
		<div>
			<table id="table_list">
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
				</tr>
				<tr>
					<td>공지사항</td>
					<td>집에못가</td>
					<td>Admin</td>
					<td>1111</td>
				</tr>
				<tr>
					<td colspan="4">
						<a href="#">1 2 3 4 5 </a>
						<input type="button" value="등록" onclick="location.href = '/community/toWriteForm?boardType=공지'">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>