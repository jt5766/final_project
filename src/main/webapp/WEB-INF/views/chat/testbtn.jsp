<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
</head>
<body>
	${memberdto.code}
	<br>
	${loginID}
	<br>
	<button id="testbtn">채팅 초대하기</button>
	<script>
		$("#testbtn").on("click",function(){
			$.ajax({
				url: "/chat/appication",
				data:{
					mentor:'${loginID}',
					mentee:'${memberdto.code}'
				}
			}).done(function(){
				$("#testbtn").css("display","none");
			})
		})
	</script>
</body>
</html>