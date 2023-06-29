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
        #div_contents{height: 650px; overflow: auto;background-color:white;}
        #div_contents::-webkit-scrollbar{display:none;}
        .mylinebox{overflow: auto;display:flex;justify-content:flex-start;flex-direction:row-reverse;}
        .otherlinebox{overflow: auto;display:flex;justify-content:flex-start;}
        .mytext{float:right;max-width:35%;word-break:break-all;padding-left:2px;padding-right:2px;background-color:#ca9372;border: 1px solid black;margin-top:10px;margin-bottom:10px;border-radius:5px;}
        .othertext{float:left;max-width:35%;word-break:break-all;padding-left:2px;padding-right:2px;background-color:#ca937250;border: 1px solid black;margin-top:10px;margin-bottom:10px;border-radius:5px;}
        #div_text{height: 100px; overflow: auto;background-color:white;border:1px solid gray;}
        #div_text::-webkit-scrollbar{display:none;}
        #button_send{width: 100%; height: 100%; background-color: #212529;color: white;}
        #button_send:hover{background-color: #6c757d;color:white;}
        .otherdatebox{float:left;padding-right:2px;align-self:end;margin-bottom:8px;}
        .mydatebox{float:right;padding-right:2px;align-self:end;margin-bottom:8px;}
        .alldatebox{overflow: auto;background-color:#c7b299;text-align:center;}
        .frontdatebox{overflow: auto;background-color:#c7b299;text-align:center;}
    </style>
</head>
<body>
	<script>
		let regexSize = /^.{0,500}$/s;
		let year = null;
		let month = null;
		let date = null;
		let addYear = null;
		let addMonth = null;
		let addDate = null;
		let beforeHours = null;
		let beforeMinutes = null;
		let beforewriter = null;
		let lastHours = null;
		let lastMinutes = null;
		let lastwriter = null;
		$(function(){
			const socket = new WebSocket("ws://localhost/chat");
			const stompClient = Stomp.over(socket);
			
			stompClient.connect({},function(){
				const subscription = stompClient.subscribe("/topic/${chatseq}", function(message){
					body = JSON.parse(message.body);
					const linediv = $("<div>");
					const datediv = $("<div>");
					const textdiv = $("<div>");
					const writerbox = $("<div>");
					const replbackslash = body.txt.replace(/\\\\/g,"\\");
					const realTimeText = replbackslash.replace(/\\'/g,"\'");
					if(body.writer == ${code}){
						linediv.addClass("mylinebox");
						datediv.addClass("mydatebox");
						textdiv.addClass("mytext");
						textdiv.append(realTimeText);
					}else{
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
					if(plustimer.getHours() == lastHours && plustimer.getMinutes() == lastMinutes && body.writer == lastwriter){
						$(".lastdatebox").remove();
						$("#lastchatdate").remove();
						writerbox.remove();
					}
					$("#lastchatdate").removeAttr('id');
					var timeminute = plustimer.getMinutes();
	        		if(timeminute < 10){
	        			timeminute = "0"+timeminute;
	        		}
					datediv.append(plustimer.getHours()+" : "+timeminute);
					datediv.attr('id','lastchatdate');
					linediv.append(textdiv);
					linediv.append(datediv);
					$("#div_contents").append(linediv);
					addYear = plusYear;
					addMonth = plusMonth;
					addDate = plusDate;
					lastHours = plustimer.getHours();
					lastMinutes = plustimer.getMinutes();
					lastwriter = body.writer;
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
						const updateText = backslash.replace(/\'/g,"\\'");
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
					const updateText = backslash.replace(/\'/g,"\\'");
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
		        				$(".frontdatebox").remove();
							}
							for(var i = 0;i < resp.length;i++){
								const datalinediv = $("<div>");
								const datadatediv = $("<div>");
								const datatextdiv = $("<div>");
								const datawriterbox = $("<div>");
								if(resp[i].writer == ${code}){
									datalinediv.addClass("mylinebox");
									datadatediv.addClass("mydatebox");
									datatextdiv.addClass("mytext");
									datatextdiv.append(resp[i].txt);
								}else{
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
				        			if(year != null && month != null && date != null){
				        				if(year != logYear || month != logMonth || date != logDate){
				        					var alldatediv = $("<div>");
				        					alldatediv.addClass("alldatebox");
					        				alldatediv.append(year+"/"+(month+1)+"/"+date);
					        				$("#div_contents").prepend(alldatediv);
				        				}
				        			}
				        			if(beforeHours != logtimer.getHours() || beforeMinutes != logtimer.getMinutes() || beforewriter != resp[i].writer){
				        				var timeminute = logtimer.getMinutes();
					        			if(timeminute < 10){
					        				timeminute = "0"+timeminute;
					        			}
				        				datadatediv.append(logtimer.getHours()+" : "+timeminute);
				        			}else{
				        				$(".lastdatawriterbox").remove();
				        				$("#logdatawriter").remove();
				        			}
				        			datawriterbox.attr('id','logdatawriter');
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
					        			year = logYear;
					        			month = logMonth;
					        			date = logDate;
					        			beforewriter = resp[i].writer;
					        		}
				        			if(logtimer.getHours() != beforetimer.getHours() || logtimer.getMinutes() != beforetimer.getMinutes() || resp[i].writer != resp[i-1].writer){
				        				beforeHours = logtimer.getHours();
				        				beforeMinutes = logtimer.getMinutes();
				        				var timeminute = logtimer.getMinutes();
						        		if(timeminute < 10){
						        			timeminute = "0"+timeminute;
						        		}
				        				datadatediv.append(logtimer.getHours()+" : "+timeminute);
				        			}else{
				        				$("#logdatawriter").remove();
				        			}
				        			$("#logdatawriter").removeAttr('id');
				        			if(i != (resp.length-1)){
				        				datawriterbox.attr('id','logdatawriter');
				        			}
				        		}
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
			for(i = 0; i <chatlog.length; i++){
				const datalinediv = $("<div>");
				const datadatediv = $("<div>");
				const datatextdiv = $("<div>");
				const datawriterbox = $("<div>");
				if(chatlog[i].writer == ${code}){
					datalinediv.addClass("mylinebox");
					datadatediv.addClass("mydatebox");
					datatextdiv.addClass("mytext");
					datatextdiv.append(chatlog[i].txt);
				}else{
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
        			var timeminute = logtimer.getMinutes();
            		if(timeminute < 10){
            			timeminute = "0"+timeminute;
            		}
    				datadatediv.append(logtimer.getHours()+" : "+timeminute);
    				datadatediv.addClass("lastdatebox");
    				datawriterbox.attr('id','lastdatawriter');
    				lastHours = logtimer.getHours();
    				lastMinutes = logtimer.getMinutes();
    				lastwriter = chatlog[i].writer;
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
        				datawriterbox.addClass("lastdatawriterbox");
	        			year = logYear;
	        			month = logMonth;
	        			date = logDate;
	        			beforeHours = logtimer.getHours();
	        			beforeMinutes = logtimer.getMinutes();
	        			beforewriter = chatlog[i].writer;
	        		}
        			if(logtimer.getHours() != beforetimer.getHours() || logtimer.getMinutes() != beforetimer.getMinutes() || chatlog[i].writer != chatlog[i-1].writer){
        				var timeminute = logtimer.getMinutes();
                		if(timeminute < 10){
                			timeminute = "0"+timeminute;
                		}
        				datadatediv.append(logtimer.getHours()+" : "+timeminute);
        			}else{
        				$("#lastdatawriter").remove();
        			}
        			$("#lastdatawriter").removeAttr('id');
        			datawriterbox.attr('id','lastdatawriter');
        		}
        		/*var timeminute = logtimer.getMinutes();
        		if(timeminute < 10){
        			timeminute = "0"+timeminute;
        		}
				datadatediv.append(logtimer.getHours()+" : "+timeminute);*/
				datalinediv.append(datatextdiv);
				datalinediv.append(datadatediv);
				$("#div_contents").prepend(datalinediv);
				if(i == (chatlog.length-1)){
    				if(${maxdata}<=30){
    					var alldatediv = $("<div>");
        				alldatediv.addClass("frontdatebox");
        				alldatediv.append(logYear+"-"+(beforeMonth+1)+"-"+beforeDate);
        				$("#div_contents").prepend(alldatediv);
    				}
				}
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