<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha512/0.8.0/sha512.min.js"></script>
</head>
<style>


    *{

    }

    #wrap {
        display: flex;
        justify-content: center;
        width: calc(100vw - (100vw - 100%));
        height: 98vh;
        align-items: center;
    }

    #header, #footer {
        width: 100%;

    }


    #body {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 5px #c1bdbd;
        padding: 20px 10px;
        gap: 20px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 400px;
        height: 500px;
    }


    #idCheck_box {
        display: flex;
        justify-content: space-between;
        width: 100%;
        font-size: 18px;
    }

    #login_box {
        width: 100%;

    }

    #login_box2 {
        width: 100%;
    }

    #input_email_box {

        height: 40px;
    }

    #input_email {
        width: 100%;
        height: 100%;
    }

    #password_box {
        width: 100%;
        font-size: 18px;

    }



    #input_password {
        width: 100%;
        height: 40px;
    }

    input {

        font-size: 15px;
        border: 0px;
        border-bottom: 1px solid #ddd;
        transition-duration: .4s;
        outline: none;
    }

    input:focus {
        border-bottom: 1px solid #181414;
    }

    #find_password {
        width: 100%;
        font-size: 12px;
        color: #b0b0b0;
        margin-left: 10px;
    }
    #register_link{
        font-size: 12px;
        color: #b0b0b0;
        margin-right: 10px;
    }

    #btns {
        margin-top: 30px;
        display: flex;
        flex-direction: column;
        width: 100%;
        gap: 10px;
    }

    #btns > button {
        height: 40px;
        background-color: #5d5d5d;
        border-radius: 3px;
        color: white;
    }

    #atags{
        display: flex;
        justify-content: space-between;
    }

    a {
        text-decoration-line: none;
    }

    #checkId_Box{
        font-size: 14px;


    }
    #checkId{
    accent-color: #5d5d5d;
    }


</style>
<body>
<!-- GNB & LNB -->
<c:import url="${path}/resources/js/GNB.jsp">
    <c:param name="pageName" value="home" />
    <c:param name="btnNum" value="1" />
</c:import>
<!-- CONTENTS -->
<div class="container-xl  position-relative p-0">
    <div id="wrap">
    <div id="body">
        <div id="login_box">
            <div id="idCheck_box">
                <div id="id_font">아이디</div>
                <div id="checkId_Box"><label><input type="checkbox" id="checkId"> 아이디 저장</label></div>
            </div>
            <div id="input_email_box">
                <input type="text" id="input_email" name="email" placeholder="email">
            </div>
        </div>
        <div id="login_box2">
            <div id="password_box">
                <div id="password_font">비밀번호</div>

                <input type="password" id="input_password"  placeholder="password">
            </div>
        </div>
        <div id="btns">
            <button type="button" id="login_btn">로그인</button>
            <hr>
            <div id="atags">
                <div>
                <a href="/member/findPassword" id="find_password">비밀번호 찾기</a>
                </div>
                <div>
                <a href="/member/signup" id="register_link">회원가입</a>
                </div>
            </div>
        </div>

    </div>
</div>
</div>
<!-- FOOTER -->
<c:import url="${path}/resources/js/FOOTER.jsp" />
<!-- script - Contents -->

</body>
<script>


    <%--if("${result}" > 0){--%>
    <%--    alert("회원가입을  축하드립니다");--%>
    <%--    history.pushState(null, null, "http://localhost:8080/member/createMember");--%>
    <%--    window.onpopstate = function (event) {--%>
    <%--        history.go(1);--%>
    <%--    };--%>
    <%--}else if(${status == 'cancel'}) {--%>
    <%--    history.pushState(null, null, "http://localhost:8080/member/loginForm");--%>
    <%--    window.onpopstate = function (event) {--%>
    <%--        history.go(2);--%>
    <%--    }--%>

    <%--}else if(${emailCheck == true}) {--%>
    <%--    alert("가입되어있는 이메일입니다")--%>
    <%--}--%>


    if("${result}" > 0) {
        alert("회원가입을 축하드립니다.")
        history.pushState(null, null, "http://localhost:8080/member/createMember");
        window.onpopstate = function (event) {
            history.go(1);
        }
    }

    <%--if("${duplEmail == 1}"){--%>
    <%--    alert("비밀번호 찾기 메일이 발송되었습니다. 메일을 확인해주세요")--%>
    <%--}--%>

    $(document).ready(function () {


        $("#signup_btn").click(function () {
            location.href = "/member/signup";
        });



        $("#login_btn").click(function () {
            const email = $("#input_email").val();
            const password= $("#input_password").val();
            const pw = sha512(password);
            if (email == "" || password == "" || !email.includes("@")) {
                alert("아이디 또는 비밀번호를 입력해주세요");
                return;
            }
            $.ajax({
                url: "/member/login",
                data: {
                    "email": email,
                    "password":pw
                },
                method: "post"
            }).done(function (resp) {
                console.log(resp)
                if (resp == 11) {
                    alert("등록된 정보가 없습니다.");
                    return false;
                } else if (resp == 22) {
                    alert("가입대기중인 상태입니다");
                        return false;
                } else if (resp == 33) {
                    alert("이용이 정지된 고객입니다.");
                    return false;
                } else if (resp == 44) {
                    alert("이미 접속중인 이용자입니다");
                    return false;
                } else {
                    if ($("#checkId").is(":checked")) {

                        setCookie("email", $("#input_email").val(), 30); // 30일 동안 쿠키 보관
                    }
                    alert("로그인 성공");
                    location.href = "/";
                }


            });
        });

        // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
        var key = getCookie("email");

        $("#input_email").val(key);

        // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        if ($("#input_email").val() != "") {
            $("#checkId").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
        }

        $("#checkId").on("change", function () {
            if (!$("#checkId").is(":checked")) {

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
