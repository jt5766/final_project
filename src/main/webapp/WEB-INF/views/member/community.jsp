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

      .category-head {
          background-color: #D4D4D4;
          margin-top: 10px;
          margin-bottom: 10px;
      }
      .category-head>div {
          min-height: 45px;
      }
  </style>
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="mypage" />
  <c:param name="btnNum" value="${sessionScope.mypageCode}" />
</c:import>
<div class="container-xl p-0" id="my-content">
  <c:forEach items="${communities}" var="entry" varStatus="status">
    <div class="row">
      <c:forEach items="${community}" var="category">
        <c:if test="${category.code eq entry.key}">
        <div class="col-12 category-head">
          <div class="d-flex justify-content-between align-items-center">
            <b>${category.name}</b>
          </div>
        </div>
        </c:if>
      </c:forEach>
      <c:forEach items="${entry.value}" var="community_">
        <div class="col-12">
          <c:choose>
            <c:when test="${community_.board_type == 1005}">
              <div onclick="location.href='/community/toComplaintView?seq=${community_.seq}'" class="content-link">
                  ${community_.title}
              </div>
            </c:when>
            <c:otherwise>
              <div onclick="location.href='/community/toBoardView?seq=${community_.seq}&board_type=${community_.board_type}'" class="content-link">
                ${community_.title}
              </div>
            </c:otherwise>
          </c:choose>
        </div>
      </c:forEach>
    </div>
  </c:forEach>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
</body>
</html>
