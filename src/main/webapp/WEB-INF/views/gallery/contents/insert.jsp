<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<html>
<head>
  <title>Content :: insert</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
  <link rel="stylesheet" href="/resources/oembed/jquery.oembed.css">
  <script src="/resources/oembed/jquery.oembed.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="gallery"/>
  <c:param name="btnNum" value="${categoryType}"/>
</c:import>
<div class="container-xl">
  <c:choose>
  <c:when test="${(categoryType < 1005) && (categoryType != 1001)}">
  <form action="/gallery/${cardSeq}/contents/withFile" method="post" enctype="multipart/form-data" id="content-form">
    </c:when>
    <c:otherwise>
    <form action="/gallery/${cardSeq}/contents" method="post" id="content-form">
      </c:otherwise>
      </c:choose>
      <input type="hidden" name="gallery_cards" value="${cardSeq}">
      <div class="row input-box">
        <div class="col-6 d-flex justify-content-start align-items-center">
          <label for="input_title">제목</label>
        </div>
        <div class="col-6 d-flex justify-content-end align-items-center">
          <input class="input-text" type="text" name="title" id="input_title" placeholder="제목 : 최대 30자">
        </div>
      </div>
      <c:choose>
        <c:when test="${categoryType == 1005}">
          <div class="row input-box">
            <div class="col-12">
              <input type="hidden" name="video_url" id="input_video_url">
              <div class="btn-wrap">
                <button type="button" class="modal_link">링크 올리기</button>
              </div>
              <div class="hidden modal-wrap">
                <div class="my-modal-content">
                  <div class="modal-body">
                    <span class="close-btn">&times;</span>
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
          <div class="row input-box">
            <div class="col-12">
              <input type="hidden" name="file_url" id="input_audio_url">
              <div class="btn-wrap">
                <button type="button" class="modal_link">링크 올리기</button>
              </div>
              <div class="hidden modal-wrap">
                <div class="my-modal-content">
                  <div class="modal-body">
                    <span class="close-btn">&times;</span>
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
          <div class="row input-box">
            <div class="col-6 d-flex justify-content-start align-items-center">
              <label for="input_file_image">[이미지] 파일 선택 - 만화 / 그림 / 사진</label>
            </div>
            <div class="col-6 d-flex justify-content-end align-items-center">
              <input class="form-control form-control-sm" type="file" name="file_image" id="input_file_image" onchange="readURL(this)"
                     formenctype="multipart/form-data">
              <input type="hidden" name="file_url">
            </div>
            <div class="col-12">
              <img class="preview-img" src="" alt="preview thumbnail here..." id="img">
            </div>
          </div>
        </c:otherwise>
      </c:choose>
      <div class="row input-box">
        <div class="col-12">
          <textarea name="txt" class="input_txt" id="input_txt" cols="30" rows="10"></textarea>
        </div>
      </div>
      <div class="row input-box">
        <div class="col-12">
          <div class="form-check form-switch">
            <input type="hidden" name="yn" id="hidden_allow" value="Y">
            <input class="form-check-input" type="checkbox" role="switch" id="input_allow_show" value="Y"
                   checked>
            <label class="form-check-label" for="input_allow_show">공개 여부</label>
          </div>
        </div>
      </div>
      <div class="row input-box">
        <div class="col-6 d-flex justify-content-start align-items-center">
          <button type="submit" class="common-button">등록</button>
        </div>
        <div class="col-6 d-flex justify-content-end align-items-center">
          <button type="button" class="common-button" onclick="location.href='/gallery/${cardSeq}'">돌아가기</button>
        </div>
      </div>
    </form>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
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
    const modal = $('.modal-wrap');
    const closeBtn = document.querySelector('.close-btn');

    $('#input_txt').summernote({
        height: 350, // 에디터 높이
        minHeight: null, // 최소 높이
        maxHeight: null, // 최대 높이
        focus: true, // 에디터 로딩후 포커스를 맞출지 여부
        lang: "ko-KR", // 한글 설정
        codeviewFilter: false,
        codeviewIframeFilter: true,
        placeholder: '내용을 입력해주세요', //placeholder 설정
        disableDragAndDrop: true,
        toolbar: [],
    });

    const title = $('#input_title');
    const txt = $('#input_txt');

    $('#content-form').on('submit', (e) => {
        if (title.val().trim() === '') {
            e.preventDefault();
            alert("제목을 입력해주세요.");
            return false;
        }
        if (${categoryType != 1001 || categoryType != 1005}) {
            if ($('input[name="file_url"]').val() === '') {
                e.preventDefault();
                alert("파일을 등록해주세요.");
                return false;
            }
        }
        if (${categoryType == 1005}) {
            if ($('input[name="video_url"]').val() === '') {
                e.preventDefault();
                alert("영상을 등록해주세요.");
                return false;
            }
        }
        if ($('.note-editable').text().trim() === '') {
            e.preventDefault();
            alert("내용을 입력해주세요.");
            return false;
        }
        txt.val($('.note-editable').text());
    });

    $(allowVal).on('change', function () {
        const hiddenAllow = $('#hidden_allow');
        if (allowVal.prop('checked')) {
            hiddenAllow.val('Y');
        } else {
            hiddenAllow.val('N');
        }
    });

    if (${categoryType > 1004}) {
        const pop_modal = function () {
            modal.toggleClass('pop');
            modal.toggleClass('hidden');
        }

        btn.onclick = function () {
            pop_modal();
            // modal.fadeIn();
        };
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
                $('#preview').removeClass('hidden');
                pop_modal();
            } else if (naver_regex.test(urlVal)) {
                $('#input_video_url').val(urlVal.replace(cut_naverURL, replace_naverURL));
                $('.preview_video').attr('src', urlVal.replace(cut_naverURL, replace_naverURL));
                $('#preview').removeClass('hidden');
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
    }

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
