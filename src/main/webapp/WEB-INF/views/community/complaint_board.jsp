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
#table_list {
	margin: auto;
	width: 100%;
}

#currentPage {
	background-color: #ca9372;
	color: white;
}

.list_tr {
	border-top: 0.1px solid gray;
	border-bottom: 0.1px solid gray;
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

td {
	padding: 5px;
}

.td_title {
	text-align: left;
}

.th_title, .td_title {
	width: 70%;
}

th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px;
}

.list_tr:hover {
	background-color: #ffffff;
}

.td_title:hover {
	cursor: pointer;
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
		<form action="/community/search" method="post" class="row" id="search-box">
			<div class="col-12 col-md-1">
				<input type="hidden" name="typeCode" value="${categoryType.code}">
				<select name="searchCode">
					<c:forEach var="i" items="${search}">
						<option value="${i.code}">${i.name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="col-6 col-md-8">
				<input type="text" name="searchQuery" required placeholder="검색어를 입력하세요">
			</div>
			<div class="col-6 col-md-3">
				<c:forEach var="i" items="${sort}" varStatus="status">
					<input type="radio" name="sortCode" value="${i.code}" <c:if test ="${status.index == 0}">checked</c:if>>
								${i.name}
							</c:forEach>
				<button style="border-style: none;">
					<i class="bi bi-search"></i>
				</button>
			</div>
		</form>
		<div class="row">
			<div class="col">
				<table id="table_list">
					<tr>
						<th>글 번호</th>
						<th class="th_title">제목</th>
						<th>구분</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
					<c:forEach var="i" items="${boardList}">
						<tr class="list_tr">
							<td>${i.seq}</td>
							<td class="td_title" onclick="location.href = '/community/toComplaintView?seq=${i.seq}&board_type=${categoryType.code}'">
								<a href="/community/toComplaintView?seq=${i.seq}&board_type=${categoryType.code}" class="a_title"> ${i.title} </a>
							</td>
							<td>${i.complaint_type}</td>
							<td>${i.writer}</td>
							<td>${i.formed_date}</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="5" align="center">
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
							<input type="button" id="toWrite" value="글쓰기">
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
	<script>
		$("#toWrite").on("click", () => {
		  	if("${sessionScope.code}" == "") {
		  	    alert("로그인 시 이용 가능한 서비스입니다.");
		  	} else {
		  	  location.href = '/community/toWriteForm?code=${categoryType.code}';
		  	}
		});
		$(".td_title").mouseover((e)=> {
		    $(e.target).find(".a_title").eq(0).css("text-decoration", "underline");
		});
		$(".td_title").mouseout((e)=> {
		    $(e.target).find(".a_title").eq(0).css("text-decoration", "");
		});
	</script>
</body>
</html>