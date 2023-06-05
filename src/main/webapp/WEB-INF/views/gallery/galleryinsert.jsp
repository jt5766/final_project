<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row gnb">
        <div class="col-md-12">

        </div>
    </div>
</div>
<div class="container-xl">
    <div class="row">
        <div class="col-md-12">
            <label for="input_title">
                <input type="text" name="title" id="input_title">
            </label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="input_file">
                [이미지/오디오] 파일 선택 - 만화 / 그림 / 사진 / 음악
                <input type="file" name="file" id="input_file">
            </label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="input_video">
                비디오 파일 URL [유튜브 / 네이버 블로그] - 영상
                <input type="url" name="video" id="input_video">
            </label>
            <div class="preview">

            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="input_gallery_content">
                <textarea name="gallery_content" id="input_gallery_content" cols="30" rows="10">

                </textarea>
            </label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" role="switch" id="input_allow_show">
                <label class="form-check-label" for="input_allow_show">공개 여부</label>
            </div>
        </div>
        <div class="col-md-6">
            <button>등록 / 수정</button>
        </div>
        <div class="col-md-6">
            <button>돌아가기</button>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row footer">
        <div class="col-md-12">

        </div>
    </div>
</div>
</body>
</html>
