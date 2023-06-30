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
<style>
	*{box-sizing: border-box;}
	.errorcontainer{background-color:white;}
	.errorimg{text-align: center;}
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
		<div class="col-12 errorimg">
			<image src="/resources/img/error.jpg"></image>
		</div>
	</div>
	<div class="row">
		<div class="col-12 alerttext">
			Internal Server Error.
		</div>
		<div class="col-12 alerttextbox">
			시스템에 에러가 발생하여 페이지를 표시 할 수 없습니다.
		</div>
		<div class="col-12 alerttextbox">
			관리자에게 문의하시거나 잠시 후 다시 시도하세요.
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