<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>K-Hub :: Gallery</title>
    <style>
        * {
            box-sizing: border-box;
        }
        .top-bar {
            display: flex;
            justify-content: center;
        }
        .text-4 {
            font-size: 18pt;
            font-weight: bold;
            text-space: 0.2rem;
        }
        .tabs {
            list-style: none;
            display: flex;
            flex-flow: column;
            justify-content: center;
            padding: 0;
        }
        .tab {
            font-size: 14pt;
            color: white;
            background-color: #48d1cc95;
            padding: 0.8rem 2rem 0.8rem 2rem;
            margin: 0;
        }
        .search-box {
            display: flex;
            justify-content: center;
        }
        .search-type {
            flex: 4rem 0 0;
            padding: 3px;
        }
        .search-button {
            flex: 25px 0 0;
            height: 25px;
        }
        .search-keyword {
            flex: 8 0 0;
        }
        .content-body {
            display: flex;

        }
    </style>
</head>
<body>
    <div class="gnb"></div>

    <div class="top-bar">
        <p class="text-4">갤러리</p>
        <ul class="tabs">
            <li class="tab">소설</li>
            <li class="tab">만화</li>
            <li class="tab">그림</li>
            <li class="tab">사진</li>
            <li class="tab">영상</li>
            <li class="tab">음악</li>
        </ul>
    </div>
    <hr>
    <div class="search-box">
        <select class="search-type" name="searchType?">
            <option value="title">제목</option>
            <option value="name">닉네임</option>
        </select>
        <button class="search-button">
            🔍
        </button>
        <input type="text" class="search-keyword" name="search-keyword" id="searchKeyword">
    </div>
    <div class="content-body">
        <div class="card">

        </div>
    </div>

</body>
</html>
