<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Join</title>
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
							<th width="10%"><input type="radio" class="btn-check" name="options" id="code" autocomplete="off" checked> <label class="btn btn-outline-primary w-100 btn-sm" for="code">CODE</label></th>
							<th width="10%"><input type="radio" class="btn-check" name="options" id="email" autocomplete="off"> <label class="btn btn-outline-primary w-100 btn-sm" for="email">EMAIL</label></th>
							<th width="10%"><input type="radio" class="btn-check" name="options" id="nickname" autocomplete="off"> <label class="btn btn-outline-primary w-100 btn-sm" for="nickname">NICKNAME</label></th>
							<th width="70%"><input type="text" class="w-100" id="keyword" onkeyup="search();"></th>
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
											<th>FILE</th>
											<th>NAME</th>
											<th>TEL</th>
											<th>승인</th>
											<th>거절</th>
										</tr>
									</thead>
									<tbody id="tbody_data">
										<c:forEach items="${list}" var="item" varStatus="status">
											<tr>
												<td class="col_code" align="center">${item.code}</td>
												<td class="col_email" align="center">${item.email}</td>
												<td class="col_nickname" align="center">${item.nickname}</td>
												<td class="col_file" align="center">
													<button class="btn btn-link btn-collapse btn-light btn-outline-secondary w-100 btn-sm" data-bs-toggle="collapse" data-bs-target="#${item.file_url}" aria-expanded="false" aria-controls="${item.file_url}">파일</button>
												</td>
												<td align="center">
													<input type="text" class="w-100 col_name" placeholder="법인명 OR 이름" required="required">
												</td>
												<td align="center">
													<input type="text" class="w-100 col_tel" placeholder="전화번호">
												</td>
												<td align="center">
													<button class="btn btn-light btn-outline-secondary w-100 btn-sm" onclick="approve_member(${status.index});">승인</button>
												</td>
												<td align="center">
													<button class="btn btn-light btn-outline-secondary w-100 btn-sm" onclick="reject_member(${status.index});">거절</button>
												</td>
											</tr>
											<tr>
												<td class="p-0" colspan="8">
													<div id="${item.file_url}" class="collapse">
														<img alt="" src="${item.file_url}">
													</div>
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
	<script type="text/javascript">
		// 검색
		function search() {
			let filter, input, table, tr, td, i, txtValue;
			filter = ".col_" + $("input[name=options]:checked").attr("id");
			input = $("#keyword").val().toUpperCase();
			table = $("#table");
			tr = $("#tbody_data tr");
			for (i = 0 ; i < tr.length ; ) {
				td = $(tr[i]).find(filter);
				if (td) {
					txtValue = $(td).text();
					if (txtValue.toUpperCase().indexOf(input) > -1) {
						tr[i].style.display = "";
						tr[i + 1].style.display = "";
					} else {
						tr[i].style.display = "none";
						tr[i + 1].style.display = "none";
					}
				}
				i = i + 2;
			}
		};
	
		// 서류 확인
		function file_open(path) {
			
		}
	
		// 승인
		function approve_member(index) {
			let row = $("#tbody_data>tr:nth-child(" + (index * 2 + 1) + ")");
			
			let form = $(".hidden_form").attr("action","/admin/join/approve");
			let seq = $("<input>", {"type":"hidden", "name":"code"}).val(row.find(".col_code").text());
			let name = $("<input>", {"type":"hidden", "name":"name"}).val(row.find(".col_name").val());
			let tel = $("<input>", {"type":"hidden", "name":"tel"}).val(row.find(".col_tel").val());
			
			form.append(seq, name, tel);
			
			form.submit();
		}
		
		// 거절
		function reject_member(index) {
			let row = $("#tbody_data>tr:nth-child(" + (index * 2 + 1) + ")");
			
			let form = $(".hidden_form").attr("action","/admin/join/reject");
			let seq = $("<input>", {"type":"hidden", "name":"code"}).val(row.find(".col_code").text());
			
			form.append(seq);
			
			form.submit();
		}
	</script>
</body>
</html>