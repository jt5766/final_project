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
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<style>
        *{box-sizing: border-box;}
        div{border: 1px solid black;}
        #div_contents{height: 700px; overflow: auto;}
        #div_text{height: 100px; overflow: auto;}
        .btn{width: 100%; height: 100%; background-color: gray;color: black;}
        .btn:hover{background-color: black;color:gray;}
        .mytext{text-align: right;}
        .othertext{text-align: left;}
    </style>
</head>
<body>
	<script>
		$(function(){
			const socket = new WebSocket("ws://192.168.50.203/chat");
			const stompClient = Stomp.over(socket);
			
			stompClient.connect({},function(){
				alert("접속 성공");
				const subscription = stompClient.subscribe("/topic/${chatseq}", function(message){
					body = JSON.parse(message.body);
					console.log(message);
					console.log(body);
					const linediv = $("<div>");
					const textdiv = $("<div>");
					if(body.writer == ${code}){
						textdiv.addClass("mytext");
						textdiv.append(body.txt);
					}else{
						textdiv.addClass("othertext");
						textdiv.append(body.writer+" : "+body.txt);
					}
					linediv.append(textdiv);
					$("#div_contents").append(linediv);
				});
			},function(){
				alert("접속 실패");
			});
			
			$("#button_send").on("click",function(){
				const destination = "/app/message";
				const header = {};
				const body = JSON.stringify({chat_rooms : "${chatseq}" , writer : "${code}" , txt : $("#div_text").html()});
				stompClient.send(destination,header,body);
			})
		})
	</script>
    <div class="container-fluid">
        <div class="row gnb">gnb</div>
	    <div class="row lnb">lnb</div>
    </div>
    <div class="container-xl">
        <div class="row">
            <div class="col-md-12" id="div_contents">
            	<c:forEach var="log" items="${chatlog}">
            		<c:choose>
            			<c:when test="${log.writer==code}">
            				<div>
            					<div class="mytext">${log.txt}</div>
            				</div>
            			</c:when>
            			<c:otherwise>
            				<div>
            					<div class="othertext">${log.writer} : ${log.txt}</div>
            				</div>
            			</c:otherwise>
            		</c:choose>
            		
            	</c:forEach>
            </div>
        </div>
        <div class="row">
                <div class="col-md-10" contenteditable="true" id="div_text"></div>
            <div class="col-md-2 p-0">
                <button class="btn" id="button_send">작성</button>
            </div>
        </div>
        
    </div>
</body>
</html>