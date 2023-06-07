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
    <form action="/gallery/card" method="post" id="card-form">
        <div class="row">
            <div class="con-md-12">
                <p>AI 생성 그림인가요?</p>
                <input type="radio" name="ai" id="input_ai_y" value="Y">
                <label for="input_ai_y">네</label>
                <input type="radio" name="ai" id="input_ai_n" value="N">
                <label for="input_ai_n">아니오</label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <input type="hidden" name="categoryType" value="${categoryType}">
                <input type="hidden" name="writer" value="${loginID}">
                <label for="input_title">제목</label>
                <input type="text" name="title" id="input_title" placeholder="대,소문자 / 숫자 / 한글 : 최대 30자">
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
                <input type="text" name="catchphrase" id="input_catchphrase">
            </div>
        </div>
        <c:if test="${categoryType <= 1002}">
            <div class="row">
                <div class="col-md-12">
                    <label for="input_synopsis">줄거리</label>
                    <input type="text" name="synopsis" id="input_synopsis">
                </div>
            </div>
        </c:if>
        <div class="row">
            <div class="col-md-12">
                <label for="input_thumbnail">썸네일</label>
                <input type="url" name="thumbnail" id="input_thumbnail" placeholder="http://...">
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
                <a href="/gallery">
                    <button type="button">돌아가기</button>
                </a>
            </div>
        </div>
    </form>
</div>
<script>
    $("input[name='genreType']").on("click", function() {
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
</script>
</body>
</html>
