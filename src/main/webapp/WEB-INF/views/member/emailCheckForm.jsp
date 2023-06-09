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
</head>


<style>


    .form_radio_btn {
        width: 47%;
        height: 150px;
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
        line-height: 150px;
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
        font-size: 30px;
    }

    .form_toggle {
        display: flex;
        justify-content: center;
        align-items: center;
        width: 390px;

        gap: 10px;
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


    #wrap {
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
        width: calc(100vw - (100vw - 100%));
        height: 98vh;

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

    #email_box {
        display: flex;
        flex-direction: column;
        gap: 20px;
        width: 100%;
        margin-top: 50px;

    }

    #email_top {
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;

    }

    #email-font {
        width: 100%;
    }


    #emails {
        display: flex;
        width: 100%;
    }

    #body h3 {
        font-size: 14px;
    }

    input {
        outline: none;
        width: 100%;
    }

    #signup-btn {
        background-color: #5d5d5d;
        border-radius: 3px;
        color: white;
        height: 40px;
    }

    #sel {
        width: 100%;
        height: 30px;
        outline: none;
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
        <div id="wrap">
            <div id="body">
                <div class="mb-3">
                    <div class="form_toggle  d-flex flex-row justify-content-between">
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

                <div id="email_box">
                    <div id="email_top">
                        <div id="email-font">
                            <h3>이메일</h3>
                        </div>
                        <div id="emails">

                            <input type="text" id="email" name="email" placeholder="Email"> <span>@</span>
                            <select id="sel" name="email_type">

                                <c:forEach var="i" items="${list}">
                                    <option value="${i.code}">${i.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div id="email-Btn">
                        <button id="signup-btn" type="button">이메일 인증</button>
                    </div>

                </div>
                <div></div>


            </div>
        </div>
    </div>
</form>
<!-- FOOTER -->
<c:import url="${path}/resources/js/FOOTER.jsp"/>
<!-- script - Contents -->

</body>
<script>


    $("#signup-btn").on("click", function () {
        var email = $("#email").val();
        var email_type = $("#sel").val();

        if (email == "") {
            alert("메일을 입력해주세요")
            return;
        }

        $.ajax({
            url: "/member/mailDupCheck",
            data: {
                email: email,
                email_type: email_type
            },
            method: "post"
        }).done((resp) => {
            resp = JSON.parse(resp);
            if (resp) {
                alert("중복된 이메일입니다.");
            } else {
                alert("이메일이 발송되었습니다.");
                $("#email_certification").submit();

            }
        })
    })
</script>

</html>

