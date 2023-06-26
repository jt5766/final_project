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
          box-sizing: border-box;
      }

      .secrete {
          color: salmon;
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

      .common-button {
          display: inline-block;
          min-width: 5rem;
          background-color: #36454f;
          color: white;
          border-radius: 10px;
          margin: 5px;
      }
  </style>
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="mypage"/>
  <c:param name="btnNum" value="${sessionScope.mypageCode}"/>
</c:import>
<div class="container-xl p-0" id="my-content">
  <c:forEach items="${cards}" var="entry" varStatus="status">
    <div class="row">
      <c:forEach items="${gallery}" var="category">
        <c:if test="${category.code eq entry.key}">
          <div class="col-12 d-flex justify-content-between">
            <b>${category.name}</b>
            <button type="button" class="common-button" onclick="location.href='/gallery/insert/${category.code}'">새로
              입력
            </button>
          </div>
        </c:if>
      </c:forEach>
    </div>
    <c:forEach items="${entry.value}" var="card">
      <div class="row">
        <div class="col-md-12">
          <c:if test="${card.yn eq 'N'}">
            <div onclick="location.href='/gallery/${card.seq}'" class="content-link secrete">
                ${card.title} - 비공개 카드입니다.
            </div>
          </c:if>
          <c:if test="${card.yn ne 'N'}">
            <div onclick="location.href='/gallery/${card.seq}'" class="content-link">
                ${card.title}
            </div>
          </c:if>
        </div>
      </div>
    </c:forEach>
  </c:forEach>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
</body>
</html>