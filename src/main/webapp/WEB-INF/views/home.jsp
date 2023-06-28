<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <!-- 공통 script & css -->
  <c:import url="${path}/resources/js/scripts.jsp"/>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
</head>
<body class="h-100">
<!-- GNB & LNB -->
<c:import url="${path}/resources/js/GNB.jsp">
  <c:param name="pageName" value="home"/>
  <c:param name="btnNum" value="1"/>
</c:import>
<!-- CONTENTS -->
<div class="container-xl position-relative p-0 d-md-none">
  <c:forEach items="${gallery}" var="categoryType">
    <div class="carousel slide" id="card-carousel-${categoryType.code}" data-bs-ride="carousel">
      <div class="carousel-inner">
        <c:forEach items="${cards[categoryType.code]}" var="card" varStatus="status">
          <div class="carousel-item
            <c:if test="${status.first}">
              active
            </c:if>
          ">
            <div class="row gallery-content m-0">
              <div class="col-12">
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
                          <p class="ddd">${card.title}</p>
                      </div>
                      <div class="writer">
                          <p class="ddd">${card.member_name}</p>
                      </div>
                    </div>
                  </div>
                  <div class="catchphrase">
                      ${card.catchphrase}
                  </div>
                </div>
              </div>
            </div>
          </div>
        </c:forEach>
        <button class="carousel-control-prev" type="button" data-bs-target="#card-carousel-${categoryType.code}"
                data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#card-carousel-${categoryType.code}"
                data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </div>
  </c:forEach>
</div>


<div class="container-xl bg-secondary position-relative p-0 d-none d-md-block">
  <c:forEach items="${gallery}" var="categoryType">
    <div class="carousel slide" id="card-carousel-md-${categoryType.code}" data-bs-ride="carousel">
      <div class="carousel-inner">
        <c:forEach items="${cards[categoryType.code]}" var="card" varStatus="status">
          <c:if test="${status.index % 2 == 0}">
            <c:choose>
              <c:when test="${status.first}">
                <div class="carousel-item active">
                <div class="row gallery-content m-0">
              </c:when>
              <c:otherwise>
                <div class="carousel-item">
                <div class="row gallery-content m-0">
              </c:otherwise>
            </c:choose>
          </c:if>
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
          <c:if test="${status.index % 2 == 1}">
            </div>
            </div>
          </c:if>
          <c:if test="${status.last}">
            <c:if test="${status.index % 2 == 0}">
              </div>
              </div>
            </c:if>
          </c:if>
        </c:forEach>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#card-carousel-md-${categoryType.code}"
              data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#card-carousel-md-${categoryType.code}"
              data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </c:forEach>
</div>

<!-- FOOTER -->
<c:import url="${path}/resources/js/FOOTER.jsp"/>
<!-- script - Contents -->
<script>
    const cardEnter = function (e) {
        $(e.target.closest('.gallery-card')).addClass('card-hover');
    };
    const cardLeave = function (e) {
        $(e.target.closest('.gallery-card')).removeClass('card-hover');
    };

    const carousel = $('.carousel');
    const card = $('.gallery-card');

    card.on('mouseenter', cardEnter);
    card.on('mouseleave', cardLeave);

    carousel.on('slide.bs.carousel', function () {
        $(this).addClass('carousel-event');
    });
    carousel.on('slid.bs.carousel', function () {
        $(this).removeClass('carousel-event');
    });
</script>
</body>
</html>