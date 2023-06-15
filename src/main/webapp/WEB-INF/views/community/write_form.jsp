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

#inputTitle {
	width: 100%;
}
</style>
</head>

<body>
	<div>
		<div>GNB</div>
		<form action="/community/insertBoard" method="post">
			<div>
				<select>
					<c:forEach var="i" items="${selectTag}">
						<c:choose>
							<c:when test="${i.code == boardCode}">
								<option checked>${i.name}</option>
							</c:when>
							<c:otherwise>
								<option disabled>${i.name}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div>
				<input type="hidden" name="board_type" value="${boardCode}">
				<input type="text" name="title" placeholder="제목을 입력해주세요" id="inputTitle">
			</div>
			<div>
				<textarea name="txt" id="textarea_contents" cols="30" rows="10"></textarea>
			</div>
			<div>
				<input type="submit" value="등록하기">
				<input type="button" value="돌아가기" onclick="location.href = '/community/toBoard?code=${boardCode}&currentPage=1'">
			</div>
		</form>
		<div>FOOTER</div>
	</div>

	<script>
	$("#textarea_contents").summernote({
	    height : 500, // 에디터 높이
		minHeight : null, // 최소 높이
		maxHeight : null, // 최대 높이
		focus : true, // 에디터 로딩후 포커스를 맞출지 여부
		lang : "ko-KR", // 한글 설정
		codeviewIframeFilter: true,
		placeholder : '내용을 입력해주세요', //placeholder 설정
		disableDragAndDrop : true,
		toolbar : [ [ 'style', [ 'style' ] ],
				[ 'font', [ 'bold', 'underline', 'clear' ] ],
				[ 'fontname', [ 'fontname' ] ],
				[ 'color', [ 'color' ] ],
				[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
				[ 'table', [ 'table' ] ],
				[ 'insert', [ 'picture' ] ],
				[ 'view', [ 'fullscreen', 'codeview', 'help' ] ] ],
		callbacks : { //여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				console.log("files.length : "+files.length);
				for (let i = 0; i < files.length; i++) {
					let blobUrl = URL.createObjectURL(files[i]);
					$(this).summernote("insertImage", blobUrl, files[i].name);
				}
			}
		}
	});
    </script>
</body>

</html>