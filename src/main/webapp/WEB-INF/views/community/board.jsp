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

.search-box {
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

.th_other, .td_other, .th_title {
	text-align: center;
}

.list_tr:hover {
	background-color: #ffffff;
}

.title_td:hover {
	cursor: pointer;
}

.common-button {
	display: inline-block;
	min-width: 5rem;
	background-color: #ca9372;
	color: white;
	border-radius: 5px;
	margin: 5px;
	border: none;
	max-height: 35px;
}

.search-box>* {
	margin-left: 5px;
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
		<form action="/community/search">
			<!-- <input type="hidden" name="tableName" value=""> -->
			<input type="hidden" name="typeCode" value="${categoryType.code}">
			<div class="row">
				<div class="col-12 search-box">
					<select name="searchCode">
						<c:forEach items="${search}" var="i">
							<option value="${i.code}">${i.name}</option>
						</c:forEach>
					</select>
					<input type="text" name="searchQuery" required placeholder="검색어를 입력하세요" id="searchTxt">
					<c:forEach items="${sort}" var="i" varStatus="status">
						<input class="d-none d-md-block" type="radio" name="sortCode" value="${i.code}" id="sort1-${i.code}" <c:if test="${status.index == 0}">checked</c:if>>
						<label class="d-none d-md-block" class="sortLabel" for="sort1-${i.code}">${i.name}</label>
					</c:forEach>
					<div class="vr mx-2 d-none d-md-block"></div>
					<button type="submit" class="common-button d-none d-md-block">
						<i class="bi bi-search"></i>
					</button>
				</div>
				<div class="col-12 d-md-none search-box">
					<c:forEach items="${sort}" var="i" varStatus="status">
						<input class="d-block d-md-none" type="radio" name="sortCode" value="${i.code}" id="sort2-${i.code}" <c:if test="${status.index == 0}">checked</c:if>>
						<label class="d-block d-md-none" class="sortLabel" for="sort2-${i.code}">${i.name}</label>
					</c:forEach>
					<div class="vr mx-2 d-block d-md-none"></div>
					<button type="submit" class="common-button d-block d-md-none ms-auto">
						<i class="bi bi-search"></i>
					</button>
				</div>
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
							<td></td>
							<td colspan="3" align="center">
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
							</td>
							<td>
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
		if("${categoryType.code}" == 1001) {
		   	$("#toWrite").hide();
		   	if("${sessionScope.memberType}" == 9999){
		   	 	$("#toWrite").toggle();   
		   	}
		}
		
		$("#toWrite").on("click", (e) => {
		   	if("${sessionScope.code}" == "") {
		   	    alert("로그인 후 이용 가능한 서비스입니다.");
		   	    location.href = '/member/loginForm';
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