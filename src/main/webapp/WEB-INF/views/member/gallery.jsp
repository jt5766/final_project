<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
  <c:import url="${path}/resources/js/scripts.jsp"/>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
  <style>
      * {
          border: 1px solid black;
          box-sizing: border-box;
      }

      .secrete {
          color: red;
      }
  </style>
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp"/>
<div id="lnb">
  <h3 class="text-center">마이페이지</h3>
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-xl justify-content-evenly btn-group">
      <button class="btn btn-outline-dark" onclick="location.href='/member/my-page/gallery'">갤러리</button>
      <button class="btn btn-outline-dark" onclick="location.href='/member/my-page/community'">커뮤니티</button>
      <button class="btn btn-outline-dark" onclick="location.href='/chat/testlink'">1:1 채팅</button>
      <button class="btn btn-outline-dark" onclick="location.href='/member/myinfo'">회원 정보 수정</button>
    </div>
  </nav>
</div>
<div class="container-xl" id="my-content">
  <c:forEach items="${cards}" var="entry" varStatus="status">
    <div class="row">
      <c:forEach items="${gallery}" var="category">
        <c:if test="${category.code eq entry.key}">
          <div class="col-12">
            <b>${category.name}</b>
          </div>
        </c:if>
      </c:forEach>
      <c:forEach items="${entry.value}" var="card">
        <div class="col-12 d-flex justify-content-around">
          <div class="category">
              ${card.title}
          </div>
        </div>
      </c:forEach>
    </div>
  </c:forEach>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
</body>
</html>
