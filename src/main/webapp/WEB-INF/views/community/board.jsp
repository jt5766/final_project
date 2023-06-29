<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<!-- 공통 script & css -->
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
<style>
.list_tr {
	border-top: 0.1px solid gray;
	border-bottom: 0.1px solid gray;
}

#currentPage {
	background-color: #ca9372;
	color: white;
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

th {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px;
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

.title_td {
	text-align: left;
}

th>* {
	text-align: center;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 10px;
}

.th_other,
.td_other,
.th_title {
	text-align: center;
}

.list_tr:hover {
	background-color: #ffffff;
}

.title_td:hover {
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
			<div class="col-6 col-md-1">
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
			<div class="col-12 col-md-3">
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
				<table id="table_list" style="width: 100%;">
					<thead>
						<tr id="info_tr">
							<th class="th_other" width="10%">글 번호</th>
							<th class="th_title" width="60%">제목</th>
							<th class="th_other" width="10%">조회수</th>
							<th class="th_other" width="10%">작성자</th>
							<th class="th_other" width="10%">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${boardList}">
							<tr class="list_tr">
								<td class="td_other">${i.seq}</td>
								<td class="title_td" onclick="location.href = '/community/toBoardView?seq=${i.seq}&board_type=${categoryType.code}'">
									<a href="/community/toBoardView?seq=${i.seq}&board_type=${categoryType.code}" class="a_title"> ${i.title} </a>
								</td>
								<td class="td_other">${i.total_count}</td>
								<td class="td_other">${i.writer}</td>
								<td class="td_other">${i.formed_date}</td>
							</tr>
						</c:forEach>
						<tr>
							<td colspan="5" align="center">
								<nav>
									<ul class="pagination justify-content-center m-0">
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
								<input type="button" value="글쓰기" id="toWrite">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
	<script>
		$("#toWrite").on("click", (e) => {
		   	if("${sessionScope.code}" == "") {
		   	    alert("로그인 후 이용 가능한 서비스입니다.");
		   	} else {
		   	 	location.href = '/community/toWriteForm?code=${categoryType.code}'
		   	}
		});
		$(".title_td").mouseover((e)=> {
		    $(e.target).find(".a_title").eq(0).css("text-decoration", "underline");
		});
		$(".title_td").mouseout((e)=> {
		    $(e.target).find(".a_title").eq(0).css("text-decoration", "");
		});
	</script>
</body>
</html>