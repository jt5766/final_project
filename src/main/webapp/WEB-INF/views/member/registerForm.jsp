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
        gap: 20px;
        margin-top: 30px;
    }

    #cBtn, #sBtn {

        padding: 5px 10px;
    }

    #loginBox {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 5px #c1bdbd;
        padding: 20px 10px;
        margin: auto;
        margin-top: 100px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 400px;
        height: 500px;
        gap: 10px;

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
<form action="/member/createMember" method="post">
<<<<<<< Updated upstream
=======
이메일<br>
    <input type="hidden" name="email_type" value="${emailType}">
    <input type="hidden" name="email" value="${email}">
    <input type="hidden" name="member_type" value="${memberType}">
    <input type="text"  value="${email}@${setEmailType}" readonly> <br>
비밀번호 <br>
<input type="password" name="password" placeholder="내용을 입력해주세요"><br>
비밀번호 확인<br>
<input type="password" placeholder="내용을 입력해주세요"><br>
닉네임<br>
<input type="text" name="nickname" placeholder="내용을 입력해주세요"><br>
>>>>>>> Stashed changes

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
                <input type="password" name ='password'placeholder="Password">
            </div>
            <div>
                <h3>Check</h3>
                <input type="password" placeholder="Check-Passwrod">
            </div>
            <div>
                <h3>NickName</h3>
                <input type="text" name="nickname" placeholder="닉네임을 입력해주세요.">
            </div>
            <div id="btnBox">
                <button id="cBtn" type="button" onclick="cancel()">취소</button>
                <button id="sBtn">가입하기</button>
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

    </script>
</body>


</html>

