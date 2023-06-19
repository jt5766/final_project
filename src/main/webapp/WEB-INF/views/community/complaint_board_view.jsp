<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
* {
	box-sizing: border-box;
	border: 1px solid black;
	text-align: center;
}

#div_info {
	display: flex;
}

#div_info>div {
	flex: 1;
}
</style>
</head>

<body>
	<div>
		<div>GNB</div>
		<form action="/community/toUpdate" method="post">
			<div>${info.board_name}</div>
			<div id="div_info">
				<input type="hidden" name="seq" value="${info.seq}">
				<input type="hidden" name="board_type" value="${info.board_type}">
				<div>
					${info.seq}<input type="hidden" name="seq" value="${info.seq}">
				</div>
				<div>
					${info.title}<input type="hidden" name="title" value="${info.title}">
				</div>
				<div>
					${info.writer}<input type="hidden" name="writer" value="${info.writer}">
				</div>
				<div>
					${info.write_date}<input type="hidden" name="write_date" value="${info.write_date}">
				</div>
				<div>
					${info.complaint_type}<input type="hidden" name="write_date" value="${info.complaint_type}">
				</div>
				<div>
					${info.total_count}
				</div>
			</div>
			<div>
				<textarea name="txt" id="textarea_contents" cols="30" rows="10" readonly>${info.txt}</textarea>
			</div>
			<div>
				<input type="button" value="돌아가기" onclick="location.href = '/community/toBoard?code=${info.board_type}&currentPage=1'">
			</div>
		</form>
		<c:choose>
			<c:when test="{sessionScope.code == 9999}">
				<form action="/community/insertProcess">
					<input type="hidden" name="seq" value="${info.seq}"> 
					<div style='display: flex;'>
						<textarea style="flex: 6" placeholder="처리내용 작성" name="process"></textarea>
						<input type="submit" value="처리 등록" style="flex: 1;">
					</div>
				</form>
			</c:when>
		</c:choose>
		<c:choose>
			<c:when test="${info.process == null}">
				<div>관리자가 처리중입니다. 잠시만 기다려주세요~</div>
			</c:when>
			<c:otherwise>
				<div>
					<div>${info.process}</div>
				</div>
			</c:otherwise>
		</c:choose>		
		<div>FOOTER</div>
	</div>
	<script>
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