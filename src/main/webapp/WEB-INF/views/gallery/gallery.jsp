<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>K-Hub :: Gallery</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
            border: 1px solid black;
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
                <button>소설</button>
                <button>만화</button>
                <button>그림</button>
                <button>사진</button>
                <button>영상</button>
                <button>음악</button>
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
        </div>
    </div>
    <div class="row gallery-content">
        <div class="col-md-6">
            <div class="gallery-card">
                <div class="thumbnail">

                </div>
                <div class="card-body">
                    <div class="category">

                    </div>
                    <div class="title">

                    </div>
                    <div class="content">

                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="gallery-card">
                <div class="thumbnail">

                </div>
                <div class="card-body">
                    <div class="category">

                    </div>
                    <div class="title">

                    </div>
                    <div class="content">

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
