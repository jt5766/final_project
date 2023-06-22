<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Card :: insert</title>
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
    <form action="/gallery/${card.seq}/modify" method="post" id="card-form" enctype="multipart/form-data">
        <div class="row">
            <div class="con-md-12">
                <input type="hidden" name="seq" value="${card.seq}">
                <p>AI 생성 그림인가요?</p>
                <input type="radio" name="ai" id="input_ai_y" value="Y"
                <c:if test="${card.ai == 'Y'}">
                    checked
                </c:if>
                >
                <label for="input_ai_y">네</label>
                <input type="radio" name="ai" id="input_ai_n" value="N"
                <c:if test="${card.ai == 'N'}">
                       checked
                </c:if>
                >
                <label for="input_ai_n">아니오</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <input type="hidden" name="category_type" value="${categoryType}">
                <input type="hidden" name="writer" value="${sessionScope.code}">
                <label for="input_title">제목</label>
                <input type="text" name="title" id="input_title" value="${card.title}" placeholder="대,소문자 / 숫자 / 한글 : 최대 30자">
            </div>
        </div>
        <c:if test="${categoryType<=1002}">
            <div class="row">
                <div class="col-md-12">
                    <div class="genre">
                        <p>장르 / 최대 2개</p>
                        <input type="checkbox" name="genreType" id="romance" value="1001">
                        <label for="romance">로맨스</label>
                        <input type="checkbox" name="genreType" id="fantasy" value="1002">
                        <label for="fantasy">판타지</label>
                        <input type="checkbox" name="genreType" id="action" value="1003">
                        <label for="action">액션</label>
                        <input type="checkbox" name="genreType" id="thriller" value="1004">
                        <label for="thriller">스릴러</label>
                        <input type="checkbox" name="genreType" id="gag" value="1005">
                        <label for="gag">개그</label>
                        <input type="checkbox" name="genreType" id="wuxia" value="1006">
                        <label for="wuxia">무협/사극</label>
                        <input type="checkbox" name="genreType" id="drama" value="1007">
                        <label for="drama">드라마</label>
                        <input type="checkbox" name="genreType" id="sports" value="1008">
                        <label for="sports">스포츠</label>
                    </div>
                </div>
            </div>
        </c:if>
        <div class="row">
            <div class="col-md-12">
                <label for="input_catchphrase">한 줄 요약</label>
                <input type="text" name="catchphrase" id="input_catchphrase" value="${card.catchphrase}">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="input_synopsis">줄거리</label>
                <input type="text" name="synopsis" id="input_synopsis" value="${card.synopsis}">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <label for="input_thumbnail_url">썸네일</label>
                <input type="file" name="thumbnail_image" id="input_thumbnail_url" onchange="readURL(this)" formenctype="multipart/form-data">
                <input type="hidden" name="thumbnail_url" value="${card.thumbnail_url}">
                <img src="${card.thumbnail_url}" alt="${card.thumbnail_url}" id="img">
            </div>
        </div>
        <input type="hidden" name="yn" value="${card.yn}">
        <div class="row">
            <div class="col-md-6">
                <button type="submit">수정</button>
            </div>
            <div class="col-md-6">
                <a href="/gallery">
                    <button type="button">돌아가기</button>
                </a>
            </div>
        </div>
    </form>
</div>
<script>
    $("input[name='genreType']").on("click", function () {
        const count = $("input:checked[name='genreType']").length;
        if (count > 2) {
            $(this).prop('checked', false);
            alert('장르는 최대 2개까지만 선택 가능합니다.');
        }
    });
    const allowVal = $('#input_allow_show');
    $(allowVal).on('change', function () {
        const hiddenAllow = $('#hidden_allow');
        if (allowVal.prop('checked')) {
            hiddenAllow.val('Y');
        } else {
            hiddenAllow.val('N');
        }
    });
    $('#card-form').on('submit', (e) => {
        if ($('#input_title').val().trim() === '') {
            e.preventDefault();
            alert("제목을 입력해주세요.");
            return false;
        }
        if ((${categoryType <= 1002}) && ($("input:checked[name='genreType']").length === 0)) {
            e.preventDefault();
            alert("장르를 체크해주세요.");
            return false;
        }
        if ($('#input_catchphrase').val().trim() === '') {
            e.preventDefault();
            alert("한 줄 요약을 입력해주세요.");
            return false;
        }
        if ($('#input_synopsis').val().trim() === '') {
            e.preventDefault();
            alert("줄거리를 입력해주세요.");
            return false;
        }
    });
    function readURL(input) {
        if (input.files && input.files[0]) {
            const reader = new FileReader();
            const blob = new Blob([input.files[0]]);
            reader.onload = function () {
                $('#img').attr('src', URL.createObjectURL(blob));
                $('input[name="thumbnail_url"]').val(input.files[0].name);
            };
            reader.readAsDataURL(blob);
        } else {
            $('#img').attr('src', "");
            $('input[name="thumbnail_url"]').val("");
        }
    }
</script>
</body>
</html>
