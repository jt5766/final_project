<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
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
	width: 80%;
}

#p_boardName {
	margin: 0px;
}
</style>
</head>
<body>
	<div>
		<div>GNB</div>
		<div>
			<div>
				<p id="p_boardName"></p>
			</div>
			<div>
				<input type="button" id="1001" value="공지 사항" onclick="location.href = '/community/toBoard?code=1001'">
				<input type="button" id="1002" value="자유" onclick="location.href = '/community/toBoard?code=1002'">
				<input type="button" id="1003" value="팁" onclick="location.href = '/community/toBoard?code=1003'">
				<input type="button" id="1004" value="질문" onclick="location.href = '/community/toBoard?code=1004'">
				<input type="button" id="1005" value="민원" onclick="location.href = '/community/toBoard?code=1005'">
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
				<c:forEach var="i" items="${boardList}">
					<tr onclick="location.href = '/community/toBoardView?seq=${i.seq}&board_type=${categoryType.code}'">
						<td>${i.seq}</td>
						<td>${i.title}</td>
						<td>${i.writer}</td>
						<td>${i.total_count}</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">
						<a href="#">1 2 3 4 5</a>
						<input type="button" value="등록" onclick="location.href = '/community/toWriteForm?code=${categoryType.code}'">
					</td>
				</tr>
			</table>
		</div>
	</div>
	
	<script>
		$("#p_boardName").text($("#${categoryType.code}").val() + " 게시판");
	</script>
</body>
</html>