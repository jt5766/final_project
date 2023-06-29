<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
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
                        <input type="text" placeholder="email" name="email" required>
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
            <form action="/member/updatePassword">
                <div id="find-password2">
                    <div>
                        <h4>이메일</h4>
                        <input type="hidden" name="email" value="${email}">
                        <input type="hidden" name="email_type" value="${email_type}">
                        <input type="text" placeholder="email" value="${email}@${set_email_type}" readonly>
                    </div>
                    <div>
                        <h4>새로운 비밀번호를 입력해주세요</h4>
                        <input type="password" name="password" required>
                    </div>
                    <div>
                        <h4>비밀번호를 확인해주세요</h4>
                        <input type="password" required>
                    </div>
                    <div>
                        <button id="sendMail-btn2">확인</button>
                    </div>
                </div>

            </form>
        </div>
        <c:import url="${path}/resources/js/FOOTER.jsp"/>


        <%--            <input type="hidden" name="email" value="${email}">--%>
        <%--            <input type="hidden" name="email_type" value="${email_type}">--%>
        <%--            이메일--%>
        <%--            <input type="text" readonly value="${email}@${set_email_type}"> <br>--%>
        <%--            새로운 비밀번호를 입력해주세요--%>
        <%--            <input type="password" name="password"> <br>--%>

        <%--            비밀번호를 확인해주세요--%>
        <%--            <input type="password"> <br>--%>
        <%--            <input type="submit">--%>

    </c:otherwise>
</c:choose>

<script>



</script>

</body>
</html>