<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${categoryType.name}</title>
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
				<c:forEach var="i" items="${boardType}">				
					<input type="button" id="${i.code}" value="${i.name}" onclick="location.href = '/community/toBoard?code=${i.code}&currentPage=1'">
				</c:forEach>
			</div>
		</div>
		<div>
			<form action="/community/searchComplaint">
				<input type="hidden" name="typeCode" value="${categoryType.code}">
				<select name="searchCode">
					<c:forEach var="i" items="${search}">
						<option value="${i.code}">${i.name}</option>
					</c:forEach>
				</select>
				<input type="submit" value="검색">
				<input type="text" name="searchQuery" required>
				<c:forEach var="i" items="${sort}" varStatus="status">
					${i.name} <input type="radio" name="sortCode" value="${i.code}"
					<c:if test ="${status.index == 0}">checked</c:if>>
				</c:forEach>
			</form>
		</div>
		<div>
			<table id="table_list">
				<tr>
					<th>글 번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>구분</th>
				</tr>
				<c:forEach var="i" items="${boardList}">
					<tr onclick="location.href = '/community/toComplaintView?seq=${i.seq}&board_type=${categoryType.code}'">
						<td>${i.seq}</td>
						<td>${i.title}</td>
						<td>${i.writer}</td>
						<td>${i.write_date}</td>
						<td>${i.complaint_type}</td>
					</tr>
				</c:forEach>
				<tr>
					<td></td>
					<td colspan="3">
						<c:forEach var="i" items="${pageNavi}" varStatus="status">
							<c:choose>
								<c:when test="${i == '<'}">
									<a href="/community/toBoard?code=${categoryType.code}&currentPage=${pageNavi[status.index+1]-1}">${i}</a>	
								</c:when>
								<c:when test="${i == '>'}">
									<a href="/community/toBoard?code=${categoryType.code}&currentPage=${pageNavi[status.index-1]+1}">${i}</a>						
								</c:when>
								<c:otherwise>
									<a href="/community/toBoard?code=${categoryType.code}&currentPage=${i}">${i}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</td>
					<td>
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