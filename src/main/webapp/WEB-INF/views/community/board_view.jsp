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
				<div>
					${info.total_count}
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
				<input type="button" value="돌아가기" onclick="location.href = '/community/toBoard?code=${info.board_type}&currentPage=1'">
			</div>
		</form>
		<form action="/community/insertReply" method="post">
			<div>
				<div style="text-align: left;">
					${sessionScope.nickName}
					<input type="hidden" name="writer" value="${sessionScope.code}">
					<input type="hidden" name="parent_board" value="${info.seq}">
					<input type="hidden" name="board_type" value="${info.board_type}">
					<input type="hidden" name="reply_type" value="1001">
				</div>
				<div>
					<div style="display: flex; align-items: center;">
						<div style="flex: 6;">					
							<textarea name="txt" style="text-align: left; width: 100%; resize: none;"></textarea>
						</div>
						<div style="flex: 1;">
							<input type="submit" value="댓글 달기">
						</div>
					</div>
				</div>
			</div>
		</form>
		<hr>
		<div style="text-align: left; background-color: pink;">
			댓글 목록
		</div>
		<hr>
		<c:forEach var="i" items="${reply}">
			<form action="/community/updateReply">
				<div class="reply">
					<input type="hidden" name="seq" value="${i.seq}" class="replySeq">
					<input type="hidden" name="board_type" value="${info.board_type}">
					<input type="hidden" name="parent_board" value="${info.seq}">
					<div style="display: flex;">
						<div style="text-align: left; flex: 1;">
							${i.writer}
						</div>
						<div style="text-align: right; flex: 1;">
							${i.write_date}
						</div>
					</div>
					<div style="display: flex; align-items: center;">
						<div style="flex: 6;">
							<textarea name="txt" style="text-align: left; width: 100%; resize: none;" readonly>${i.txt}</textarea>
						</div>
						<div style="flex: 1;">
							<c:if test="${i.writer == sessionScope.nickName}">
								<div>
									<input type="button" value="수정" class="updateReply">	
									<input type="button" value="삭제" 
									onclick="location.href = 
									`/community/deleteReply?board_type=${info.board_type}&seq=${i.seq}&parent_board=${i.parent_board}`">
								</div>
							</c:if>
							<div>
								<input type="button" class="reReplyBtn" value="답글 달기">
							</div>
						</div>
					</div>
				</div>
			</form>
		</c:forEach>
		<c:forEach var="i" items="${reReply}">
			<script>
				var reReplyForm = $("<form action='/community/updateReply'>");
				var reReply = $("<div class='reReply'>");
				var hiddenSeq = $("<input type='hidden' name='seq' value='${i.seq}'>");
				var hiddenType = $("<input type='hidden' name='board_type' value='${info.board_type}'>");
				var hiddenParent = $("<input type='hidden' name='parent_board' value='${info.seq}'>");
				var header = $("<div style='display: flex;'>");
				var space = $("<div style='flex: 1;'>")
				var writer = $("<div style='flex: 10; text-align: left;'>");
				writer.text("${i.writer}");
				var write_date = $("<div style='flex: 10; text-align: right;'>");
				write_date.text("${i.write_date}");
				var headerSpace = space.clone().text("ㄴ");
				header.append(headerSpace, writer, write_date);
				var txt = $("<textarea name='txt' style='text-align: left; width: 100%; resize: none;' readonly>");
				txt.text("${i.txt}");
				var txtDiv = $("<div style='flex: 12;'>");
				txtDiv.append(txt);
				var body = $("<div style='display: flex; align-items: center;'>");
				var buttonDiv = $("<div style='flex: 2;'>")
				var target = $(".replySeq[value=${i.parent_reply}]");
				var updateDiv = $("<div>");
				if("${sessionScope.nickName}" == "${i.writer}") {
				    var submit = $("<input type='button' value='수정' class='updateReply'>");
				    var del = $("<input type='button' value='삭제'>");
				    del.on("click", function(){
						location.href = "/community/deleteReply?board_type=${info.board_type}&seq=${i.seq}&parent_board=${i.parent_board}";
				    });
				    updateDiv.append(submit, del);
				}
				buttonDiv.append(updateDiv);
				body.append(space.clone(), txtDiv, buttonDiv);
				reReply.append(hiddenSeq, hiddenType, hiddenParent);
				reReply.append(header, body);
				reReplyForm.append(reReply);
				target.closest($(".reply")).parent().after(reReplyForm);
			</script>
		</c:forEach>
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
	
	$(".updateReply").on("click", function() {
	    let submit = $("<input type='submit'>");
	    submit.val("수정");
	    let cancel = $("<input type='button'>");
	    cancel.val("취소");
	    cancel.on("click", function() {
			location.reload();
	    });
	    $(this).parent().parent().prev().find("textarea").removeAttr("readonly");
	    $(this).parent().parent().prev().find("textarea").focus();
	    $(this).parent().append(submit, cancel);
	    $(this).next().hide();
		$(this).hide();
	});
	
	$(".reReplyBtn").on("click", function () {
	    const reply = $(this).closest($("#reply"));
	    const writer = "${sessionScope.nickName}";
	    const reReplyForm = $("<form action='/community/insertReply'>");
	    const container = $("<div id='reReply'>");
	    const header = $("<div style='display: flex;'>");
	    const headerSpace = $("<div style='flex: 1;'>")
	    const headerContent = $("<div style='text-align: left; flex: 5'>");
	    header.append(headerSpace, headerContent);
	    headerSpace.text("ㄴ");
	    const body = $("<div style='display: flex;'>");
	    const bodySpace = $("<div style='flex: 1;'>");
	    const bodyContent = $("<div style='flex: 4;'>");
	    const bodyButton = $("<div style='flex: 1;'>");
	    body.append(bodySpace, bodyContent, bodyButton);
	    const textarea = $("<textarea style='text-align: left; width: 100%; resize: none; flex: 6' name='txt'>");
	   	const submit = $("<input type='submit' value='답글 달기' style='flex: 1'>");
	   	const parent_reply = $(this).closest($(".reply")).find($(".replySeq")).val();
	   	const hiddenParentReply = $("<input type='hidden' name='parent_reply'>");
	   	hiddenParentReply.val(parent_reply);
	   	const hiddenBoardType = $("<input type='hidden' name='board_type'>");
	   	hiddenBoardType.val(${info.board_type});
	   	const hiddenReplyType = $("<input type='hidden' name='reply_type'>");
		hiddenReplyType.val(1002);
		const hiddenParentBoard = $("<input type='hidden' name='parent_board'>");
		hiddenParentBoard.val(${info.seq});
		const hiddenWriter = $("<input type='hidden' name='writer'>");
		hiddenWriter.val("${sessionScope.code}");
	   	headerContent.html(writer);
	   	headerSpace.append(hiddenParentReply, hiddenBoardType, hiddenReplyType, hiddenParentBoard, hiddenWriter);
	   	bodyContent.append(textarea);
	   	bodyButton.append(submit);
	   	container.append(header, body);
	   	reReplyForm.append(container);
	   	$(this).closest($("form")).after(reReplyForm);
	});
    </script>
</body>

</html>