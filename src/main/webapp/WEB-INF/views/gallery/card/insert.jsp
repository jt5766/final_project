<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<html>
<head>
  <title>Card :: insert</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
  <c:import url="${path}/resources/js/scripts.jsp"/>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>
<body class="gallery-body">
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="gallery"/>
  <c:param name="btnNum" value="${categoryType}"/>
</c:import>
<div class="container-xl">
  <c:if test="${bindingResult.hasErrors()}">
    <c:forEach items="${bindingResult.allErrors}" var="error">
      <div class="error-messages">${error.defaultMessage}</div>
    </c:forEach>
  </c:if>
  <form action="/gallery/insert" method="post" id="card-form" enctype="multipart/form-data">
    <div class="row">
      <div class="con-md-12">
        <p>AI 생성 그림인가요?</p>
        <input type="radio" name="ai" id="input_ai_y" value="Y">
        <label for="input_ai_y">네</label>
        <input type="radio" name="ai" id="input_ai_n" value="N" checked>
        <label for="input_ai_n">아니오</label>
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <input type="hidden" name="category_type" value="${categoryType}">
        <input type="hidden" name="writer" value="${sessionScope.code}">
        <label for="input_title">제목</label>
        <input type="text" name="title" id="input_title" placeholder="대,소문자 / 숫자 / 한글 : 최대 30자">
      </div>
    </div>
    <c:if test="${categoryType<=1002}">
      <div class="row">
        <div class="col-md-12">
          <div class="genre">
            <p>장르 / 최대 2개</p>
            <c:forEach items="${genreTypes}" var="genreType">
              <input type="checkbox" name="genreType" id="genre-${genreType.code}" value="${genreType.code}">
              <label for="genre-${genreType.code}">${genreType.name}</label>
            </c:forEach>
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
    <div class="row">
      <div class="col-md-12">
        <label for="input_synopsis">줄거리</label>
        <input type="text" name="synopsis" id="input_synopsis">
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <label for="input_thumbnail_url">썸네일</label>
        <input type="file" name="thumbnail_image" id="input_thumbnail_url" onchange="readURL(this)"
               formenctype="multipart/form-data">
        <input type="hidden" name="thumbnail_url">
        <img src="" alt="preview thumbnail here..." id="img">
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
        <a href="/gallery/category/1001">
          <button type="button">돌아가기</button>
        </a>
      </div>
    </div>
  </form>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
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
    const title = $('#input_title');
    const catchphrase = $('#input_catchphrase');
    const synopsis = $('#input_synopsis');
    title.on('keydown', function (e) {
        if ((title.val().length > 29)) {
            e.preventDefault();
            title.val(title.val().slice(0,29));
            alert("제목은 30자를 넘을 수 없습니다.");
        }
    });
    catchphrase.on('keydown', function (e) {
        if (catchphrase.val().length > 19) {
            e.preventDefault();
            catchphrase.val(catchphrase.val().slice(0,19));
            alert("한 줄 요약은 20자를 넘을 수 없습니다.");
        }
    });
    synopsis.on('keydown', function (e) {
        if (synopsis.val().length > 100) {
            e.preventDefault();
            alert("줄거리는 300자를 넘을 수 없습니다.");
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
        if (catchphrase.val().trim() === '') {
            e.preventDefault();
            alert("한 줄 요약을 입력해주세요.");
            return false;
        }
        if (synopsis.val().trim() === '') {
            e.preventDefault();
            alert("줄거리를 입력해주세요.");
            return false;
        }
        if ($('#input_thumbnail_url').val().trim() === '') {
            e.preventDefault();
            alert("썸네일을 등록해주세요.");
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
