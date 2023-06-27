<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>커뮤니티 글 수정</title>
<!-- 공통 script & css -->
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<style>
#inputTitle {
	width: 100%;
}
</style>
</head>

<body>
	<!-- GNB & LNB -->
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="community" />
		<c:param name="btnNum" value="${info.board_type}" />
	</c:import>
	<!-- CONTENTS -->
	<div class="container-xl bg-secondary position-relative p-0">
		<div class="row">
			<div class="col">
				<form action="/community/updateBoard" method="post" id="boardForm">
					<div style="display: flex;">
						<div style="flex: 5;">
							<input type="hidden" name="board_type" value="${info.board_type}">
							<input type="hidden" name="seq" value="${info.seq}">
							<input type="text" name="title" placeholder="제목을 입력해주세요" id="inputTitle" value="${info.title}">
						</div>
						<div style="flex: 1;">
							<select style="width: 100%; height: 100%;">
								<c:forEach var="i" items="${selectTag}">
									<c:choose>
										<c:when test="${i.code == info.board_type}">
											<option checked>${i.name}</option>
										</c:when>
										<c:otherwise>
											<option disabled>${i.name}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>
					<div>
						<textarea name="txt" id="textarea_contents" cols="30" rows="10">${info.txt}</textarea>
					</div>
					<div style="text-align: right;">
						<input type="button" id="formSubmit" value="수정하기">
						<input type="button" value="돌아가기" onclick="location.href = '/community/toBoard?code=${info.board_type}&currentPage=1'">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
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
				[ 'insert', [ 'picture' ] ] ],
		callbacks : { //여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files) {
				for (let i = 0; i < files.length; i++) {
					let blobUrl = URL.createObjectURL(files[i]);
					$(this).summernote("insertImage", blobUrl, files[i].name);
				}
			}
		}
	});
	$("#formSubmit").on("click", async function(e) {
	    const title = $("#inputTitle").val();
	    const txt = $(".note-editable").html();
	    if(title.length == 0 || txt.length == 0) {
			console.log(title.length);
			console.log(txt.length);
			alert("제목 또는 내용을 입력해주세요");
			return false;
	    }
		let imgList = $(".note-editable img");
		let fileArr = [];
		for(let i = 0; i < imgList.length; i++) {
			let imgSrc = imgList[i].src;
			let imgName = imgList.eq(i).attr("data-filename");
			if(imgSrc.startsWith("blob:")) {
				let blob = await fetch(imgSrc).then(r => r.blob());
				let file = new File([blob], imgName);
				fileArr.push(file);
			}
		}
		console.log(fileArr);
		uploadImg(fileArr);
		let contents = $("#textarea_contents").val();
		$("#boardForm").submit();
	});
	function uploadImg(fileArr) {
	    console.log("uploadImg");
	    console.log(fileArr);
		let formData = new FormData();
		fileArr.map(function(e, i){
		    console.log(e);
			formData.append("files", e);
		});
		console.log(formData);
		$.ajax({
			data : formData,
			type : "POST",
			url : "/community/uploadFile",
			async : false,
			contentType : false,
			processData : false,
			encType : "multipart/form-data"
		}).done(function(response) {
		    response = JSON.parse(response);
		    response.map(function(e){
				let targetImg = $(".note-editable img[data-filename ='"+e.oriName+"']");
				targetImg.attr("src", e.imgSrc);
			});
			let div = $(".note-editable").html();
			$("#textarea_contents").val(div);
		});
	}
    </script>
</body>

</html>