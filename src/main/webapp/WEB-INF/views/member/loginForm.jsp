<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>

</head>
<style>
    * {
        box-sizing: border-box;
        border: 1px solid black;

    }

    #container {
        margin: auto;
        text-align: center;
        height: 100vh;
    }

    #header {
        height: 20%;
    }

    #body {
        height: 60%;
        overflow: hidden;
    }

    #footer {
        height: 20%;
    }

    #body > div {
        float: left;
        height: 100%;
    }

    #body_left {
        width: 30%;
    }


    #body_center {
        width: 40%;
    }

    #input_id {
        width: 60%;
        height: 100%;
    }

    #input_pw {
        width: 60%;
        height: 100%;
    }

    #body_center > div {
        width: 100%;
        height: 10%;
    }

    #id_box > div {
        float: left;
        height: 100%;
        width: 50%;
    }

    #login_btn {
        width: 50%;
        height: 100%;
    }

    #signup_btn {
        width: 50%;
        height: 100%;
    }


    #body_right {
        width: 30%;
    }


    #password_box > div {
        float: left;
        height: 100%;
        width: 50%;
    }


</style>
<body>

    <div id="container">
        <div id="header">GNB</div>
        <div id="body">
            <div id="body_left"></div>
            <div id="body_center">
                <div></div>
                <div id="id_box">
                    <div id="id_box_left">아이디</div>
                    <div id="id_box_right"><input type="checkbox">아이디저장</div>
                </div>
                <div><input id="input_id" name="email" type="text" placeholder="내용을 입력해주세요"></div>
                <div id="password_box">
                    <div id="password_box_left">비밀번호</div>
                    <div id="password_box_right"></div>
                </div>
                <div><input id="input_pw" name="password" type="password" placeholder="내용을 입력해주세요"></div>
                <div></div>
                <div><a href="/member/findPassword">비밀번호 찾기</a></div>
                <div>
                    <button type="button" id="login_btn">로그인</button>
                </div>
                <div>
                    <button type="button" id="signup_btn">회원가입</button>
                </div>
                <div></div>

            </div>
            <div id="body_right"></div>
        </div>
        <div id="footer">FOOTER</div>

    </div>

</body>

<script>



    $("#signup_btn").click(function(){
        location.href="/member/signup";
    })



    $("#login_btn").click(function (){
        const email = $("#input_id").val();
        const password = $("#input_pw").val();
        $.ajax({
            url:"/member/login",
            data:{
                "email": email,
                "password": password
            },
            method:"post"
        }).done(function(resp){
            if(resp == 11){
                   alert("등록된 정보가 없습니다.")
            }else if(resp == 22){
                alert("가입대기중인 상태입니다")
            }else  if(resp == 33){
                alert("이용이 정지된 고객입니다.")
            }else if(resp ==44){
                alert("이미 접속중인 이용자입니다")
            }else{
                alert("로그인 성공");
                location.href="/";
            }

        })



    })


</script>

</html>
