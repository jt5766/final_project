<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Community</title>
<!-- 공통 script -->
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:import url="${path}/resources/js/scripts.jsp" />
</head>
<body>
	<div class="container-xl">
		<div class="row justify-content-md-center">
			<div class="col-md-12">
				<form class="hidden_form"></form>
				<table class="table table-light table-bordered border-secondary table-striped">
					<thead>
						<tr>
							<th width="10%">
								<select class="form-select form-select-sm" id="type">
									<c:forEach var="item" items="${typeList}">
										<option value="${item.code}">${item.name}</option>
									</c:forEach>
								</select>
							</th>
							<th width="10%">
								<select class="form-select form-select-sm" id="search">
									<c:forEach var="item" items="${searchList}">
										<option value="${item.code}">${item.name}</option>
									</c:forEach>
								</select>
							</th>
							<th width="70%">
								<input type="text" class="w-100" id="keyword"">
							</th>
							<th width="10%">
								<button class="btn btn-light btn-outline-secondary w-100 btn-sm" id="search">검색</button>
							</th>
						</tr>
					</thead>
					
				</table>
			</div>
		</div>
	</div>
</body>
</html>