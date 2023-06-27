<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<style>
        *{box-sizing: border-box;}
        .chatbox{background-color: #C7B299;margin:0px;margin-bottom:15px;}
        .testbox{border: 0px;height: 100px;background-color: #C7B299;}
        .btnbox{padding: 1%; padding-left: 0%;border: 0px;}
        .listbtn{width: 100%; height: 100%;background-color: #ca9372; color: white;}
        .listbtn:hover{background-color: black; color: gray;}
    </style>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>
<body>
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="mypage" />
		<c:param name="btnNum" value="1003" />
	</c:import>
	<div class="container-xl position-relative p-0">
    	<c:forEach var="chatroom" items="${chatlist}">
    		<c:choose>
    			<c:when test="${chatroom.yn == 'N'}">
    				<div class="row chatbox">
            			<div class="col-md-8 testbox">
                			멘토:${chatroom.mentorname} <br>
                			멘티:${chatroom.menteename}
                			<input type="hidden" value="${chatroom.seq}">
            			</div>
            			<div class="col-md-2 btnbox">
            				<c:if test="${chatroom.mentee==code}">
            					<a href="/chat/accept?seq=${chatroom.seq}"><button class="listbtn btn">승인</button></a>
            				</c:if>
            			</div>
            			<div class="col-md-2 btnbox">
                			<a href="/chat/refuse?seq=${chatroom.seq}"><button class="listbtn btn">거절</button></a>
            			</div>
					</div>
    			</c:when>
    			<c:otherwise>
    				<div class="row chatbox">
            			<div class="col-md-8 testbox">
                			멘토:${chatroom.mentorname} <br>
                			멘티:${chatroom.menteename}
                			<input type="hidden" value="${chatroom.seq}">	
            			</div>
            			<div class="col-md-2 btnbox">
                			<a href="/chat/entrance?seq=${chatroom.seq}"><button class="listbtn btn">입장</button></a>
            			</div>
            			<div class="col-md-2 btnbox">
                			<a href="/chat/refuse?seq=${chatroom.seq}"><button class="listbtn btn">나가기</button></a>
            			</div>
					</div>
    			</c:otherwise>
    		</c:choose>
		</c:forEach>
	</div>
	<c:import url="${path}/resources/js/FOOTER.jsp" />
</body>
</html>