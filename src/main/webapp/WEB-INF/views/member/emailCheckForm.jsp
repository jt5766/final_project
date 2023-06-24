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
    body{
        background-color: #fff;
    }
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

    #wrap {
        display: flex;
        justify-content: center;
        border: 1px solid black;
        flex-direction: column;
        align-items: center;
        width: 100vw;
    }

    #wrap > div {
        /*border: 1px solid black;*/
    }

    #header {
        width: 100%;
    }

    #footer {
        width: 100%;
    }

    #email-Btn{
        display: flex;
        justify-content: center;
        margin-top: 10px;
        width: 100%;
    }

    #email-Btn > button{
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
    input{
        outline: none;
    }
    #signup-btn{
        background-color:#5d5d5d;
        border-radius: 3px;
        color: white;

    }

</style>
<body>
<form action="/member/check" id="email_certification">
<div id="wrap">
    <div id="header"><c:import url="${path}/resources/js/GNB.jsp"/></div>
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
                <input type="text" id="email" name="email" placeholder="Email"> <span>@</span> <select id="sel" name="email_type">
                <c:forEach var="i" items="${list}">
                    <option value="${i.code}">${i.name}</option>
                </c:forEach>
            </select>
            </div>

            <div id="email-Btn">
                <button  id="signup-btn">이메일 인증</button>
            </div>

        </div>
        <div></div>


    </div>
    <div id="footer"><c:import url="${path}/resources/js/FOOTER.jsp"/></div>
</div>
</form>
</body>
<script>
    // $("#signup_btn").click(function () {
    //     const email = $("#email").val();
    //
    //     if (email == "") {
    //         alert("이메일을 제대로 입력해주세요");
    //         return;
    //     }})

    $("#email_certification").on("submit",function(){
            alert("메일이 발송되었습니다.");
        })

</script>
<%--<style>--%>
<%--    *{box-sizing: border-box;}--%>
<%--    div{--%>
<%--         /*border: 1px solid black;*/--%>
<%--    }--%>
<%--    #container{--%>
<%--        margin: auto;--%>
<%--        text-align: center;--%>
<%--        height: 100vh;--%>
<%--    }--%>

<%--    #header{--%>
<%--        height: 20%;--%>
<%--    }--%>
<%--    #body{--%>
<%--        height: 60%;--%>
<%--    }--%>
<%--    #body>div{--%>
<%--        float: left;--%>
<%--        overflow: hidden;--%>
<%--        height: 100%;--%>
<%--    }--%>
<%--    #body_left{--%>
<%--        width: 30%;--%>
<%--    }--%>

<%--    #body_center{--%>
<%--        width: 40%;--%>
<%--    }--%>

<%--    #btn_box{--%>
<%--        height: 60%;--%>
<%--    }--%>
<%--    #btn_box div{--%>

<%--        height: 100%;--%>
<%--        width: 100%;--%>
<%--    }--%>

<%--    .center_box{--%>
<%--        height: 8%;--%>

<%--    }--%>
<%--    .center_box>div{--%>
<%--        height: 100%;--%>
<%--    }--%>

<%--    #flex_box{--%>
<%--        display: flex;--%>
<%--    }--%>

<%--    #email_font{--%>
<%--        height: 5%;--%>
<%--        text-align: left;--%>


<%--    }--%>

<%--    #email{--%>
<%--        width: 47.5%;--%>
<%--        flex: 5;--%>
<%--    }--%>
<%--    #icon{--%>
<%--        width: 5%;--%>
<%--        line-height: 200%;--%>
<%--        font-size: 20px;--%>
<%--        flex: 0.5;--%>
<%--    }--%>
<%--    #drop{--%>
<%--        width: 47.5%;--%>
<%--        height: 100%;--%>
<%--        flex: 5;--%>
<%--    }--%>


<%--    input{--%>
<%--        padding: 1px;--%>
<%--        width: 100%;--%>
<%--        height: 100%;--%>
<%--    }--%>

<%--    #sel{--%>
<%--        width: 100%;--%>
<%--        min-height: 100%;--%>

<%--    }--%>


<%--    #email_certification{--%>
<%--        width: 100%;--%>
<%--        height: 100%;--%>
<%--    }--%>

<%--    .lab{--%>
<%--        font-size:30pt ;--%>
<%--        flex: 1;--%>
<%--    }--%>
<%--    .btn-check{--%>

<%--    }--%>


<%--    #body_right{--%>
<%--        width: 30%;--%>
<%--    }--%>

<%--    #footer{--%>
<%--        height: 20%;--%>
<%--    }--%>


<%--</style>--%>
<%--<body>--%>

<%--<form action="/member/check" id="email_certification">--%>
<%--<div id="container">--%>
<%--    <div id="header"> GNB </div>--%>
<%--    <div id="body">--%>
<%--        <div id="body_left">left</div>--%>
<%--        <div id="body_center">--%>
<%--            <div id="btn_box">--%>
<%--                <div class="btn-group" role="group" aria-label="Basic radio toggle button group">--%>
<%--                    <input type="radio" class="btn-check " name="member_type" value="1000" id="btn1" autocomplete="off" checked>--%>
<%--                    <label class="btn btn-outline-primary lab p-0" for="btn1">일반</label>--%>

<%--                    <input type="radio" class="btn-check " name="member_type" value="2000" id="btn2" autocomplete="off">--%>
<%--                    <label class="btn btn-outline-primary lab p-0" for="btn2">전문가</label>--%>
<%--                </div>--%>

<%--&lt;%&ndash;                <div><button id="btn1" >일반인</button></div>&ndash;%&gt;--%>
<%--&lt;%&ndash;                <div><button id="btn2" >전문가</button></div>&ndash;%&gt;--%>
<%--            </div>--%>
<%--            <div class="center_box"></div>--%>
<%--            <div id="email_font">이메일</div>--%>
<%--            <div class="center_box" id="flex_box">--%>
<%--                <div id="email"><input type="text" name="email" placeholder="내용을 입력해주세요"></div>--%>
<%--                <div id="icon">@</div>--%>
<%--                <div id="drop">--%>
<%--                    <select id="sel" name="email_type">--%>
<%--                        <c:forEach var="i" items="${list}">--%>
<%--                            <option value="${i.code}">${i.name}</option>--%>
<%--                        </c:forEach>--%>
<%--                    </select>--%>

<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="center_box"></div>--%>
<%--            <div class="center_box">--%>
<%--                <button type="submit">이메일 인증</button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div id="body_right">right</div>--%>

<%--    </div>--%>
<%--    <div id="footer">footer</div>--%>

<%--</div>--%>
<%--</form>--%>
<%--</body>--%>

<%--<script>--%>
<%--    $("#email_certification").on("submit",function(){--%>
<%--        alert("메일이 발송되었습니다.");--%>
<%--    })--%>


<%--</script>--%>
</html>

