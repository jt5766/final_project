<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
<!-- 공통 script & css -->
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
</style>
</head>

<body>
	<!-- GNB & LNB -->
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="community" />
		<c:param name="btnNum" value="${boardCode}" />
	</c:import>
	<!-- CONTENTS -->
	<div class="container-xl position-relative p-0">
		<div class="row">
			<div class="col">
				<form action="/community/toUpdate" method="post">
					<input type="hidden" name="seq" value="${info.seq}">
					<input type="hidden" name="board_type" value="${info.board_type}">
					<input type="hidden" name="seq" value="${info.seq}">
					<input type="hidden" name="title" value="${info.title}">
					<input type="hidden" name="writer" value="${info.writer}">
					<input type="hidden" name="write_date" value="${info.write_date}">
					<input type="hidden" name="write_date" value="${info.complaint_type}">
					<div style="display: flex; font-size: xx-large; margin-bottom: 25px;">
						<div style="flex:1;">${info.title}</div>
						<div style="flex: 1; text-align: right;">${info.complaint_type}</div>
					</div>
					<div>
						<textarea name="txt" id="textarea_contents" cols="30" rows="10" readonly>${info.txt}</textarea>
					</div>
					<div style="text-align: right; margin-top: 25px;">
						<div>작성자: ${info.writer}</div>
						<div style="font-size: small;">${info.full_date}</div>
					</div>
					<div style="text-align: left;">
						<input type="button" value="돌아가기" onclick="location.href = '/community/toBoard?code=${info.board_type}&currentPage=1'">
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<c:choose>
					<c:when test="${sessionScope.memberType == 9999}">
						<form action="/community/insertProcess" style="padding: 25px;">
							<div style="display: flex;">
								<div style="flex: 6;">${sessionScope.nickName}</div>
								<div style="flex: 1;">
									<input type="hidden" name="seq" value="${info.seq}">
								</div>
							</div>
							<div style='display: flex;'>
								<textarea style="flex: 6; resize: none;" placeholder="처리내용 작성" name="process"></textarea>
								<input type="submit" value="처리 등록" style="flex: 1;">
							</div>
						</form>
					</c:when>
				</c:choose>
				<hr>
				<c:choose>
					<c:when test="${info.process == null}">
						<div style="font-size: xx-large;">관리자가 처리중입니다. 잠시만 기다려주세요~</div>
					</c:when>
					<c:otherwise>
						<div>
							<div style="font-size: xx-large;">관리자: ${info.process}</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
	<script>
	console.log("${sessionScope.memberType}");
	$("#textarea_contents").summernote({
	    height : 400,
	    toolbar : [],
	    disableDragAndDrop : true,
	    shortcuts : false,
	    tabDisable : true
	});
	$('.note-statusbar').hide();
	$("#textarea_contents").summernote("disable");
    </script>
</body>

</html>