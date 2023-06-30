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
<div class="container-xl">
  <form action="/gallery/search">
    <input type="hidden" name="tableName" value="VIEW_GALLEY_CARDS">
    <input type="hidden" name="typeCode" value="${categoryType}">
    <div class="row">
      <div class="col-12 search-box p-0">
        <select name="searchCode">
          <c:forEach items="${searchConditions}" var="searchCondition">
            <option value="${searchCondition.code}">${searchCondition.name}</option>
          </c:forEach>
        </select>
        <input type="text" name="searchQuery">
        <c:forEach items="${sortConditions}" var="sortContidion" varStatus="status">
          <input class="d-none d-md-block" type="radio" name="sortCode" value="${sortContidion.code}" id="sort1-${sortContidion.code}"
                 <c:if test="${status.index == 0}">checked</c:if>>
          <label class="d-none d-md-block" class="sortLabel" for="sort1-${sortContidion.code}">${sortContidion.name}</label>
        </c:forEach>
        <div class="vr mx-2 d-none d-md-block"></div>
        <button type="submit" class="common-button d-none d-md-block"><i class="bi bi-search"></i></button>
      </div>
      <div class="col-12 d-md-none search-box">
        <c:forEach items="${sortConditions}" var="sortContidion" varStatus="status">
          <input class="d-block d-md-none" type="radio" name="sortCode" value="${sortContidion.code}" id="sort2-${sortContidion.code}"
                 <c:if test="${status.index == 0}">checked</c:if>>
          <label class="d-block d-md-none" class="sortLabel" for="sort2-${sortContidion.code}">${sortContidion.name}</label>
        </c:forEach>
        <div class="vr mx-2 d-block d-md-none"></div>
        <button type="submit" class="common-button d-block d-md-none ms-auto"><i class="bi bi-search"></i></button>
      </div>
    </div>
  </form>
  <div class="row gallery-content m-0">
    <c:forEach items="${cards}" var="card">
      <div class="col-md-6">
        <div class="gallery-card" onclick="location.href='/gallery/${card.seq}'">
          <div class="card-body">
            <div class="thumbnail_url">
              <img class="thumbnail" src="/resources${card.thumbnail_url}" alt="/resources/img/default_img.jpg" onerror="this.src='/resources/img/default_img.jpg'">
            </div>
            <div class="side-info">
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
</body>
</html>
