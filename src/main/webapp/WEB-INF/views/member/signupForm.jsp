
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>signup</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
</head>
<style>
    *{box-sizing: border-box;}
    div{
        /* border: 1px solid black; */
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
        float: left;
        height: 100%;
        width: 50%;
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
        flex: 1;
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

    #btn1{

        height: 100%;
        width: 100%;
        font-size: 80px;
    }
    #btn2{
        height: 100%;
        width: 100%;
        font-size: 80px;
    }

    #body_right{
        width: 30%;
    }

    #footer{
        height: 20%;
    }







</style>
<body>
<div id="container">
    <div id="header"> GNB </div>
    <div id="body">
        <div id="body_left">left</div>
        <div id="body_center">
            <div id="btn_box">
                <div><button id="btn1">일반인</button></div>
                <div><button id="btn2">전문가</button></div>
            </div>
            <div class="center_box"></div>
            <div id="email_font">이메일</div>
            <div class="center_box" id="flex_box">
                <div id="email"><input type="text" name="eamil" placeholder="내용을 입력해주세요"></div>
                <div id="icon">@</div>
                <div id="drop">
                    <select id="sel" name="emailType">
                        <option value="1001">naver.com</option>
                        <option value="1002">gmail.com</option>
                        <option value="1003">gmail.com</option>
                        <option value="1004">gmail.com</option>
                    </select>

                </div>
            </div>
            <div class="center_box"></div>
            <div class="center_box">
                <button id="email_certification">이메일 인증</button>
            </div>
        </div>
        <div id="body_right">right</div>

    </div>
    <div id="footer">footer</div>

</div>
</body>
</html>

