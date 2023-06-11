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
    <div class="row">
        <div class="col-md-12">
            <div class="title">
                ${content.title}
            </div>
        </div>
    </div>
    <c:choose>
        <c:when test="${content.category_type == 1005}">
            <div class="row">
                <div class="col-md-12">
                    <div class="video">
                            ${content.video_url}
                    </div>
                </div>
            </div>
        </c:when>
        <c:when test="${content.category_type == 1001}"></c:when>
        <c:otherwise>
            <div class="row">
                <div class="col-md-12">
                    <div class="file">
                        <img src="${content.file_url}" alt="${content.file_url}">
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <div class="row">
        <div class="col-md-12">
            <div class="text">
                ${content.txt}
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <c:if test="${content.yn=='N'}">
                <div>
                    비밀글입니다.
                </div>
            </c:if>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <c:if test="${sessionScope.code == content}">
                <form action="/gallery/${cardSeq}/contents/${content.seq}/delete" method="post">
                    <input type="hidden" name="cardSeq" value="${cardSeq}">
                    <input type="hidden" name="contentSeq" value="${content.seq}">
                    <button type="submit">삭제하기</button>
                </form>
            </c:if>
            <button onclick="location.href='/gallery/${cardSeq}/contents/${content.seq}/modify'">수정하기</button>
        </div>
        <div class="col-md-6">
            <button onclick="location.href='/gallery/${cardSeq}'">돌아가기</button>
        </div>
    </div>
</div>
</body>
</html>
