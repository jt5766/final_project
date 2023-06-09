<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
    <form action="/gallery/${cardSeq}/contents" method="post">
        <div class="row">
            <div class="col-md-12">
                <input type="hidden" name="gallery_cards" value="${cardSeq}">
                <label for="input_title">제목
                    <input type="text" name="title" id="input_title">
                </label>
            </div>
        </div>
        <c:choose>
            <c:when test="${categoryType == 1005}">
                <div class="row">
                    <div class="col-md-12">
                        <label for="input_video_url">
                            비디오 파일 URL [유튜브 / 네이버 블로그] - 영상
                            <input type="url" name="video_url" id="input_video_url">
                        </label>
                        <div class="preview">

                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${categoryType == 1001}"></c:when>
            <c:otherwise>
                <div class="row">
                    <div class="col-md-12">
                        <label for="input_file_url">
                            [이미지/오디오] 파일 선택 - 만화 / 그림 / 사진 / 음악
                            <input type="file" name="file_url" id="input_file_url">
                        </label>
                    </div>
                </div>
                <!--TODO: file url로 업로드 되는지 확인-->
            </c:otherwise>
        </c:choose>
        <div class="row">
            <div class="col-md-12">
                <label for="input_txt">
                <textarea name="txt" id="input_txt" cols="30" rows="10">

                </textarea>
                </label>
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
                <button type="submit">등록</button>
            </div>
            <div class="col-md-6">
                <button type="button">돌아가기</button>
            </div>
        </div>
    </form>
</div>
<div class="container-fluid">
    <div class="row footer">
        <div class="col-md-12">

        </div>
    </div>
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
