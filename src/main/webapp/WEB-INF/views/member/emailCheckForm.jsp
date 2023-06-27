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
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>


<style>

    .form_radio_btn {
        width: 47%;
        height: 45px;
        border: 1px solid #EAE7E7;
        border-radius: 10px;
    }

    .form_radio_btn input[type=radio] {
        display: none;
    }

    .form_radio_btn label {
        display: block;
        border-radius: 10px;
        margin: 0 auto;
        text-align: center;
        line-height: 45px;
    }

    /* Checked */
    .form_radio_btn input[type=radio]:checked + label {
        background: #5d5d5d;
        color: #fff;
    }

    /* Hover */
    .form_radio_btn label:hover {
        color: #666;
    }

    /* Disabled */
    .form_radio_btn input[type=radio] + label {
        background: #F9FAFC;
        color: #666;
    }

    .form_toggle {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 300px;
        gap: 10px;
    }


    #wrap > div {
        /*border: 1px solid black;*/
    }



    #email-Btn {
        display: flex;
        justify-content: center;
        margin-top: 10px;
        width: 100%;
    }

    #email-Btn > button {
        width: 100%;
    }

    #body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        gap: 10px;
        height: 60vh;
    }

    #body h3 {
        font-size: 14px;
    }

    input {
        outline: none;
    }

    #signup-btn {
        background-color: #5d5d5d;
        border-radius: 3px;
        color: white;

    }

</style>
<body>

<!-- GNB & LNB -->
<c:import url="${path}/resources/js/GNB.jsp">
    <c:param name="pageName" value="home"/>
    <c:param name="btnNum" value="1"/>
</c:import>
<!-- CONTENTS -->
<form action="/member/check" id="email_certification">
    <div class="container-xl position-relative p-0">
        <div id="body">
            <div class="mb-3">
                <div class="form_toggle row-vh d-flex flex-row justify-content-between">
                    <div class="form_radio_btn radio_male">
                        <input type="radio" name="member_type" value="1000" id="btn1" checked>
                        <label for="btn1">일반인</label>
                    </div>

                    <div class="form_radio_btn">
                        <input type="radio" name="member_type" value="2000" id="btn2">
                        <label for="btn2">전문가</label>
                    </div>
                </div>
            </div>

            <div>
                <h3>이메일</h3>
                <div>
                    <input type="text" id="email" name="email" placeholder="Email"> <span>@</span> <select id="sel"
                                                                                                           name="email_type">
                    <c:forEach var="i" items="${list}">
                        <option value="${i.code}">${i.name}</option>
                    </c:forEach>
                </select>
                </div>

                <div id="email-Btn">
                    <button id="signup-btn">이메일 인증</button>
                </div>

            </div>
            <div></div>


        </div>
    </div>
</form>
<!-- FOOTER -->
<c:import url="${path}/resources/js/FOOTER.jsp"/>
<!-- script - Contents -->

</body>
<script>
    // $("#signup_btn").click(function () {
    //     const email = $("#email").val();
    //
    //     if (email == "") {
    //         alert("이메일을 제대로 입력해주세요");
    //         return;
    //     }})

    $("#email_certification").on("submit", function () {
        alert("메일이 발송되었습니다.");
    })

</script>

</html>

