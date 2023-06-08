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
	border: 0px solid black;
	text-align: center;
}

#inputTitle {
	width: 80%;
}
</style>
</head>

<body>
	<div>
		<div>GNB</div>
		<form action="/community/insertBoard" method="post">
			<div>
				${info.board_name}
			</div>
			<div>
				<input type="hidden" name="seq" value="${info.seq}">
				<input type="text" name="title" id="inputTitle" value="${info.title}" readonly>
				<p>${info.writer}</p>
			</div>
			<div>
				<textarea name="txt" id="textarea_contents" cols="30" rows="10" readonly>${info.txt}</textarea>
			</div>
			<div>
				<input type="submit" value="등록/수정">
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