<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Gallery</title>
<!-- 공통 script & css -->
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- GNB & LNB -->
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="adminpage" />
		<c:param name="btnNum" value="${pagecode}" />
	</c:import>
	<!-- CONTENTS -->
	<div class="container-xl bg-secondary position-relative p-0">
		<div class="row justify-content-md-center">
			<div class="col-md-12">
				<table class="table table-light table-bordered border-secondary table-striped m-0">
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
								<input type="text" class="w-100" id="keyword">
							</th>
							<th width="10%">
								<button class="btn btn-light btn-outline-secondary w-100 btn-sm" id="btn_search">검색</button>
							</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<td class="m-0 p-0" colspan="4">
								<table class="table table-striped table-hove m-0 p-0" id="table">
									<thead align="center">
										<tr>
											<th>TYPE</th>
											<th>TITLE</th>
											<th>WRITER</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody id="tbody_data"></tbody>
								</table>
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
	<script type="text/javascript">
		$("#btn_search").on("click", function ( ) {
			let type_value = $("#type").val();
			let search_value = $("#search").val();
			let keyword_value = $("#keyword").val();
			$.ajax({
				url : "/admin/gallery/search",
				data : {
					type : type_value,
					search : search_value,
					keyword : keyword_value,
				}
			}).done(function (data) {
				createRow(data);
			});
		});

		function createRow (data) {
			$("#keyword").val("");

			let tbody = $("#tbody_data");
			tbody.html("");

			data.forEach(function (element, index) {
				let tr = $("<tr>");
				let td_type = $("<td>").text(element.typeName).attr("align", "center");
				let td_title = $("<td>").text(element.title).attr("align", "center");
				let td_writer = $("<td>").text(element.nickname).attr("align", "center");
				let td_btn = $("<td>").append($("<button>").addClass("btn btn-light btn-outline-secondary w-100 btn-sm").text("삭제")).click(function ( ) {
					location.href = "/admin/gallery/delete?type=" + element.type + "&seq=" + element.seq;
				}).attr("align", "center");

				tbody.append(tr);
				tr.append(td_type, td_title, td_writer, td_btn);
			});
		}
	</script>
</body>
</html>