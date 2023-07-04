<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kreate-Hub : Sign up</title>
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha512/0.8.0/sha512.min.js"></script>

    <style>


        h3 {
            font-size: 20px;
            font-weight: 200;
            color: rgb(80, 80, 160);
        }

        input {
            width: 250px;
            border: 0px;
            border-bottom: 1px solid #ddd;
            transition-duration: .4s;
            outline: none;
        }

        input:focus {
            border-bottom: 1px solid rgb(136, 188, 230);

        }

        input::placeholder {
            font-size: 15px;
        }

        #btnBox {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 30px;
            width: 250px;
        }
        #btnBox div{
            width: 100%;
        }

        #cBtn, #sBtn {
            width: 100%;
            padding: 5px 10px;
            background-color: #5d5d5d;
            border-radius: 3px;
            color: white;
        }

        #wrap{
            display: flex;
            justify-content: center;
            flex-direction: column;
            align-items: center;
            width: calc(100vw - (100vw - 100%));
            height: 98vh;

        }
        #loginBox {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 5px #c1bdbd;
            padding: 20px 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 400px;
            height: 500px;
            gap: 10px;

        }
        #pRegex {
            color: rgb(80, 80, 160);
            font-size: 4px;

        }

        #nRegex {
            color: rgb(80, 80, 160);
            font-size: 4px;
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
    <form action="/member/createMember" method="post" id="frm">

        <div id="wrap">
        <div id="loginBox">
            <div>
                <h3>Email</h3>
                <input type="hidden" name="email_type" value="${emailType}">
                <input type="hidden" name="email" value="${email}">
                <input type="hidden" name="member_type" value="${memberType}">
                <input type="text" placeholder="Email" value="${email}@${setEmailType}" readonly>
            </div>
            <div>
                <h3>Password</h3>
                <input type="hidden" name="password" id="shaPw" value="">
                <input type="password" id="pw" placeholder="Password">
                <div id="pRegex">영어,대,소,(!,@,#,$,%,^,&,*,?),1~16</div>
            </div>
            <div>
                <h3>Check</h3>
                <input type="password" id="ChkPw" placeholder="Check-Passwrod">
            </div>
            <div>
                <h3>NickName</h3>
                <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요.">
                <div id="nRegex">영어,한글,1~8</div>
            </div>
            <div id="btnBox">
                <div>
                <button id="cBtn" type="button" onclick="cancel()">취소</button>
                </div>
                <div>
                <button id="sBtn">가입하기</button>
                </div>
            </div>
        </div>
        </div>
    </form>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>

<script>
    function cancel(){
        if(!confirm("정말 가입을 취소하시겠습니까?")){
            return;
        }else {
            location.replace("/member/loginForm");
        }
    }

    $("#frm").on('submit',function (){
        const pw = $("#pw").val()
        const shaPw = sha512(pw);

        $("#shaPw").val(shaPw);
    })

    $("#sBtn").click(function () {
        // 정규식
        const pw = $("#pw").val();
        const nickname = $("#nickname").val();
        const chkPw = $("#ChkPw").val();


        const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$%^&*?])[a-zA-Z\d~!@#$%^&*?]{8,16}$/;
        const passwordResult = passwordRegex.test(pw);
        if(!passwordResult){
            alert("비밀번호 양식이 올바르지 않습니다.");
            return false
        }

        const chkPwRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[~!@#$%^&*?])[a-zA-Z\d~!@#$%^&*?]{8,16}$/;
        const chkPwResult = chkPwRegex.test(chkPw)
        if(pw != chkPw){
            alert("비밀번호가 일치하지 않습니다")
            return false;

        } const nickNameRegex = /^[A-Za-z가-힣0-9]{1,8}$/;
        const nickNameResult = nickNameRegex.test(nickname);
        if(!nickNameResult){
            alert("닉네임 양식이 올바르지 않습니다.")
            return false;
        }
        $("#frm").submit();
    })
</script>
</body>
</html>

