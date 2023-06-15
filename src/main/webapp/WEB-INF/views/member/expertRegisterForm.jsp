
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
</head>
<%--파일 타입 인풋 히든 만들고 인풋파일 클래스를 주고 온체인지 이벤트를 걸어서 둘중 하나가 올라오면 하나의 네임값을 삭제  --%>



<form action="/member/createMember" method="post">
이메일<br>
  <input type="hidden" name="email_type" value="${emailType}">
  <input type="hidden" name="email" value="${email}">
  <input type="hidden" name="member_type" value="${memberType}">
<input type="text" value="${email}@${setEmailType}" readonly> <br>
비밀번호 <br>
<input type="password" name="password" placeholder="내용을 입력해주세요"><br>
비밀번호 확인<br>
<input type="text" placeholder="내용을 입력해주세요"><br>
닉네임<br>
<input type="text" name="nickname" placeholder="내용을 입력해주세요"><br>
사업자 등록증명서<br>
<input type="file" id="file1" required value=""><br>
재직 증명서<br>
<input type="file" id="file2" required value=""><br>
<button>회원가입</button><br>
<button>취소</button>


</form>
<script>
  $("#file1").on("change", function (){
      $("#file2").css({"display":"none"})
  });


</script>

</body>
</html>
