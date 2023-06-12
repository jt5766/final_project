
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
</head>
<style>
    *{box-sizing: border-box;}
    div{
         /*border: 1px solid black;*/
    }
    #container{
        margin: auto;
        text-align: center;
        height: 100vh;
    }

    #header{
        height: 20%;
    }
    #body{
        height: 60%;
    }
    #body>div{
        float: left;
        overflow: hidden;
        height: 100%;
    }
    #body_left{
        width: 30%;
    }

    #body_center{
        width: 40%;
    }

    #btn_box{
        height: 60%;
    }
    #btn_box div{

        height: 100%;
        width: 100%;
    }

    .center_box{
        height: 8%;

    }
    .center_box>div{
        height: 100%;
    }

    #flex_box{
        display: flex;
    }

    #email_font{
        height: 5%;
        text-align: left;


    }

    #email{
        width: 47.5%;
        flex: 5;
    }
    #icon{
        width: 5%;
        line-height: 200%;
        font-size: 20px;
        flex: 0.5;
    }
    #drop{
        width: 47.5%;
        height: 100%;
        flex: 5;
    }



    input{
        padding: 1px;
        width: 100%;
        height: 100%;
    }

    #sel{
        width: 100%;
        min-height: 100%;

    }




    #email_certification{
        width: 100%;
        height: 100%;
    }

    .lab{
        font-size:30pt ;
        flex: 1;
    }
    .btn-check{

    }



    #body_right{
        width: 30%;
    }

    #footer{
        height: 20%;
    }







</style>
<body>

<form action="/member/check">
<div id="container">
    <div id="header"> GNB </div>
    <div id="body">
        <div id="body_left">left</div>
        <div id="body_center">
            <div id="btn_box">


                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                    <input type="radio" class="btn-check " name="member_type" value="1000" id="btn1" autocomplete="off" checked>
                    <label class="btn btn-outline-primary lab p-0" for="btn1">일반</label>

                    <input type="radio" class="btn-check " name="member_type" value="2000" id="btn2" autocomplete="off">
                    <label class="btn btn-outline-primary lab p-0" for="btn2">전문가</label>
                </div>

<%--                <div><button id="btn1" >일반인</button></div>--%>
<%--                <div><button id="btn2" >전문가</button></div>--%>
            </div>
            <div class="center_box"></div>
            <div id="email_font">이메일</div>
            <div class="center_box" id="flex_box">
                <div id="email"><input type="text" name="email" placeholder="내용을 입력해주세요"></div>
                <div id="icon">@</div>
                <div id="drop">
                    <select id="sel" name="email_type">
                        <option value="1001">gmail.com</option>
                        <option value="1002">naver.com</option>
                        <option value="1003">daum.com</option>
                        <option value="1004">nate.com</option>
                    </select>

                </div>
            </div>
            <div class="center_box"></div>
            <div class="center_box">
                <button type="submit" id="email_certification">이메일 인증</button>
            </div>
        </div>
        <div id="body_right">right</div>

    </div>
    <div id="footer">footer</div>

</div>
</form>
</body>

<script>
    $("#email_certification").on("submit",function(){
        alert("메일이 발송되었습니다.");
    })


</script>
</html>

