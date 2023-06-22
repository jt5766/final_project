<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
    <title>Document</title>
    <style>
        * {
            border: 1px solid black;
            box-sizing: border-box;
        }

        #container {
            margin: auto;
            text-align: center;

        }


        #navi {
            display: flex;
        }

        #navi_left {
            flex: 0.5;
        }

        #navi_center {
            flex: 1;
        }

        #navi_right {
            flex: 0.5;
        }


        /* 컨텐츠부분 */
        #body {
            display: flex;

        }

        #body_left {
            flex: 0.3;
        }

        #body_center {
            flex: 1;
        }

        #body_mid {
            display: none;
        }


        #body_right {
            flex: 0.3;
        }

        .validate {
            background-color: green;
        }
    </style>
</head>
<body>
<form action="/member/update" id="updatemember">
    <div id="container">
        <div id="header">gnb</div>
        <div id="navi">
            <div id="navi_left"></div>
            <div id="navi_center">마이페이지<br>
                <button type="button">갤러리</button>
                <button type="button">커뮤니티</button>
                <button type="button">1:1채팅</button>
            </div>
            <div id="navi_right"></div>
        </div>
        <div id="body">
            <div id="body_left"></div>

            <div id="body_center"><br>
                <div id="body_top">
                    비밀번호<br>
                    <input type="password" id="pass" placeholder="내용을입력해주세요">
                    <button type="button" id="passwordChkBtn">확인</button>
                    <input type="hidden" id="nick" value="${nickName}">

                </div>
                <br>

                <div id="body_mid">
                    이메일<br>
                    <input type="text" placeholder="내용을입력해주세요" value="${email}@${set_email_type}" readonly> <br>

                    닉네임<br>
                    <input type="text" name="nickname" placeholder="내용을입력해주세요" value="${nickName}"><button id="duplicate_check" type="button">중복확인</button>
                </div>
                <br>

                <div id="body_bottom" align="center">
                    <button id="infoUpdate" style="display: none">정보수정</button>
                    <button type="button" id="passwordChange" style="display: none">비밀번호 변경</button>
                    <button type="button" id="cancleBtn">취소</button>
                    <br><br>
                    <button type="button" id="memberDelete" style="display: none">탈퇴</button>
                    <br>
                </div>
            </div>
            <div id="body_right"></div>

        </div>

        <div id="footer">footer</div>
    </div>
</form>
<script>

    $("#passwordChange").click(function () {

        location.href = "/member/tofindPassword?email=${email}&email_type=${email_type}"
    })


    $("#passwordChkBtn").click(function () {


        const pass = $("#pass").val();
        const nick = $("#nick").val();

        $.ajax({
            url: "/member/passwordCheck",

            data: {
                password: pass,
                nickname: nick
            },
            method: "post"
        }).done(function (resp) {
            resp = JSON.parse(resp);
            if (resp) {
                // $("#body_mid").css({display:"block"})
                $("#body_mid").css("display", "block")
                $("#body_top").css({display: "none"})

                $("#infoUpdate").css("display", "block")
                $("#passwordChange").css("display", "block")
                $("#memberDelete").css("display", "block")

            } else {

                alert("비밀번호를 다시입력해주세요");
            }
        })
    })


    /*탈퇴 버튼*/
    $("#memberDelete").click(function (){
      const result = confirm("회원을 탈퇴 하시겠습니까?")
      if(result){
        location.href="/member/memberDelete?code=${code}"
      }



    })

    /*취소 버튼*/
    $("#cancleBtn").click(function () {

        location.href = "/member/mypage"

    })

    const nickname = $('input[name=nickname]');
    $('#duplicate_check').on('click', function() {
        console.log(nickname)
        if (nickname.val().trim() !== '') {
            $.ajax({
                url:"/member/nickname/duplicate-check",
                data:{
                    nickname:nickname.val().trim()
                },
                contentType:"application/x-www-form-urlencoded; utf-8",
                method:"post"
            }).done(function(resp) {
                console.log(resp);
                if (resp > 0) {
                    alert("중복된 닉네임입니다.");
                } else {
                    nickname.addClass('validate');
                }
            });
        }
    });
    nickname.on('change', function() {
        nickname.removeClass('validate');
    })
    $('#updatemember').on('submit', function(e) {
        const nickname = $('input[name=nickname]');
        if (!nickname.hasClass('validate')) {
            alert("중복 검사를 실시해주세요.");
            e.preventDefault();
        }
    })
</script>
</body>
</html>
