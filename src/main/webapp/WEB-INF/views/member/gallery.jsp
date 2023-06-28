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
  <link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js" integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0=" crossorigin="anonymous"></script>
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="mypage"/>
  <c:param name="btnNum" value="${sessionScope.mypageCode}"/>
</c:import>
<div class="container-xl p-0">
  <div id="accordion">
    <c:forEach items="${gallery}" var="category">
      <section class="d-flex justify-content-center align-items-center accordion-head">
        <h4 class="category-head m-0">${category.name}</h4>
        <button type="button" class="common-button btn-position-right insert-button" id="${category.code}">신규 등록</button>
      </section>
      <div>
      <c:forEach items="${cards[category.code]}" var="card">
        <c:if test="${card.yn eq 'N'}">
          <p class="content-link secrete" onclick="location.href='/gallery/card/${card.seq}'">${card.title}  -  비밀글 입니다.</p>
        </c:if>
        <c:if test="${card.yn ne 'N'}">
          <p class="content-link" onclick="location.href='/gallery/card/${card.seq}'">${card.title}</p>
        </c:if>
      </c:forEach>
      </div>
    </c:forEach>
  </div>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
<script>
    $( "#accordion" ).accordion({
        collapsible: true,
        heightStyle: "content",
        header: "section",
        active: [0, 1]
    });
    $('.insert-button').on('click', function(e) {
        e.preventDefault();
        const seq = e.target.id;
        location.href=`/gallery/insert/\${seq}`;
    });
</script>
</body>
</html>