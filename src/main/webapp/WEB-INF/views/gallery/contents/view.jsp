<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
  <title>Card Content</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
  <link rel="stylesheet" href="/resources/oembed/jquery.oembed.css">
  <script src="/resources/oembed/jquery.oembed.js"></script>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="gallery"/>
  <c:param name="btnNum" value="${categoryType}"/>
</c:import>
<div class="container-xl content-body">
  <div class="row">
    <div class="col-10 d-flex justify-content-start align-items-center content-title">
      <div>
        ${content.title}
      </div>
    </div>
    <div class="col-2 d-flex justify-content-end align-items-center p-0">
      <c:if test="${sessionScope.code == content.writer}">
        <div class="content-disclosure">
          <c:if test="${sessionScope.code == content.writer}">
            <div class="form-check form-switch">
              <input class="form-check-input" type="checkbox" role="switch" id="chk-disclosure"
                     <c:if test="${content.yn == 'Y'}">checked value="Y"</c:if>
                     <c:if test="${content.yn == 'N'}">value="N"</c:if>
              >
              <label class="form-check-label" for="chk-disclosure">공개</label>
            </div>
          </c:if>
        </div>
      </c:if>
    </div>
  </div>
  <c:choose>
    <c:when test="${content.category_type == 1005}">
      <div class="row">
        <div class="col-md-12 p-0">
          <div class="content-video">
            <iframe width="560" height="315" src="${content.video_url}"
                    title="video player" frameborder="0"
                    allow="accelerometer; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                    allowfullscreen>
            </iframe>
          </div>
        </div>
      </div>
    </c:when>
    <c:when test="${content.category_type == 1001}"></c:when>
    <c:when test="${content.category_type == 1006}">
      <div class="content-audio">
        <a href="${content.file_url}" class="content_audio"></a>
      </div>
    </c:when>
    <c:otherwise>
      <div class="row">
        <div class="col-md-12 p-0">
          <div class="content-file">
            <img class="img-file" src="/resources${content.file_url}" alt="/resources/img/default_img.jpg" onerror="this.src='/resources/img/default_img.jpg'">
          </div>
        </div>
      </div>
    </c:otherwise>
  </c:choose>
  <c:if test="${content.category_type != 1002}">
    <div class="row">
      <div class="col-md-12 p-0">
        <div class="content-txt">
          ${content.txt}
        </div>
      </div>
    </div>
  </c:if>
  <div class="row">
    <div class="col-md-12 p-0">
      <c:if test="${content.yn=='N'}">
        <div class="secrete">
          비밀글입니다.
        </div>
      </c:if>
    </div>
  </div>
  <div class="row">
    <div class="col-6 d-flex justify-content-start align-items-center">
      <c:if test="${sessionScope.code == content.writer}">
        <form action="/gallery/${cardSeq}/contents/${content.seq}/delete" method="post">
          <input type="hidden" name="cardSeq" value="${cardSeq}">
          <input type="hidden" name="contentSeq" value="${content.seq}">
          <button type="submit" class="common-button">삭제하기</button>
        </form>
        <button class="common-button" onclick="location.href='/gallery/${cardSeq}/contents/${content.seq}/modify/${content.category_type}'">
          수정하기
        </button>
      </c:if>
    </div>
    <div class="col-6 d-flex justify-content-end align-items-center">
      <button class="common-button" onclick="location.href='/gallery/${cardSeq}'">돌아가기</button>
    </div>
  </div>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
<script>
    $(function () {
        if (${content.category_type==1006}) {
            $('.content_audio').oembed();
        }
    });
    $('#chk-disclosure').on('click', function () {
        const chkDom = $('#chk-disclosure');
        if (chkDom.val() === 'Y') {
            chkDom.val('N');
        } else if (chkDom.val() === 'N') {
            chkDom.val('Y');
        }
        $.ajax({
            url: "/gallery/disclosure/${cardSeq}/contents/${content.seq}",
            data: chkDom.val(),
            contentType: "application/x-www-form-urlencoded",
            accepts: {plainText: "application/json"},
            method: "put"
        });
    });
</script>
</body>
</html>
