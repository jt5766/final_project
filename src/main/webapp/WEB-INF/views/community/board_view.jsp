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
				<div>${info.seq}<input type="hidden" name="seq" value="${info.seq}">
				</div>
				<div>${info.title}<input type="hidden" name="title" value="${info.title}">
				</div>
				<div>${info.writer}<input type="hidden" name="writer" value="${info.writer}">
				</div>
				<div>${info.formed_date}<input type="hidden" name="write_date" value="${info.write_date}">
				</div>
			</div>
			<div>
				<textarea name="txt" id="textarea_contents" cols="30" rows="10" readonly>${info.txt}</textarea>
			</div>
			<div>
				<%-- 				<c:if test=""> --%>
				<input type="submit" value="수정하기">
				<input type="button" value="삭제하기" onclick="location.href = '/community/deleteBoard?board_type=${info.board_type}&seq=${info.seq}'">
				<%-- 								</c:if> --%>
				<input type="button" value="돌아가기" onclick="location.href = '/community/toBoard?code=${info.board_type}'">
			</div>
		</form>
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
	$("#textarea_contents").summernote("disable");
    </script>
</body>

</html>