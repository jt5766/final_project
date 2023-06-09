<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
    <style>
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
</div>
<div class="container-xl">
    <div class="row card-info">
        <div class="col-md-12">
            <div class="thumbnail_url">
                <img class="thumbnail" src="${card.thumbnail_url}" alt="${card.thumbnail_url}">
            </div>
            <div class="card-body">
                <div class="info">
                    <c:if test="${card.ai == 'Y'}">
                        <div class="isai">
                            <div class="ai">AI 생성 그림입니다.</div>
                        </div>
                    </c:if>
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
                <div class="title">
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
            <div class="side-menu">
                <div class="chat-button">
                    <!--TODO: 세션에서 멤버 타입 확인해서 전문가만 보이게 변경-->
                    <button>채팅 초대하기</button>
                </div>
                <div class="buttons">
                    <!--TODO: 세션에서 멤버 ID 확인해서 작성자 본인만 보이게 변경-->
                    <form action="/gallery/card/${card.seq}/delete" method="post">
                        <input type="hidden" name="cardSeq" value="${card.seq}">
                        <button type="submit">삭제</button>
                    </form>
                    <button onclick="location.href='/gallery/card/${card.seq}/modify'">수정</button>
                </div>
                <div class="return-button">
                    <button type="button" onclick="location.href='/gallery'">돌아가기</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <button type="button" onclick="location.href='/gallery/card/${card.seq}/contents/insert/${card.category_type}'">등록</button>
            <!--TODO: 링크 제대로 안넘어감. 오류 수정해야함-->
        </div>
        <div class="col-md-12">
            <a href="#">최신</a><div class="vr"></div><a href="#">1화</a>
        </div>
    </div>
    <c:forEach items="${contents}" var="content">
        <div class="row">
            <div class="col-md-12">
                <a href="/gallery/card/${card.seq}/contents/${content.seq}">${content.title}</a>
            </div>
        </div>
    </c:forEach>
    <br>
</div>
</body>
</html>
