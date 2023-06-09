<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>403 Error</title>
  <c:import url="${path}/resources/js/scripts.jsp"/>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
  <link href="${path}/resources/css/gallery.css" type="text/css" rel="stylesheet">
<style>
	*{box-sizing: border-box;}
	.errorcontainer{background-color:white;}
	.errorimgbox{text-align: center;}
	.errorimg{width: 40vw;}
	.alerttext{font-size: 60px;margin-bottom: 20px;text-align: center;}
	.alerttextbox{text-align: center;}
	.buttonbox{margin-top: 5px;text-align: center;}
	.btn{border:1px solid black;}
</style>
</head>
<body class="h-100">
<c:import url="${path}/resources/js/GNB.jsp">
  	<c:param name="pageName" value="home"/>
  	<c:param name="btnNum" value="1"/>
</c:import>
<div class="container-xl position-relative p-0 errorcontainer">
	<div class="row">
		<div class="col-12 errorimgbox">
			<image src="/resources/img/error.jpg" class="errorimg"></image>
		</div>
	</div>
	<div class="row">
		<div class="col-12 alerttext">
			Forbidden.
		</div>
		<div class="col-12 alerttextbox">
			요청하신 페이지 접근이 거부되었습니다.
		</div>
		<div class="col-12 alerttextbox">
			입력하신 페이지의 주소가 정확한지 다시 한번 확인해주시길 바랍니다.
		</div>
	</div>
	<div class="row">
		<div class="col-12 buttonbox">
			<a href="/"><button class="btn">메인으로 바로가기</button></a>
		</div>
	</div>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>
</body>
</html>