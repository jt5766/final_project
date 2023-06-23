<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Catrgory</title>
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
	<div class="container-xl bg-secondary position-relative">
		<div class="row justify-content-md-center">
			<div class="col-md-12">
				<table class="table table-light table-bordered border-secondary table-striped">
					<thead>
						<tr class="btn_group" role="group">
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="EMAIL_TYPE" autocomplete="off" onclick="selectType(this);">
								<label class="btn btn-outline-primary btn-sm w-100" for="EMAIL_TYPE">이메일</label>
							</th>
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="GENRE_TYPE" autocomplete="off" onclick="selectType(this);">
								<label class="btn btn-outline-primary btn-sm w-100" for="GENRE_TYPE">장르</label>
							</th>
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="EMPTY1" autocomplete="off" disabled="disabled">
								<label class="btn btn-outline-primary btn-sm w-100" for="EMPTY1">&nbsp;</label>
							</th>
						</tr>
						<tr class="btn_group" role="group">
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="GALLERY_CARDS_SORT" autocomplete="off" onclick="selectType(this);">
								<label class="btn btn-outline-primary btn-sm w-100" for="GALLERY_CARDS_SORT">정렬(갤러리-카드)</label>
							</th>
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="GALLERY_CONTENTS_SORT" autocomplete="off" onclick="selectType(this);">
								<label class="btn btn-outline-primary btn-sm w-100" for="GALLERY_CONTENTS_SORT">정렬(갤러리-)</label>
							</th>
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="COMMUNITY_SORT" autocomplete="off" onclick="selectType(this);">
								<label class="btn btn-outline-primary btn-sm w-100" for="COMMUNITY_SORT">정렬(커뮤니티)</label>
							</th>
						</tr>
						<tr class="btn_group" role="group">
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="GALLERY_CARDS_SEARCH" autocomplete="off" onclick="selectType(this);">
								<label class="btn btn-outline-primary btn-sm w-100" for="GALLERY_CARDS_SEARCH">검색(갤러리-카드)</label>
							</th>
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="EMPTY2" autocomplete="off" disabled="disabled">
								<label class="btn btn-outline-primary btn-sm w-100" for="EMPTY2">&nbsp;</label>
							</th>
							<th width="33%">
								<input type="radio" class="btn-check" name="radio_type" id="COMMUNITY_SEARCH" autocomplete="off" onclick="selectType(this);">
								<label class="btn btn-outline-primary btn-sm w-100" for="COMMUNITY_SEARCH">검색(커뮤니티)</label>
							</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<tr>
							<td class="m-0 p-0" colspan="5">
								<form action="/admin/update_category">
									<table class="table table-secondary border-secondary table-striped  m-0 p-0">
										<thead>
											<tr>
												<td width="33%">
													<button type="button" class="btn btn-light btn-outline-secondary btn-sm w-100" id="btn_addRow">Row 추가</button>
												</td>
												<td width="33%">
													<button type="submit" class="btn btn-light btn-outline-secondary btn-sm w-100" id="btn_submit">적용</button>
												</td>
												<td width="33%">
													<button type="button" class="btn btn-light btn-outline-secondary btn-sm w-100" id="btn_cancle">취소</button>
												</td>
											</tr>
										</thead>
										<tbody class="table-group-divider">
											<tr>
												<td class="m-0 p-0" colspan="5">
													<table class="table table-striped table-hove m-0 p-0" id="table">
														<thead align="center">
															<tr>
																<th>SEQ</th>
																<th>CODE</th>
																<th>NAME</th>
																<th>YN</th>
																<th></th>
															</tr>
														</thead>
														<tbody id="tbody_data">
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
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
		// submit용 table Name 히든 tag
		var hidden_table_name = $("<input>", {
			"type" : "hidden",
			"name" : "tableName"
		});
		$("form").append(hidden_table_name);

		// row 추가용 변수
		var max_sort = 0;
		var max_code = 0;

		// 비동기로 데이터 가져오는 함수
		function selectType (target) {
			// tableName & 히든 tag 값 수전
			let tableName = $(target).attr("id");
			$(hidden_table_name).val(tableName);

			// TABLE 내용 변경을 위한 비우기.
			$("#tbody_data").html("");

			// row 추가용 변수 초기화
			max_sort = 0;
			max_code = 0;

			// 비동기 실행
			$.ajax({
				url : "/admin/category/type",
				data : {
					tableName : tableName
				}
			}).done(function (data) {
				data.forEach(function (el, index) {
					// max row 저장
					if (max_sort < el.sort)
						max_sort = el.sort;
					if (max_code < el.code)
						max_code = el.code;

					// tbody 생성 함수 호출
					createRow(el.sort, el.code, el.name, el.yn);
				});
			});
		}
		// table row 생성 함수
		function createRow (sort, code, name, yn) {
			let tr = $("<tr>").addClass("ui-sortable-handle");
			let td = $("<td>");
			let inp = $("<input>", {
				type : "text"
			}).addClass("w-100");

			let inp_sort = $(inp.clone()).val(sort).attr({
				"name" : "sort",
				"readonly" : "readonly"
			});
			let inp_code = $(inp.clone()).val(code).attr({
				"name" : "code",
				"readonly" : "readonly"
			});
			let inp_name = $(inp.clone()).val(name).attr({
				"name" : "name"
			}).prop("required", true);

			let sel_yn = $("<select>").addClass("w-100").attr({
				"name" : "yn"
			});

			let op_y = $("<option>").val("Y").text("Y");
			let op_n = $("<option>").val("N").text("N");
			sel_yn.append(op_y, op_n);
			sel_yn.val(yn).prop("selected", true);

			tr.append($(td.clone()).append(inp_sort), $(td.clone()).append(inp_code), $(td.clone()).append(inp_name), $(td.clone()).append(sel_yn), $(td.clone()));

			$("#tbody_data").append(tr);
		}
		// row 추가 이벤트 할당
		$("#btn_addRow").on("click", function ( ) {
			createRow(max_sort = max_sort + 1, max_code = max_code + 1, "", "Y");
		});
		// 취소 이벤트
		$("#btn_cancle").on("click", function ( ) {
			let btns = $(".btn-check");

			// checked된 btn 클릭			
			for (var i = 0; i < btns.length; i++) {
				if ($(btns[i]).prop("checked")) {
					return btn_click($(btns[i]).attr("id"));
				}
			}
		});
		// row 드래그어블
		$("#tbody_data").sortable({
			items : '.ui-sortable-handle',
			dropOnEmpty : false,
			start : function (G, ui) {
				ui.item.addClass("select");
			},
			stop : function (G, ui) {
				ui.item.removeClass("select");

				$(this).find("tr").each(function (GFG) {
					if (GFG >= 0)
						$(this).find("input").eq(0).val(GFG + 1);
				});
			}
		}).disableSelection();
		// btn_group_click 함수
		function btn_click (btn_name) {
			$($("#" + btn_name + "")).trigger("click");
		}
	</script>

	<script type="text/javascript">
		$(function ( ) {
			btn_click($($(".container-xl .btn-check")[0]).attr("id"));
		});
	</script>
</body>
</html>