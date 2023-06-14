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
	<div class="container-xl mt-4">
		<div class="row justify-content-md-center">
			<div class="col-md-8" id="table"></div>
		</div>
	</div>
	<script type="text/javascript">
		// 승인 & 거절 버튼 형식
		let yesIcon

		// 테이블 컬럼
		const tableColumns = [ {
			title : "CODE",
			field : "code",
			hozAlign : "center"
		}, {
			title : "EMAIL",
			field : "email",
			hozAlign : "center",
		}, {
			title : "NICKNAME",
			field : "nickname",
			hozAlign : "center"
		}, {
			title : "FILE",
			field : "file_url",
			hozAlign : "center"
		}, {
			title : "NANE",
			field : "name",
			hozAlign : "center"
		}, {
			title : "TEL",
			field : "tel",
			hozAlign : "center"
		}, {
			title : "승인",
			field : "",
			hozAlign : "center",
			formatter:"buttonTick",
			cellClick:function(e, cell) {
				alert("OK");
			}
		}, {
			title : "거절",
			field : "",
			hozAlign : "center",
			formatter : "buttonCross",
			cellClick:function(e, cell) {
				alert("NO");
			}
		}, ];

		// 테이블 데이터
		const tableData = ${list};

		// 테이블 생성
		let table = new Tabulator("#table", {
			layout : "fitColumns",
			columns : tableColumns,
			data : tableData,
		});
	</script>
</body>
</html>