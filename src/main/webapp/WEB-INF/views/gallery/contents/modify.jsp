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
            <c:when test="${categoryType == 1005}">
                <div class="row">
                    <div class="col-md-12">
                        <input type="hidden" name="video_url" id="input_video_url" value="${content.video_url}">
                        <div class="btnWrap">
                            <button type="button" class="modal_link">링크 올리기</button>
                        </div>
                        <div class="hidden modalWrap">
                            <div class="modalContent">
                                <div class="modalBody">
                                    <span class="closeBtn">&times;</span>
                                    <h5>영상 링크를 복사하여 붙여주세요.</h5>
                                    <div class="modal_input_box">
                                        <input type="text" class="third_party_link" placeholder="paste url here" value="${content.video_url}">
                                        <button type="button" class="confirm_video_link">업로드</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="preview">
                            <iframe width="560" height="315" src="${content.video_url}"
                                    title="YouTube video player" frameborder="0"
                                    allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                    allowfullscreen class="preview_video">
                            </iframe>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${categoryType == 1006}">
                <div class="row">
                    <div class="col-md-12">
                        <input type="hidden" name="file_url" id="input_audio_url" value="${content.file_url}">
                        <div class="btnWrap">
                            <button type="button" class="modal_link">링크 올리기</button>
                        </div>
                        <div class="hidden modalWrap">
                            <div class="modalContent">
                                <div class="modalBody">
                                    <span class="closeBtn">&times;</span>
                                    <h5>사운드클라우드 링크를 복사하여 붙여주세요.</h5>
                                    <div class="modal_input_box">
                                        <input type="text" class="third_party_link" placeholder="paste url here" value="${content.file_url}">
                                        <button type="button" class="confirm_audio_link">업로드</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="preview hidden">
                            <a href="" class="preview_audio"></a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:when test="${categoryType == 1001}"></c:when>
            <c:otherwise>
                <div class="row">
                    <div class="col-md-12">
                        <label for="input_file_image">
                            [이미지] 파일 선택 - 만화 / 그림 / 사진
                        </label>
                        <input type="file" name="file_url" id="input_file_image" onchange="readURL(this)" formenctype="multipart/form-data" value="${content.file_url}">
                        <input type="hidden" name="file_url" value="${content.file_url}">
                        <img src="${content.file_url}" alt="${content.file_url}">
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
<%--        <c:choose>--%>
<%--            <c:when test="${content.category_type == 1005}">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-md-12">--%>
<%--                        <div class="video">--%>
<%--                            <label for="input_video_url">비디오 URL</label>--%>
<%--                            <input type="url" name="video_url" id="input_video_url" value="${content.video_url}">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:when>--%>
<%--            <c:when test="${content.category_type == 1001}"></c:when>--%>
<%--            <c:otherwise>--%>
<%--                <div class="row">--%>
<%--                    <div class="col-md-12">--%>
<%--                        <div class="file">--%>
<%--                            <label for="input_file_url">파일 URL</label>--%>
<%--                            <input type="file" name="file_url" id="input_file_url" value="${content.file_url}">--%>
<%--                            <img src="${content.file_url}" alt="${content.file_url}">--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
        <div class="row">
            <div class="col-md-12">
                <div class="text">
                    <label for="input_txt">내용</label>
                    <textarea name="txt" id="input_txt" cols="30" rows="10">${content.txt}</textarea>
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
