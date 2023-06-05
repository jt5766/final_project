<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티 글 작성</title>
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
</style>
</head>

<body>
	<div>
		<div>GNB</div>
		<form action="/community/insertBoard" method="post">
			<div>
				<select>
					
				</select>
			</div>
			<div>
				<textarea name="" id="textarea_contents" cols="30" rows="10"></textarea>
			</div>
			<div>
				<input type="button" value="등록/수정">
				<input type="button" value="돌아가기" onclick="location.href = '/community/toNotification'">
			</div>
		</form>
		<div>FOOTER</div>
	</div>

	<script>
	$("#textarea_contents").summernote({
	    height : 500
	});
    </script>
</body>

</html>