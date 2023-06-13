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

        .gallery-card {
            display: flex;
            height: 300px;
        }

        .thumbnail {
            width: 100px;
            height: 100px;
            flex: 1;
        }

        .card-body {
            min-width: 300px;
            flex: 2;
            display: flex;
            flex-direction: column;
        }

        .info {
            flex: 10px 0 0;
            display: flex;
        }

        .category {
            background-color: limegreen;
            padding: 1px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            margin: 0 3px 0 0;
        }

        .genre-name {
            background-color: lightgray;
            padding: 1px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            margin: 0 3px 0 0;
        }

        .title {
            flex: 3;
            font-size: 15pt;
            color: navy;
        }

        .writer {
            flex: 2;
        }

        .catchphrase {
            flex: 1;
        }

        .synopsis {
            flex: 2;
        }

        .totalCount {
            flex: 1;
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
            <c:forEach items="${categoryTypes}" var="category">
                <button onclick="location.href='/gallery/category/${category.code}'">${category.name}</button>
            </c:forEach>
            <button onclick="location.href='/gallery'">전체</button>
        </div>
    </div>
</div>
<div class="container-xl">
    <form action="/gallery/search">
        <input type="hidden" name="tableName" value="VIEW_GALLEY_CARDS">
        <input type="hidden" name="typeCode" value="${categoryType}">
        <div class="row search-box">
            <div class="col-md-12">
                <select name="searchCode">
                    <c:forEach items="${searchConditions}" var="searchCondition">
                        <option value="${searchCondition.code}">${searchCondition.name}</option>
                    </c:forEach>
                </select>
                <input type="text" name="searchQuery">
                <c:forEach items="${sortConditions}" var="sortContidion" varStatus="status">
                    <input type="radio" name="sortCode" value="${sortContidion.code}" <c:if test="${status.index == 0}">checked</c:if>>${sortContidion.name}
                </c:forEach>
            </div>
        </div>
    </form>
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
                        <div class="totalCount">
                            <c:if test="${card.total_count != null}">
                                ${card.total_count}
                            </c:if>
                            <c:if test="${card.total_count == null}">
                                0
                            </c:if>
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
