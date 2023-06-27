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
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
	<style>
        *{box-sizing: border-box;}
        #div_contents{height: 650px; overflow: auto;background-color:#f5f5f5;}
        .mylinebox{overflow: auto;display:flex;justify-content:flex-start;flex-direction:row-reverse;}
        .otherlinebox{overflow: auto;display:flex;justify-content:flex-start;}
        .mytext{float:right;max-width:35%;word-break:break-all;padding-left:2px;padding-right:2px;background-color:gray;border: 1px solid black;margin-top:10px;margin-bottom:10px;border-radius:5px;}
        .othertext{float:left;max-width:35%;word-break:break-all;padding-left:2px;padding-right:2px;background-color:white;border: 1px solid black;margin-top:10px;margin-bottom:10px;border-radius:5px;}
        #div_text{height: 100px; overflow: auto;}
        .btn{width: 100%; height: 100%; background-color: gray;color: black;}
        .btn:hover{background-color: black;color:gray;}
        .otherdatebox{float:left;padding-right:2px;align-self:end;margin-bottom:8px;}
        .mydatebox{float:right;padding-right:2px;align-self:end;margin-bottom:8px;}
        .alldatebox{overflow: auto;background-color:#778C86;text-align:center;}
    </style>
</head>
<body>
	<script>
		let regexSize = /^.{0,500}$/s;
		let regexSinglequotation = /\'/g;
		let year = null;
		let month = null;
		let date = null;
		let addYear = null;
		let addMonth = null;
		let addDate = null;
		$(function(){
			const socket = new WebSocket("ws://3.39.227.39/chat");
			const stompClient = Stomp.over(socket);
			
			stompClient.connect({},function(){
				const subscription = stompClient.subscribe("/topic/${chatseq}", function(message){
					body = JSON.parse(message.body);
					console.log(message);
					console.log(body);
					const linediv = $("<div>");
					const datediv = $("<div>");
					const textdiv = $("<div>");
					const replbackslash = body.txt.replace(/\\\\/g,"\\");
					const realTimeText = replbackslash.replace(/\\'/g,"\'");
					if(body.writer == ${code}){
						linediv.addClass("mylinebox");
						datediv.addClass("mydatebox");
						textdiv.addClass("mytext");
						textdiv.append(realTimeText);
					}else{
						const writerbox = $("<div>");
						writerbox.addClass("writerbox");
						writerbox.append(body.writernickname);
						linediv.append(writerbox);
						linediv.addClass("otherlinebox");
						datediv.addClass("otherdatebox");
						textdiv.addClass("othertext");
						textdiv.append(realTimeText);
					}
					var plustimer = new Date(body.write_date);
					var plusYear = plustimer.getFullYear();
					var plusMonth = plustimer.getMonth();
					var plusDate = plustimer.getDate();
					if(plusYear != addYear || plusMonth != addMonth || plusDate != addDate){
						var plusdatediv = $("<div>");
						plusdatediv.addClass("alldatebox");
        				plusdatediv.append(plusYear+"-"+(plusMonth+1)+"-"+plusDate);
        				$("#div_contents").append(plusdatediv);
					}
					datediv.append(plustimer.getHours()+" : "+plustimer.getMinutes());
					linediv.append(textdiv);
					linediv.append(datediv);
					$("#div_contents").append(linediv);
					addYear = plusYear;
					addMonth = plusMonth;
					addDate = plusDate;
					let chatbox = document.querySelector('#div_contents');
					chatbox.scrollTop = chatbox.scrollHeight;
				});
				let chatbox = document.querySelector('#div_contents');
				chatbox.scrollTop = chatbox.scrollHeight;
			},function(){
				alert("접속 실패");
			});
			
			$("#div_text").on("keydown",function(e){
				if(e.key == "Enter" && e.shiftKey){
						
				}else if(e.key == "Enter"){
					e.preventDefault();
					if($("#div_text").text().trim() == ""){
						return false;
					}else{
						const regexText = $("#div_text").html();
						if(!regexSize.test(regexText)){
							alert("500자 이하로 작성해주세요.");
							return false;
						}
						const backslash = $("#div_text").html().replace(/\\/g,"\\\\");
						const updateText = backslash.replace(regexSinglequotation,"\\'");
						const destination = "/app/message";
						const header = {};
						const body = JSON.stringify({chat_rooms : "${chatseq}" , writer : "${code}" , txt : updateText , write_date : new Date() , writernickname : "${nickName}"});
						stompClient.send(destination,header,body);
						$("#div_text").html("");
						$("#div_text").focus();
					}
				}
			})
			
			$("#button_send").on("click",function(){
				if($("#div_text").text().trim() == ""){
					return false;
				}else{
					const regexText = $("#div_text").html();
					if(!regexSize.test(regexText)){
						alert("500자 이하로 작성해주세요.");
						return false;
					}
					const backslash = $("#div_text").html().replace(/\\/g,"\\\\");
					const updateText = backslash.replace(regexSinglequotation,"\\'");
					const destination = "/app/message";
					const header = {};
					const body = JSON.stringify({chat_rooms : "${chatseq}" , writer : "${code}" , txt : updateText , write_date : new Date() , writernickname : "${nickName}"});
					stompClient.send(destination,header,body);
					$("#div_text").html("");
					$("#div_text").focus();
				}
			})
			
			let lastScroll = 0;
			let dragFlag = false;
			let lengthsize = false;
			
			$("#div_contents").scroll(function(e){
				if (dragFlag || lengthsize){
					return;
				}
				let currentScroll = $(this).scrollTop();
				let contents_height = $("#div_contents").height();
				
				let now_height = $(this).scrollTop()+$("#div_contents").height();
				console.log("라스트 스크롤"+lastScroll)
				console.log("커런트 스크롤"+currentScroll);
				console.log("최대높이"+contents_height);
				console.log("커런트+최대높이"+now_height);
				if(currentScroll < lastScroll){
					if(currentScroll < 500){
						
						dragFlag = true;
						
						$.ajax({
							url: "/chatlog",
							method:"post",
							data:{
								seq:"${chatseq}"
							}
						}).done(function(resp){
							console.log(resp);
							if(resp.length == 0){
								lengthsize = true;
								var alldatediv = $("<div>");
	        					alldatediv.addClass("alldatebox");
		        				alldatediv.append(year+"-"+(month+1)+"-"+date);
		        				$("#div_contents").prepend(alldatediv);
							}
							for(var i = 0;i < resp.length;i++){
								const datalinediv = $("<div>");
								const datadatediv = $("<div>");
								const datatextdiv = $("<div>");
								if(resp[i].writer == ${code}){
									datalinediv.addClass("mylinebox");
									datadatediv.addClass("mydatebox");
									datatextdiv.addClass("mytext");
									datatextdiv.append(resp[i].txt);
								}else{
									const datawriterbox = $("<div>");
									datawriterbox.addClass("writerbox");
									datawriterbox.append(resp[i].writernickname);
									datalinediv.append(datawriterbox);
									datalinediv.addClass("otherlinebox");
									datadatediv.addClass("otherdatebox");
									datatextdiv.addClass("othertext");
									datatextdiv.append(resp[i].txt);
								}
								var logtimer = new Date(resp[i].write_date);
								var logYear = logtimer.getFullYear();
				        		var logMonth = logtimer.getMonth();
				        		var logDate = logtimer.getDate();
				        		if(i == 0){
				        			console.log("year"+year+"/month"+(month+1)+"/date"+date);
				        			console.log("logYear"+logYear+"/logMonth"+(logMonth+1)+"/logDate"+logDate);
				        			if(year != null && month != null && date != null){
				        				if(year != logYear || month != logMonth || date != logDate){
				        					var alldatediv = $("<div>");
				        					alldatediv.addClass("alldatebox");
					        				alldatediv.append(year+"/"+(month+1)+"/"+date);
					        				$("#div_contents").prepend(alldatediv);
				        				}
				        			}
				        		}else if(i>0){
				        			var beforetimer = new Date(resp[i-1].write_date);
				        			var beforeYear = beforetimer.getFullYear();
					        		var beforeMonth = beforetimer.getMonth();
					        		var beforeDate = beforetimer.getDate();
				        			if(beforeYear != logYear || beforeMonth != logMonth || beforeDate != logDate){
				        				var alldatediv = $("<div>");
				        				alldatediv.addClass("alldatebox");
				        				alldatediv.append(beforeYear+"-"+(beforeMonth+1)+"-"+beforeDate);
				        				$("#div_contents").prepend(alldatediv);
				        			}
				        			if(i == (resp.length-1)){
					        			console.log("lastYear"+logYear+"/lastMonth"+(logMonth+1)+"/lastDate"+logDate);
					        			year = logYear;
					        			month = logMonth;
					        			date = logDate;
					        		}
				        		}
								datadatediv.append(logtimer.getHours()+" : "+logtimer.getMinutes());
								datalinediv.append(datatextdiv);
								datalinediv.append(datadatediv);
								$("#div_contents").prepend(datalinediv);
							}
							dragFlag = false;
							let chatbox = document.querySelector('#div_contents');
						})
					}
				}
				lastScroll = currentScroll;
			})
		})
		$(function(){
			let chatlog = [];
			<c:forEach var="log" items="${chatlog}">
				chatlog.push({writer:'${log.writer}',txt:'${log.txt}',write_date:'${log.write_date}',writernickname:'${log.writernickname}'});
			</c:forEach>
			console.log(chatlog);
			for(i = 0; i <chatlog.length; i++){
				const datalinediv = $("<div>");
				const datadatediv = $("<div>");
				const datatextdiv = $("<div>");
				if(chatlog[i].writer == ${code}){
					datalinediv.addClass("mylinebox");
					datadatediv.addClass("mydatebox");
					datatextdiv.addClass("mytext");
					datatextdiv.append(chatlog[i].txt);
				}else{
					const datawriterbox = $("<div>");
					datawriterbox.addClass("writerbox");
					datawriterbox.append(chatlog[i].writernickname);
					datalinediv.append(datawriterbox);
					datalinediv.addClass("otherlinebox");
					datadatediv.addClass("otherdatebox");
					datatextdiv.addClass("othertext");
					datatextdiv.append(chatlog[i].txt);
				}
				var logtimer = new Date(chatlog[i].write_date);
				var logYear = logtimer.getFullYear();
        		var logMonth = logtimer.getMonth();
        		var logDate = logtimer.getDate();
        		if(i == 0){
        			const firsttimer = new Date(chatlog[i].write_date);
        			var firstYear = firsttimer.getFullYear();
        			var firstMonth = firsttimer.getMonth();
        			var firstDate = firsttimer.getDate();
        			addYear = firstYear;
        			addMonth = firstMonth;
        			addDate = firstDate;
        		}else if(i>0){
        			var beforetimer = new Date(chatlog[i-1].write_date);
        			var beforeYear = beforetimer.getFullYear();
	        		var beforeMonth = beforetimer.getMonth();
	        		var beforeDate = beforetimer.getDate();
        			if(beforeYear != logYear || beforeMonth != logMonth || beforeDate != logDate){
        				var alldatediv = $("<div>");
        				alldatediv.addClass("alldatebox");
        				alldatediv.append(beforeYear+"-"+(beforeMonth+1)+"-"+beforeDate);
        				$("#div_contents").prepend(alldatediv);
        			}
        			if(i == (chatlog.length-1)){
	        			console.log("lastYear"+logYear+"/lastMonth"+(logMonth+1)+"/lastDate"+logDate);
	        			year = logYear;
	        			month = logMonth;
	        			date = logDate;
	        		}
        		}
				datadatediv.append(logtimer.getHours()+" : "+logtimer.getMinutes());
				datalinediv.append(datatextdiv);
				datalinediv.append(datadatediv);
				$("#div_contents").prepend(datalinediv);
			}
		})
	</script>
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="mypage" />
		<c:param name="btnNum" value="1003" />
	</c:import>	
	<div class="container-xl bg-secondary position-relative p-0">
        <div class="row m-0">
            <div class="col-md-12" id="div_contents">
            </div>
        </div>
        <div class="row m-0">
                <div class="col-md-10" contenteditable="true" id="div_text"></div>
            <div class="col-md-2 p-0">
                <button class="btn" id="button_send">작성</button>
            </div>
        </div>
    </div>
    <c:import url="${path}/resources/js/FOOTER.jsp" />
</body>
</html>