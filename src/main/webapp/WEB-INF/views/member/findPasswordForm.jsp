<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <c:import url="${path}/resources/js/scripts.jsp" />
</head>
<body>
    <c:choose>
        <c:when test="${email == null}">
            <form action="/member/passwordChange" method="post">
                이메일을 입력해주세요
                <input type="text" name="email"><input type="submit">
            </form>
        </c:when>
        <c:otherwise>
            <form action="/member/updatePassword">
                <input type="hidden" name="email" value="${email}">
                <input type="hidden" name="email_type" value="${email_type}">
                이메일
                <input type="text" readonly value="${email}@${set_email_type}"> <br>
                새로운 비밀번호를 입력해주세요
                <input type="password" name="password"> <br>

                비밀번호를 확인해주세요
                <input type="password"> <br>
                <input type="submit">
            </form>
        </c:otherwise>
    </c:choose>

</body>
</html>
