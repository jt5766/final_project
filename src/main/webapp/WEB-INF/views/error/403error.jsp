<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <c:import url="${path}/resources/js/scripts.jsp"/>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
</head>
<body class="h-100">
<c:import url="${path}/resources/js/GNB.jsp">
  	<c:param name="pageName" value="home"/>
  	<c:param name="btnNum" value="1"/>
</c:import>
403error
<c:import url="${path}/resources/js/FOOTER.jsp"/>
</body>
</html>