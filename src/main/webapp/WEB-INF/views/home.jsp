<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 공통 script & css -->
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>
<body class="h-100">
	<!-- GNB & LNB -->
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="home" />
		<c:param name="btnNum" value="1" />
	</c:import>	
	<!-- CONTENTS -->
	<div class="container-xl bg-secondary position-relative p-0">

	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
</body>
</html>