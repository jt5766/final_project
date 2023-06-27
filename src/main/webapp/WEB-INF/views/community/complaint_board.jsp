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
	width: 100%;
}

#currentPage {
	background-color: #ca9372;
	color: white;
}

.list_tr {
	border-top: 0.5px solid black;
	border-bottom: 0.5px solid black;
}

.page-link {
	background-color: #F5EFE7;
	color: #4D4D4D;
}

.page-link:focus {
	box-shadow: 0 0 0 0.3rem #ca9372;
}

#search-box {
	display: flex;
	align-items: center;
}

#search-box>* {
	margin-left: 5px;
}

select[name=searchCode] {
	flex: 0 0 0;
}

input[name=searchQuery] {
	flex: 1 0 0;
}

input[name=sordCode] {
	flex: 0 0 0;
}

.sortLabel {
	flex: 4rem 0 0;
}

.a_title {
	text-decoration: none;
	color: #000;
}

.a_title:hover {
	text-decoration: underline;
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
	<div class="container-xl position-relative p-0">
		<div class="row">
			<div class="col">
				<form action="/community/search" method="post" style="padding: 20px; text-align: right;" id="search-box">
					<input type="hidden" name="typeCode" value="${categoryType.code}">
					<select name="searchCode">
						<c:forEach var="i" items="${search}">
							<option value="${i.code}">${i.name}</option>
						</c:forEach>
					</select>
					<input type="text" name="searchQuery" required placeholder="검색어를 입력하세요">
					<c:forEach var="i" items="${sort}" varStatus="status">
						<input type="radio" name="sortCode" value="${i.code}" <c:if test ="${status.index == 0}">checked</c:if>>
						${i.name}
					</c:forEach>
					<button style="border-style: none;">
						<i class="bi bi-search"></i>
					</button>
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
						<tr class="list_tr">
							<td>${i.seq}</td>
							<td>
								<a href="/community/toComplaintView?seq=${i.seq}&board_type=${categoryType.code}" class="a_title"> ${i.title} </a>
							</td>
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
												<li class="page-items"><a class="page-link" href="/community/toBoard?code=${categoryType.code}&currentPage=${i}" <c:if test="${cp == i}">
														id="currentPage"
													</c:if>>${i}</a></li>
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