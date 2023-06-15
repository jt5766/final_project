
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
</head>

<form action="/member/createMember" method="post">
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

<button>회원가입</button><br>
<button>취소</button>
</form>

</body>
</html>