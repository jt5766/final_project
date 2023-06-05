<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Card :: insert</title>
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
            <input type="hidden" name="category_type" value="${categoryType}">
            <label for="input_title">제목</label>
            <input type="text" name="title" id="input_title">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="genre">
                <input type="checkbox" name="genre_type" id="romance">
                <label for="romance">로맨스</label>
                <input type="checkbox" name="genre_type" id="fantasy">
                <label for="fantasy">판타지</label>
                <input type="checkbox" name="genre_type" id="action">
                <label for="action">액션</label>
                <input type="checkbox" name="genre_type" id="thriller">
                <label for="thriller">스릴러</label>
                <input type="checkbox" name="genre_type" id="comedy">
                <label for="comedy">개그</label>
                <input type="checkbox" name="genre_type" id="wuxia">
                <label for="wuxia">무협/사극</label>
                <input type="checkbox" name="genre_type" id="drama">
                <label for="drama">드라마</label>
                <input type="checkbox" name="genre_type" id="sports">
                <label for="sports">스포츠</label>
            </div> <!--TODO : DB 컬럼 명과 input name 값 일치 시키고, 쿼리 작성 해야함-->
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="input_summary">한 줄 요약</label>
            <input type="text" name="summary" id="input_summary">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="input_story">줄거리 : 소설, 만화</label>
            <input type="text" name="story" id="input_story">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <label for="input_thumbnail">썸네일</label>
            <input type="file" name="thumbnail" id="input_thumbnail">
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <a href="/gallery/insertCard">
                <button>등록</button>
            </a>
        </div>
        <div class="col-md-6">
            <button>돌아가기</button>
        </div>
    </div>
</div>
</body>
</html>
