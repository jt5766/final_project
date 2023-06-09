<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Card Content</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row gnb">
        <div class="col-md-12">

        </div>
    </div>
</div>
<div class="container-xl">
    <form action="/gallery/${content.gallery_cards}/contents/${content.seq}/modify" method="post">
        <input type="hidden" name="gallery_cards" value="${content.gallery_cards}">
        <input type="hidden" name="seq" value="${content.seq}">
        <div class="row">
            <div class="col-md-12">
                <div class="title">
                    <label for="input_title">제목</label>
                    <input type="text" name="title" id="input_title" value="${content.title}">
                </div>
            </div>
        </div>
        <c:choose>
            <c:when test="${content.category_type == 1005}">
                <div class="row">
                    <div class="col-md-12">
                        <div class="video">
                            <label for="input_video_url">비디오 URL</label>
                            <input type="url" name="video_url" id="input_video_url" value="${content.video_url}">
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${content.category_type == 1001}"></c:when>
            <c:otherwise>
                <div class="row">
                    <div class="col-md-12">
                        <div class="file">
                            <label for="input_file_url">파일 URL</label>
                            <input type="file" name="file_url" id="input_file_url" value="${content.file_url}">
                            <img src="${content.file_url}" alt="${content.file_url}">
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="row">
            <div class="col-md-12">
                <div class="text">
                    <label for="input_txt">내용</label>
                    <input type="text" name="txt" id="input_txt" value="${content.txt}">
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-check form-switch">
                    <input type="hidden" name="yn" id="hidden_allow" value="N">
                    <input class="form-check-input" type="checkbox" role="switch" id="input_allow_show" value="Y">
                    <label class="form-check-label" for="input_allow_show">공개 여부</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <button type="submit">수정하기</button>
            </div>
            <div class="col-md-6">
                <button type="button" onclick="location.href='/gallery/${cardSeq}'">돌아가기</button>
            </div>
        </div>
    </form>
</div>
<script>
    const allowVal = $('#input_allow_show');
    $(allowVal).on('change', function () {
        const hiddenAllow = $('#hidden_allow');
        if (allowVal.prop('checked')) {
            hiddenAllow.val('Y');
        } else {
            hiddenAllow.val('N');
        }
    });
</script>
</body>
</html>
