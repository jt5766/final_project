<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Catrgory</title>
<!-- JQuery CDN -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap CDN : CSS & JS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container-xl">
		<div class="row">
			<div class="col-md-3">
				<div class="row">
					<input type="button" value="이메일" onclick="selectType(this, 'EMAIL_TYPE');">
				</div>
				<div class="row">
					<input type="button" value="장르" onclick="selectType(this, 'GENRE_TYPE');">
				</div>
				<div class="row">
					<input type="button" value="갤러리 - 검색" onclick="selectType(this, 'GALLERY_CARDS_SORT');">
				</div>
				<div class="row">
					<input type="button" value="갤러리 - 정렬" onclick="selectType(this, 'GALLERY_CARDS_SEARCH');">
				</div>
				<div class="row">
					<input type="button" value="갤러리 - IN - 정렬" onclick="selectType(this, 'GALLERY_CONTENTS_SORT');">
				</div>
				<div class="row">
					<input type="button" value="커뮤니티 - 검색" onclick="selectType(this, 'COMMUNITY_SORT');">
				</div>
				<div class="row">
					<input type="button" value="커뮤니티 - 정렬" onclick="selectType(this, 'COMMUNITY_SEARCH');">
				</div>
				<div class="row">
					<input type="button" value="기타1" onclick="selectType();">
				</div>
				<div class="row">
					<input type="button" value="기타2" onclick="selectType();">
				</div>
			</div>
			<div class="col-md-9">
				<div class="row title">?????????</div>
				<div class="row table">
					<table border="1px">
						<thead>
							<tr>
								<th>CODE</th>
								<th>ORDER</th>
								<th>NAME</th>
								<th>YN</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td><select>
										<option selected>사용</option>
										<option>사용 안함</option>
								</select></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-md-3">
						<input type="button" value="row 추가">
					</div>
					<div class="col-md-3">
						<input type="button" value="적용">
					</div>
					<div class="col-md-3">
						<input type="button" value="취소" onclick="location.href='#'">
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function selectType(target, tableName) {
			// TITLE 내용 변경
			$(".title").text($(target).attr("value"));
			// TABLE 내용 변경
			$("tbody").html("");
			$.ajax({
				url : "/admin/category/type",
				data : {
					tableName : tableName
				},
			}).done(function(data) {
				data.forEach(function(el, index) {
					let tr = $("<tr>");
					console.log(el.code);
					let code = $("<td>").text(el.code);
					let order = $("<td>").text(el.sort);
					let name = $("<td>").text(el.name);
					let yn = $("<td>").text(el.yn);
					tr.append(code, order, name, yn);
					$("tbody").append(tr);
				});
			});
		}
	</script>
</body>
</html>