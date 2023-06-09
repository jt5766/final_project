<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Kreate-Hub : My page</title>
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
<link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
</head>
<body>
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="mypage" />
		<c:param name="btnNum" value="${sessionScope.mypageCode}" />
	</c:import>
	<div class="container-xl">
		<div id="accordion">
			<c:forEach items="${community}" var="category">
				<c:choose>
					<c:when test="${category.code == 1001}">
					</c:when>
					<c:otherwise>
						<section class="d-flex justify-content-center align-items-center accordion-head">
							<h4 class="category-head m-0">${category.name}</h4>
						</section>
					</c:otherwise>
				</c:choose>
				<div>
					<c:forEach items="${communities[category.code]}" var="community_">
						<c:choose>
							<c:when test="${community_.board_type == 1001}">
							</c:when>
							<c:when test="${community_.board_type == 1005}">
								<p class="content-link" onclick="location.href='/community/toComplaintView?seq=${community_.seq}&board_type=${community_.board_type}'">${community_.title}</p>
							</c:when>
							<c:otherwise>
								<p class="content-link" onclick="location.href='/community/toBoardView?seq=${community_.seq}&board_type=${community_.board_type}'">${community_.title}</p>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<script>
	$("#accordion").accordion({
	    collapsible : true,
	    heightStyle : "content",
	    header : "section",
	    active : [ 0, 1 ]
	});
    </script>
</body>
</html>
