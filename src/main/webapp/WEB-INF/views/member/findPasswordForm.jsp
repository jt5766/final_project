<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Title</title>
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha512/0.8.0/sha512.min.js"></script>
</head>
<style>


    #find-password {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 5px #c1bdbd;
        padding: 20px 10px;
        margin: auto;
        margin-top: 300px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 400px;
        height: 200px;
        gap: 20px;
    }

    #find-password2 {
        background-color: white;
        border-radius: 10px;
        box-shadow: 0 0 5px #c1bdbd;
        padding: 20px 10px;
        margin: auto;
        margin-top: 300px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 400px;
        height: 400px;
        gap: 20px;
    }


    h4 {
        font-size: 15px;
        font-weight: 200;
        color: rgb(80, 80, 160);
    }
    h3{
        font-size: 20px;
        color: crimson;
    }

    input {
        font-size: 13px;
        width: 250px;
        border: 0px;
        border-bottom: 1px solid #ddd;
        transition-duration: .4s;
        outline: none;
    }

    #sendMail-btn1,#sendMail-btn2{
        background-color: #5d5d5d;
        border-radius: 3px;
        color: white;
    }

</style>
<body>
<c:choose>
    <c:when test="${email == null}">

        <c:if test="${duplEmail == false}">
            <script>
                alert("등록된 이메일이 없습니다")
            </script>
        </c:if>

        <!-- GNB & LNB -->
        <c:import url="${path}/resources/js/GNB.jsp">
            <c:param name="pageName" value="home"/>
            <c:param name="btnNum" value="1"/>
        </c:import>
        <!-- CONTENTS -->
        <form action="/member/passwordChange" method="post">
            <div class="container-xl  position-relative p-0">

                <div id="find-password">
                    <div>
                        <h4>등록하신 이메일을 입력해주세요</h4>
                        <input type="text" placeholder="Email" id="email" name="email" required>
                    </div>
                    <div>
                        <button  id="sendMail-btn1">확인</button>
                    </div>
                    <div>
                        <h3> *메일을 확인해주세요 </h3>

                    </div>
                </div>
            </div>

        </form>
        </div>
        <c:import url="${path}/resources/js/FOOTER.jsp"/>

    </c:when>
    <c:otherwise>
        <!-- GNB & LNB -->
        <c:import url="${path}/resources/js/GNB.jsp">
            <c:param name="pageName" value="home"/>
            <c:param name="btnNum" value="1"/>
        </c:import>
        <div class="container-xl  position-relative p-0">
            <form action="/member/updatePassword" id="frm">
                <div id="find-password2">
                    <div>
                        <h4>이메일</h4>
                        <input type="hidden" name="email" value="${email}">
                        <input type="hidden" name="email_type" value="${email_type}">
                        <input type="text" placeholder="email" value="${email}@${set_email_type}" readonly>
                    </div>
                    <div>
                        <h4>새로운 비밀번호를 입력해주세요</h4>
                        <input type="hidden" name="password" id="shaPw" value="">
                        <input type="password" id="pw"  required>
                    </div>
                    <div>
                        <h4>비밀번호를 확인해주세요</h4>
                        <input type="password" id="ChkPw" required>
                    </div>
                    <div>
                        <button id="sendMail-btn2">확인</button>
                    </div>
                </div>

            </form>
        </div>
        <c:import url="${path}/resources/js/FOOTER.jsp"/>
    </c:otherwise>
</c:choose>

<script>

    $("#sendMail-btn1").click(function (){
        const email = $("#email").val()
        if(email == "" || !email.includes("@") ){
            alert("이메일 형식을 맞춰주세요")
            return false;
        }
    })

    $("#frm").on('submit',function (){
        const pw = $("#pw").val()
        const shaPw = sha512(pw);
        console.log(shaPw)
        $("#shaPw").val(shaPw);
    })

    $("#sendMail-btn2").click(function () {
        // 정규식
        const pw = $("#pw").val();
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
        }



        $("#frm").submit();


    })




</script>

</body>
</html>