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
<body>
<style>

    * {
        /*border: 1px solid black;*/
    }

    #wrap {
        display: flex;
        justify-content: center;
        border: 1px solid black;
        flex-direction: column;
        align-items: center;
        width: 100vw;
    }

    #header, #footer {
        width: 100%;

    }


    #body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 25px;
        width: 30vw;
        height: 60vh;
        margin: auto;
    }


    #idCheck_box {
        display: flex;
        justify-content: space-between;
        width: 100%;
        font-size: 12px;
        margin-bottom: 5px;
    }

    #login_box {
        width: 100%;
    }

    #login_box2 {
        width: 100%;
    }

    #input_email_box {

        height: 30px;
    }

    #input_email {
        width: 100%;
        height: 100%;
    }

    #password_box {
        width: 100%;
        font-size: 12px;

    }

    #password_font {
        margin-bottom: 5px;
    }

    #input_password {
        width: 100%;
        height: 30px;
    }

    input {

        font-size: 13px;
        border: 0px;
        border-bottom: 1px solid #ddd;
        transition-duration: .4s;
        outline: none;
    }

    input:focus {
        border-bottom: 1px solid #ca9372;
    }

    #find_password {
        width: 100%;
    }

    #btns {
        display: flex;
        flex-direction: column;
        width: 80%;

        gap: 10px;
    }

    #btns > button {
        height: 30px;
    }

    a {
        text-decoration-line: none;
        color: rgb(93, 93, 93);
    }

    #checkId {
        accent-color: #ca9372;
    }


</style>
<!-- GNB & LNB -->
<c:import url="${path}/resources/js/GNB.jsp">
    <c:param name="pageName" value="home" />
    <c:param name="btnNum" value="1" />
</c:import>
<!-- CONTENTS -->
<div class="container-xl  position-relative p-0">
    <div id="body">
                <div id="login_box">
                    <div id="idCheck_box">
                        <div id="id_font">아이디</div>
                        <div><input type="checkbox" id="checkId"> 아이디 저장</div>
                    </div>
                    <div id="input_email_box">
                        <input type="text" id="input_email" name="email" placeholder="email">
                    </div>
                </div>
                <div id="login_box2">
                    <div id="password_box">
                        <div id="password_font">비밀번호</div>
                        <input type="password" id="input_password" name="password" placeholder="password">
                    </div>
                </div>
                <div id="find_password">
                    <a href="/member/findPassword">비밀번호 찾기</a>
                </div>
                <div id="btns">
                    <button type="button" id="login_btn">로그인</button>
                    <button type="button" id="signup_btn">회원가입</button>
                </div>

            </div>
</div>
<!-- FOOTER -->
<c:import url="${path}/resources/js/FOOTER.jsp" />
<!-- script - Contents -->

<%--<div id="wrap">--%>
<%--    <div id="header"><c:import url="${path}/resources/js/GNB.jsp"/></div>--%>
<%--    <div id="body">--%>
<%--        <div id="login_box">--%>
<%--            <div id="idCheck_box">--%>
<%--                <div id="id_font">아이디</div>--%>
<%--                <div><input type="checkbox" id="checkId"> 아이디 저장</div>--%>
<%--            </div>--%>
<%--            <div id="input_email_box">--%>
<%--                <input type="text" id="input_email" name="email" placeholder="email">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div id="login_box2">--%>
<%--            <div id="password_box">--%>
<%--                <div id="password_font">비밀번호</div>--%>
<%--                <input type="password" id="input_password" name="password" placeholder="password">--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div id="find_password">--%>
<%--            <a href="/member/findPassword">비밀번호 찾기</a>--%>
<%--        </div>--%>
<%--        <div id="btns">--%>
<%--            <button type="button" id="login_btn">로그인</button>--%>
<%--            <button type="button" id="signup_btn">회원가입</button>--%>
<%--        </div>--%>

<%--    </div>--%>
<%--    <div id="footer"><c:import url="${path}/resources/js/FOOTER.jsp"/></div>--%>

<%--</div>--%>


</body>

<script>


    $(document).ready(function () {
        if("${result}" > 0){
            alert("회원가입을  축하드립니다");
            history.pushState(null, null, "http://localhost:8080/member/createMember");
            window.onpopstate = function (event) {
                history.go(1);
            };
        }else if(${status == 'cancel'}) {
            history.pushState(null, null, "http://localhost:8080/member/loginForm");
            window.onpopstate = function (event) {
                history.go(1);
            }
        }else if(${emailCheck == true}) {
            alert("가입되어있는 이메일입니다")
        }

        $("#signup_btn").click(function () {
            location.href = "/member/signup";
        });


        $("#login_btn").click(function () {
            const email = $("#input_email").val();
            const password = $("#input_password").val();
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
                        console.log($("#input_email").val());
                        setCookie("email", $("#input_email").val(), 30); // 30일 동안 쿠키 보관
                    }
                    alert("로그인 성공");
                    location.href = "/";
                }


            });
        });

        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var key = getCookie("email");
        console.log(key);
        $("#input_email").val(key);

        // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        if ($("#input_email").val() != "") {
            $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }

        $("#checkId").on("change", function () {
            if (!$("#checkId").is(":checked")) {
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
