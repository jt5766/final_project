<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
    <style>
        .card-info {
            display: flex;
            min-height: 180px;
            background-color: #36454f15;
        }

        .thumbnail_url {
            flex: 100px 0 0;
        }

        .card-body {
            display: flex;
            flex-flow: column nowrap;
            padding-left: 5px;
            flex: 2 0 0;
        }

        .card-body > div {
            flex: 1 0 0;
        }

        .card-body > .info {
            display: flex;
            justify-content: left;
            justify-self: flex-start;
            flex: 0;
        }

        .info > div {
            min-width: 2rem;
            padding: 1px 5px;
            border-top-left-radius: 8px;
            border-top-right-radius: 8px;
            margin: 0 3px 0 0;
            text-align: center;
        }

        .ai {
            background-color: deeppink;
            color: white;
        }

        .category {
            background-color: limegreen;
        }

        .genre-name {
            background-color: lightgray;
        }

        .card-body > .title {
            font-size: 20pt;
            flex: 2 0 0;
        }

        .side-menu {
            flex: 1 0 0;
            display: flex;
            flex-direction: column;
        }

        .side-menu > div {
            flex: 1;
            display: flex;
            justify-content: end;
            min-height: 20px;
        }

        button {
            cursor: pointer;
        }

        .common-button {
            display: inline-block;
            min-width: 5rem;
            background-color: #36454f;
            color: white;
            border-radius: 10px;
            margin: 5px;
        }

        .thumbnail {
            width: 100px;
            height: 100px;
        }

        #delete-form {
            margin: 0;
            padding: 0;
            display: flex;
            height: 100%;
        }

        #insert-button {
            display: block;
            width: 100%;
            padding: 6px;
            text-align: center;
            border-radius: 10px;
            background-color: #36454f;
        }

        .disclosure > div {
            margin: 0;
            padding: 0;
        }

        .content-link {
            padding: 5px 15px;
            margin: 3px 0;
            background-color: #44444490;
            cursor: pointer;
            transition-duration: 500ms;
            border-radius: 10px;
        }

        .content-link:hover {
            background-color: #444444;
            color: white;
        }
    </style>
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp"/>
<div class="container-xl">
    <div class="row">
        <div class="col-md-12 card-info">
            <div class="thumbnail_url">
                <img class="thumbnail" src="/resources${card.thumbnail_url}" alt="${card.thumbnail_url}">
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
                    <c:if test="${card.ai == 'Y'}">
                        <div class="ai">AI</div>
                    </c:if>
                </div>
                <div class="title">
                    ${card.title}
                </div>
                <div class="writer">
                    작성자 : ${card.member_name}
                </div>
                <div class="catchphrase">
                    요약 : ${card.catchphrase}
                </div>
                <div class="synopsis">
                    줄거리 : ${card.synopsis}
                </div>
            </div>
            <div class="side-menu">
                <div class="chat-button">
                    <c:if test="${sessionScope.memberType == '2000'}">
                        <button class="common-button" type="button" id="invite">채팅 초대하기</button>
                    </c:if>
                </div>
                <div class="disclosure">
                    <c:if test="${sessionScope.code == card.writer}">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" role="switch" id="chk-disclosure"
                                   <c:if test="${card.yn == 'Y'}">checked value="Y"</c:if>
                                   <c:if test="${card.yn == 'N'}">value="N"</c:if>
                            >
                            <label class="form-check-label" for="chk-disclosure">공개 여부</label>
                        </div>
                    </c:if>
                </div>
                <div class="buttons">
                    <c:if test="${sessionScope.code == card.writer}">
                        <form id="delete-form" action="/gallery/${card.seq}/delete" method="post">
                            <input type="hidden" name="cardSeq" value="${card.seq}">
                            <button class="common-button" type="submit">삭제</button>
                        </form>
                        <button class="common-button" onclick="location.href='/gallery/${card.seq}/modify/${card.category_type}'">수정</button>
                    </c:if>
                </div>
                <div class="return-button">
                    <button class="common-button" type="button" onclick="location.href='/gallery'">돌아가기</button>
                </div>
            </div>
        </div>
    </div>
    <c:if test="${sessionScope.code == card.writer}">
        <div class="row">
            <div class="col-md-12 my-2">
                <button id="insert-button" type="button"
                        onclick="location.href='/gallery/${card.seq}/contents/insert/${card.category_type}'">등록하기
                </button>
            </div>
        </div>
    </c:if>
    <div class="row">
        <div class="col-md-12 hstack gap-2">
            <a href="/gallery/${card.seq}?sort=desc" class="ms-auto">최신순</a>
            <div class="vr"></div>
            <a href="/gallery/${card.seq}?sort=asc">오래된순</a>
        </div>
    </div>
    <c:forEach items="${contents}" var="content">
        <div class="row">
            <div class="col-md-12">
                <div onclick="location.href='/gallery/${card.seq}/contents/${content.seq}'" class="content-link">
                        ${content.title}
                </div>
                    <%--                <a href="/gallery/${card.seq}/contents/${content.seq}">${content.title}</a>--%>
            </div>
        </div>
    </c:forEach>
    <div class="row">
        <div class="col-md-6">
            <nav>
                <ul class="pagination">
                    <c:forEach items="${navi}" var="n" varStatus="status">
                        <c:choose>
                            <c:when test="${n == 'Prev'}">
                                <li class="page-items">
                                    <a class="page-link"
                                       href="${requestURI}?${queryString}&page=${navi[1] - 1}">${n}</a>
                                </li>
                            </c:when>
                            <c:when test="${n == 'Next'}">
                                <li class="page-items">
                                    <a class="page-link"
                                       href="${requestURI}?${queryString}&page=${navi[status.index - 1] + 1}">${n}</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-items">
                                    <a class="page-link" href="${requestURI}?${queryString}&page=${n}">${n}</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </ul>
            </nav>
        </div>
    </div>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
<script>
    $('#invite').on('click', function () {
        $.ajax({
            url: "/chat/application",
            data: {
                mentor:${sessionScope.code},
                mentee:${card.writer}
            },
            method: "post"
        }).done(function (resp) {
            console.log(resp);
        });
    });
    $('#chk-disclosure').on('click', function () {
        const chkDom = $('#chk-disclosure');
        if (chkDom.val() === 'Y') {
            chkDom.val('N');
        } else if (chkDom.val() === 'N') {
            chkDom.val('Y');
        }
        $.ajax({
            url: "/gallery/disclosure/${card.seq}",
            data: chkDom.val(),
            contentType: "application/x-www-form-urlencoded",
            accepts: {plainText: "application/json"},
            method: "put"
        });
    });
</script>
</body>
</html>
