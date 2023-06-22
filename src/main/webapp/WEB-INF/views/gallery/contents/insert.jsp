<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/oembed/jquery.oembed.css">
    <script src="/resources/oembed/jquery.oembed.js"></script>
    <style>

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .btnWrap {
            width: 500px;
            margin: 30px 0px;
        }

        .modal_link {
            width: 150px;
            height: 50px;
            padding: 10px 5px;
            border-radius: 15px;
            border: none;
            background-color: #19197050;
            cursor: pointer;
        }

        .modal_link:hover {
            background-color: #19197080;
        }

        .modal_link:active {
            background-color: #19197097;
        }

        .modalWrap {
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            animation: fadeInModal 500ms linear;
        }

        .modalContent {
            height: 450px;
        }

        .modalBody {
            width: 600px;
            height: 450px;
            padding: 30px 30px;
            border: 1px solid #777;
            background-color: #fff;
        }

        .modal_input_box {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }

        .third_party_link {
            width: 100%;
            padding: 5px 10px 5px 10px;
            border-top-left-radius: 10px;
            border-bottom-right-radius: 10px;
            outline: none;
            border: none;
            background-color: #80808020;
        }

        .confirm_video_link {
            padding: 5px 10px;
            cursor: pointer;
            border: none;
            border-radius: 15px;
            margin-top: 20px;
            background-color: #19197050;
        }

        .closeBtn {
            float: right;
            font-weight: bold;
            color: #777;
            font-size: 25px;
            cursor: pointer;
        }

        .hidden {
            display: none;
        }

        .pop {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @keyframes fadeInModal {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row gnb">
        <div class="col-md-12">

        </div>
    </div>
</div>
<div class="container-xl">
    <c:choose>
        <c:when test="${(categoryType < 1005) && (categoryType != 1001)}">
            <form action="/gallery/${cardSeq}/contents/withFile" method="post" enctype="multipart/form-data">
        </c:when>
        <c:otherwise>
            <form action="/gallery/${cardSeq}/contents" method="post">
        </c:otherwise>
    </c:choose>
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
                        <input type="hidden" name="video_url" id="input_video_url">
                        <div class="btnWrap">
                            <button type="button" class="modal_link">링크 올리기</button>
                        </div>
                        <div class="hidden modalWrap">
                            <div class="modalContent">
                                <div class="modalBody">
                                    <span class="closeBtn">&times;</span>
                                    <h5>영상 링크를 복사하여 붙여주세요.</h5>
                                    <div class="modal_input_box">
                                        <input type="text" class="third_party_link" placeholder="paste url here">
                                        <button type="button" class="confirm_video_link">업로드</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="preview hidden">
                            <iframe width="560" height="315" src=""
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
                        <input type="hidden" name="file_url" id="input_audio_url">
                        <div class="btnWrap">
                            <button type="button" class="modal_link">링크 올리기</button>
                        </div>
                        <div class="hidden modalWrap">
                            <div class="modalContent">
                                <div class="modalBody">
                                    <span class="closeBtn">&times;</span>
                                    <h5>사운드클라우드 링크를 복사하여 붙여주세요.</h5>
                                    <div class="modal_input_box">
                                        <input type="text" class="third_party_link" placeholder="paste url here">
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
                        <input type="file" name="file_image" id="input_file_image" onchange="readURL(this)" formenctype="multipart/form-data">
                        <input type="hidden" name="file_url">
                        <img src="" alt="preview" id="img">
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <div class="row">
            <div class="col-md-12">
                <label for="input_txt">
                    <textarea name="txt" id="input_txt" cols="30" rows="10"></textarea>
                </label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="form-check form-switch">
                    <input type="hidden" name="yn" id="hidden_allow" value="Y">
                    <input class="form-check-input" type="checkbox" role="switch" id="input_allow_show" value="Y"
                           checked>
                    <label class="form-check-label" for="input_allow_show">공개 여부</label>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <button type="submit">등록</button>
            </div>
            <div class="col-md-6">
                <button type="button" onclick="location.href='/gallery/${cardSeq}'">돌아가기</button>
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
    const youtube_regex = /https:\/\/youtu\.be\/.*/;
    const cut_youtubeURL = "https://youtu.be/";
    const replace_youtubeURL = "https://youtube.com/embed/";
    const naver_regex = /https:\/\/tv\.naver\.com\/v\/.*/;
    const cut_naverURL = "https://tv.naver.com/v/";
    const replace_naverURL = "https://tv.naver.com/embed/";
    const soundcloud_regex = /https:\/\/(?:on\.)?soundcloud\.com\/.*/;
    const allowVal = $('#input_allow_show');
    const btn = document.querySelector('.modal_link');
    const modal = $('.modalWrap');
    const closeBtn = document.querySelector('.closeBtn');


    const pop_modal = function () {
        modal.toggleClass('pop');
        modal.toggleClass('hidden');
    }

    $(allowVal).on('change', function () {
        const hiddenAllow = $('#hidden_allow');
        if (allowVal.prop('checked')) {
            hiddenAllow.val('Y');
        } else {
            hiddenAllow.val('N');
        }
    });

    btn.onclick = function () {
        pop_modal();
        // modal.fadeIn();
    }
    closeBtn.onclick = function () {
        pop_modal();
        // modal.fadeOut();
    }

    window.onclick = function (event) {
        if (event.target == modal.get(0)) {
            pop_modal();
            // modal.fadeOut();
        }
    }
    $('.confirm_video_link').on('click', function () {
        const urlVal = $('.third_party_link').val().trim();
        if (youtube_regex.test(urlVal)) {
            $('#input_video_url').val(urlVal.replace(cut_youtubeURL, replace_youtubeURL));
            $('.preview_video').attr('src', urlVal.replace(cut_youtubeURL, replace_youtubeURL));
            $('.preview').removeClass('hidden');
            pop_modal();
        } else if (naver_regex.test(urlVal)) {
            $('#input_video_url').val(urlVal.replace(cut_naverURL, replace_naverURL));
            $('.preview_video').attr('src', urlVal.replace(cut_naverURL, replace_naverURL));
            $('.preview').removeClass('hidden');
            pop_modal();
        } else {
            alert("올바른 주소가 아닙니다.");
        }
    });
    $('.confirm_audio_link').on('click', function () {
        const urlVal = $('.third_party_link').val().trim();
        if (soundcloud_regex.test(urlVal)) {
            $('#input_audio_url').val(urlVal);
            $('.preview_audio').attr('href', urlVal).oembed();
            $('.preview').removeClass('hidden');
            pop_modal();
        } else {
            alert("올바른 주소가 아닙니다.");
        }
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            const blob = new Blob([input.files[0]]);
            reader.onload = function () {
                $('#img').attr('src', URL.createObjectURL(blob));
                $('input[name="file_url"]').val(input.files[0].name);
            };
            reader.readAsDataURL(blob);
        } else {
            $('#img').attr('src', "");
            $('input[name="file_url"]').val("");
        }
    }
</script>
</body>
</html>
