<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
<style>
* {
	text-align: center;
}

#table_list {
	margin: auto;
	width: 80%;
}

.list_tr:hover {
	background-color: gray;
}
</style>
</head>
<body>
	<!-- GNB & LNB -->
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="community" />
		<c:param name="btnNum" value="${categoryType.code}" />
	</c:import>
	<!-- CONTENTS -->
	<div class="container-xl bg-secondary position-relative p-0">
		<div class="row">
			<div class="col">
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
					${i.name} <input type="radio" name="sortCode" value="${i.code}" <c:if test ="${status.index == 0}">checked</c:if>>
					</c:forEach>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<table id="table_list">
					<tr>
						<th>글 번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>구분</th>
					</tr>
					<c:forEach var="i" items="${boardList}">
						<tr class="list_tr" onclick="location.href = '/community/toComplaintView?seq=${i.seq}&board_type=${categoryType.code}'">
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
							<nav>
								<ul class="pagination justify-content-center">
									<c:forEach items="${pageNavi}" var="i" varStatus="status">
										<c:choose>
											<c:when test="${i == '<'}">
												<li class="page-items"><a class="page-link" href="/community/toBoard?code=${categoryType.code}&currentPage=${pageNavi[status.index+1]-1}">${i}</a></li>
											</c:when>
											<c:when test="${i == '>'}">
												<li class="page-items"><a class="page-link" href="/community/toBoard?code=${categoryType.code}&currentPage=${pageNavi[status.index-1]+1}">${i}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-items"><a class="page-link" href="/community/toBoard?code=${categoryType.code}&currentPage=${i}">${i}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</ul>
							</nav>
						</td>
						<td>
							<input type="button" value="등록" onclick="location.href = '/community/toWriteForm?code=${categoryType.code}'">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
</body>
</html>