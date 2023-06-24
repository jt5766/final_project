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
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>
<style>
    * {
        box-sizing: border-box;
    }
    body{
        background-color: #fff;
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
        width: 250px;
        height: 100%;
    }

    #input_pw {
        width: 250px;
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
        width: 200px;
        height: 100%;
    }

    #signup_btn {
        width: 200px;
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
    <div id="header"><c:import url="${path}/resources/js/GNB.jsp"/></div>
    <div id="body">
        <div id="body_left"></div>
        <div id="body_center">
            <div></div>
            <div id="id_box">
                <div id="id_box_left">아이디</div>
                <div id="id_box_right"><input type="checkbox" id="checkId">아이디저장</div>
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
    <div id="footer"><c:import url="${path}/resources/js/FOOTER.jsp"/></div>

</div>

</body>

<script>


    $(document).ready(function () {
        $("#signup_btn").click(function () {
            location.href = "/member/signup";
        })


        $("#login_btn").click(function () {
            const email = $("#input_id").val();
            const password = $("#input_pw").val();
            if (email == "" || password == "" || !email.includes("@")) {
                alert("아이디 또는 비밀번호를 입력해주세요");
                return;
            }
            $.ajax({
                url: "/member/login",
                data: {
                    "email": email,
                    "password": password
                },
                method: "post"
            }).done(function (resp) {
                if (resp == 11) {
                    alert("등록된 정보가 없습니다.")
                } else if (resp == 22) {
                    alert("가입대기중인 상태입니다")
                } else if (resp == 33) {
                    alert("이용이 정지된 고객입니다.")
                } else if (resp == 44) {
                    alert("이미 접속중인 이용자입니다")
                } else {
                    if ($("#checkId").is(":checked")) {
                        console.log("!!!!!!!!");
                        console.log($("#input_id").val());
                        setCookie("email", $("#input_id").val(), 30); // 30일 동안 쿠키 보관
                    }
                    alert("로그인 성공");
                    location.href = "/";
                }


            });
        });

        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var key = getCookie("email");
        console.log(key);
        $("#input_id").val(key);

        // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        if ($("#input_id").val() != "") {
            $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }

        $("#checkId").on("change", function (){
           if(!$("#checkId").is(":checked")){
               console.log("????");
               deleteCookie("email");
           }
        });

        // 쿠키 저장하기
        // setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
        function setCookie(cookieName, value, exdays) {
            var exdate = new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var cookieValue = escape(value)
                + ((exdays == null) ? "" : "; expires=" + exdate.toGMTString());
            document.cookie = cookieName + "=" + cookieValue;
        }

        // 쿠키 삭제
        function deleteCookie(cookieName) {
            var expireDate = new Date();
            expireDate.setDate(expireDate.getDate() - 1);
            document.cookie = cookieName + "= " + "; expires="
                + expireDate.toGMTString();
        }

        // 쿠키 가져오기
        function getCookie(cookieName) {
            cookieName = cookieName + '=';
            var cookieData = document.cookie;
            var start = cookieData.indexOf(cookieName);
            var cookieValue = '';
            if (start != -1) { // 쿠키가 존재하면
                start += cookieName.length;
                var end = cookieData.indexOf(';', start);
                if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정
                    end = cookieData.length;
                console.log("end위치  : " + end);
                cookieValue = cookieData.substring(start, end);
            }
            return unescape(cookieValue);
        }
    });


</script>

</html>
