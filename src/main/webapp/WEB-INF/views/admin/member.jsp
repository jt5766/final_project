<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Member</title>
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
	<div class="container-xl position-relative p-0">
		<div class="row justify-content-md-center">
			<div class="col-md-12">
				<form class="hidden_form"></form>
				<table class="table table-light table-bordered border-secondary table-striped m-0">
					<thead>
						<tr>
							<th width="10%">
								<input type="radio" class="btn-check" name="options" id="code" autocomplete="off" checked>
								<label class="btn btn-outline-primary w-100 btn-sm" for="code">CODE</label>
							</th>
							<th width="10%">
								<input type="radio" class="btn-check" name="options" id="email" autocomplete="off">
								<label class="btn btn-outline-primary w-100 btn-sm" for="email">EMAIL</label>
							</th>
							<th width="10%">
								<input type="radio" class="btn-check" name="options" id="nickname" autocomplete="off">
								<label class="btn btn-outline-primary w-100 btn-sm" for="nickname">NICKNAME</label>
							</th>
							<th width="70%">
								<input type="text" class="w-100" id="keyword" onkeyup="search();">
							</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<td class="m-0 p-0" colspan="8">
								<table class="table table-striped table-hove m-0 p-0" id="table">
									<thead align="center">
										<tr>
											<th>CODE</th>
											<th>EMAIL</th>
											<th>NICKNAME</th>
											<th>MEMBER_TYPE</th>
											<th>STOP_DATE</th>
											<th>적용</th>
										</tr>
									</thead>
									<tbody id="tbody_data">
										<c:forEach items="${list}" var="item" varStatus="status">
											<tr>
												<td class="col_code" align="center">${item.code}</td>
												<td class="col_email" align="center">${item.email}</td>
												<td class="col_nickname" align="center">${item.nickname}</td>
												<td class="col_name" align="center">${item.name}</td>
												<td class="col_stop_date">
													<select class="w-100" name="stop_date" id="select_stop_date">
														<option value="1">1일</option>
														<option value="7">7일</option>
														<option value="30">30일</option>
														<option value="100">100일</option>
														<option value="365">1년</option>
														<option value="36500">100년</option>
													</select>
												</td>
												<td align="center">
													<button class="btn btn-light btn-outline-secondary w-100 btn-sm" onclick="ban_member(${status.index});">적용</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
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
		// 검색
		function search() {
			let filter, input, table, tr, td, i, txtValue;
			filter = ".col_" + $("input[name=options]:checked").attr("id");
			input = $("#keyword").val().toUpperCase();
			table = $("#table");
			tr = $("#tbody_data tr");
			for (i = 0 ; i < tr.length ; i++) {
				td = $(tr[i]).find(filter);
				if (td) {
					txtValue = $(td).text();
					if (txtValue.toUpperCase().indexOf(input) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		};
		
		// 밴 적용
		function ban_member(index) {
			let row = $("#tbody_data>tr:nth-child(" + (index + 1) + ")");
			
			let form = $(".hidden_form").attr("action","/admin/member/ban");
			let seq = $("<input>", {"type":"hidden", "name":"code"}).val(row.find(".col_code").text());
			let ban_day = $("<input>", {"type":"hidden", "name":"ban_day"}).val(row.find("#select_stop_date").val());
			
			form.append(seq, ban_day);
			
			form.submit();
		}
	</script>
</body>
</html>