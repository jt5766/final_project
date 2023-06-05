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
            <label for="input_title">
                제목
                <input type="text" name="title" id="input_title">
            </label>
            <div class="genre">
                <label for="romance">
                    <input type="checkbox" name="genre" id="romance">
                </label>
                <label for="fantasy">
                    <input type="checkbox" name="genre" id="fantasy">
                </label>
                <label for="action">
                    <input type="checkbox" name="genre" id="action">
                </label>
                <label for="thriller">
                    <input type="checkbox" name="genre" id="thriller">
                </label>
                <label for="comedy">
                    <input type="checkbox" name="genre" id="comedy">
                </label>
                <label for="wuxia">
                    <input type="checkbox" name="genre" id="wuxia">
                </label>
                <label for="drama">
                    <input type="checkbox" name="genre" id="drama">
                </label>
                <label for="sports">
                    <input type="checkbox" name="genre" id="sports">
                </label>
            </div>
            <label for="input_summary">
                <input type="text" name="summary" id="input_summary">
            </label>
            <label for="input_story">
                <input type="text" name="story" id="input_story">
            </label>
            <label for="input_thumbnail">
                <input type="file" name="thumbnail" id="input_thumbnail">
            </label>
        </div>
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
