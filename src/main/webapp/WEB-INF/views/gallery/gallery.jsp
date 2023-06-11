<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>K-Hub :: Gallery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            border: 1px solid black;
        }
        .thumbnail{
            width: 100px;
            height: 100px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row gnb">
            <div class="col-md-12">

            </div>
        </div>
        <div class="row lnb">
            <div class="col-md-12">
                <!-- TODO: 버튼 누를 때 마다 카테고리별로 필터링 -->
                <button onclick="location.href='/gallery/category/1001'">소설</button>
                <button onclick="location.href='/gallery/category/1002'">만화</button>
                <button onclick="location.href='/gallery/category/1003'">그림</button>
                <button onclick="location.href='/gallery/category/1004'">사진</button>
                <button onclick="location.href='/gallery/category/1005'">영상</button>
                <button onclick="location.href='/gallery/category/1006'">음악</button>
            </div>
        </div>
    </div>
<div class="container-xl">
    <div class="row search-box">
        <div class="col-md-12">
            <select name="search-bound">
                <option value="title">제목</option>
                <option value="name">닉네임</option>
            </select>
            <input type="text" name="search-keyword">
            <!-- TODO: 버튼 누를 때 마다 order by 로 리스트 정렬 -->
            <a href="#"><span>new</span></a>
            <div class="vr"></div>
            <a href="#"><span>old</span></a>
            <div class="vr"></div>
            <a href="#"><span>pop</span></a>
        </div>
    </div>
    <div class="row gallery-content">
        <c:forEach items="${cards}" var="card">
            <div class="col-md-6">
                <div class="gallery-card">
                    <div class="thumbnail_url">
                        <img class="thumbnail" src="${card.thumbnail_url}" alt="${card.thumbnail_url}">
                    </div>
                    <div class="card-body">
                        <div class="info">
                            <div class="category">
                                ${card.category_name}
                            </div>
                            <c:if test="${card.genre_type1 != null}">
                                <div class="genre-name">${card.genre_name1}</div>
                            </c:if>
                            <c:if test="${card.genre_type2 != null}">
                                <div class="genre-name">${card.genre_name2}</div>
                            </c:if>
                        </div>
                        <div class="title" onclick="location.href='/gallery/${card.seq}'">
                            ${card.title}
                        </div>
                        <div class="writer">
                            ${card.member_name}
                        </div>
                        <div class="catchphrase">
                            ${card.catchphrase}
                        </div>
                        <div class="synopsis">
                            ${card.synopsis}
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <select name="categoryType" id="category">
        <option value="1001">소설</option>
        <option value="1002">만화</option>
        <option value="1003">그림</option>
        <option value="1004">사진</option>
        <option value="1005">영상</option>
        <option value="1006">음악</option>
    </select>
    <button type="button" id="to-insert">입력페이지로</button>
</div>
    <script>
        $('#to-insert').on('click', function () {
            location.href = '/gallery/insert/' + $('#category option:selected').val();
        });
    </script>
</body>
</html>
