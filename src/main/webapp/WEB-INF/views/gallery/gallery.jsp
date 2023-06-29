<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
  <title>K-Hub :: Gallery</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
  <c:import url="${path}/resources/js/scripts.jsp"/>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
</head>
<body>
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="gallery"/>
  <c:param name="btnNum" value="${categoryType}"/>
</c:import>
<div class="container-xl p-0">
  <form action="/gallery/search">
    <input type="hidden" name="tableName" value="VIEW_GALLEY_CARDS">
    <input type="hidden" name="typeCode" value="${categoryType}">
    <div class="row">
      <div class="col-md-12 search-box">
        <!--TODO: 검색창 반응형 적용-->
        <select name="searchCode">
          <c:forEach items="${searchConditions}" var="searchCondition">
            <option value="${searchCondition.code}">${searchCondition.name}</option>
          </c:forEach>
        </select>
        <input type="text" name="searchQuery">
        <c:forEach items="${sortConditions}" var="sortContidion" varStatus="status">
          <input type="radio" name="sortCode" value="${sortContidion.code}" id="sort-${sortContidion.code}"
                 <c:if test="${status.index == 0}">checked</c:if>>
          <label class="sortLabel" for="sort-${sortContidion.code}">${sortContidion.name}</label>
        </c:forEach>
        <div class="vr mx-2"></div>
        <button type="submit" class="common-button">검색</button>
      </div>
    </div>
  </form>
  <div class="row gallery-content m-0">
    <c:forEach items="${cards}" var="card">
      <div class="col-md-6">
        <div class="gallery-card" onclick="location.href='/gallery/${card.seq}'">
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
          <div class="card-body">
            <div class="thumbnail_url">
              <img class="thumbnail" src="/resources${card.thumbnail_url}" alt="${card.thumbnail_url}">
            </div>
            <div class="side-info">
              <div class="title title-link">
                  ${card.title}
              </div>
              <div class="writer">
                  ${card.member_name}
              </div>
            </div>
          </div>
          <div class="catchphrase">
              ${card.catchphrase}
          </div>
        </div>
      </div>
    </c:forEach>
  </div>
  <div class="row">
    <div class="col-12 d-flex justify-content-center">
      <nav>
        <ul class="pagination">
          <c:forEach items="${navi}" var="n" varStatus="status">
            <c:choose>
              <c:when test="${n == 'Prev'}">
                <li class="page-items">
                  <a class="page-link" href="${requestURI}?${queryString}&page=${navi[1] - 1}">${n}</a>
                </li>
              </c:when>
              <c:when test="${n == 'Next'}">
                <li class="page-items">
                  <a class="page-link" href="${requestURI}?${queryString}&page=${navi[status.index - 1] + 1}">${n}</a>
                </li>
              </c:when>
              <c:when test="${page == n}">
                <li class="page-items">
                  <a class="page-link" id="currentPage" href="${requestURI}?${queryString}&page=${n}">${n}</a>
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
    $('#to-insert').on('click', function () {
        location.href = '/gallery/insert/' + $('#category option:selected').val();
    });
    $('#to-home').on('click', function () {
        location.href = '/';
    });
    const card = $('.gallery-card');
    card.on('mouseenter', function () {
        $(this).toggleClass('card-hover');
    });
    card.on('mouseleave', function () {
        $(this).toggleClass('card-hover');
    });
</script>
</body>
</html>
