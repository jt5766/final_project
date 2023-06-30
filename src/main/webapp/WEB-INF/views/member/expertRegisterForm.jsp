<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <c:set var="path" value="${pageContext.request.contextPath}"/>
  <c:import url="${path}/resources/js/scripts.jsp"/>
  <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">


  <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha512/0.8.0/sha512.min.js"></script>

</head>
<%--파일 타입 인풋 히든 만들고 인풋파일 클래스를 주고 온체인지 이벤트를 걸어서 둘중 하나가 올라오면 하나의 네임값을 삭제  --%>




<style>
  /**{border: 1px solid black}*/

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
    align-items: center;
    justify-content: center;
    width: 400px;
    height: 500px;
    gap: 10px;
  }

  h3 {
    font-size: 20px;
    font-weight: 200;
    color: #ca9372;
  }

  #fileTitle {
    font-size: 10px;
    color: red;
  }

  input {
    width: 250px;
    border: 0px;
    border-bottom: 1px solid #ddd;
    transition-duration: .4s;
    outline: none;
  }

  input:focus {
    border-bottom: 1px solid #ca9372;
  }

  input::placeholder {
    font-size: 15px;

  }



  .filebox {
    display: flex;
    justify-content: space-between;
  }

  .filebox .upload-name {
    display: inline-block;
    height: 30px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    width: 60%;
    color: #999999;
  }

  .filebox label {
    display: inline-block;
    padding: 5px 10px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    font-size: 10px;

  }


  .filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
  }

  #btn-box {
    display: flex;
    justify-content: center;
    gap: 20px;
    width: 250px;
  }
  #btn-box div {
    width: 100%;
  }

  #cBtn, #sBtn {
    padding: 5px 10px;
    margin-top: 10px;
    width: 100%;
    background-color: #5d5d5d;
    border-radius: 3px;
    color: white;
  }

  #fileLayout{
    width: 252px;
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

<form action="/member/createMember" method="post" enctype="multipart/form-data" id="frm">
  <div id="wrap">
    <div id="loginBox">
      <h4>전문가인뎁쇼?</h4>
      <div>
        <h3>Email </h3>
        <input type="hidden" name="email_type" value="${emailType}">
        <input type="hidden" name="email" value="${email}">
        <input type="hidden" name="member_type" value="${memberType}">
        <input type="text" name placeholder="Email" value="${email}@${setEmailType}" readonly>
      </div>
      <div>
        <h3>Password</h3>
        <input type="hidden" name="password" id="shaPw" value="">
        <input type="password" id="pw" placeholder="Password">
      </div>
      <div>
        <h3>Check</h3>
        <input type="password" placeholder="Check-Password">
      </div>
      <div>
        <h3>NickName</h3>
        <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요">
      </div>


      <div id="fileLayout">
        <div>
        <h3 id="fileTitle">*사업자 등록증명서 혹은 재직증명서 를 입력해주세요.</h3>
        </div>
        <div class="filebox">
          <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
          <label for="file" >파일찾기</label>
          <input type="file" id="file" name="file" required>
        </div>
      </div>
      <div id="btn-box">
        <div>
        <button type="button" id="cBtn" onclick="cancle()">취소</button>
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


  const pw = $("#id").val();
  const nickname = $("#nickname").val();





  $("#file").on('change',function(){
    var fileName = $("#file").val();
    $(".upload-name").val(fileName);
  });

  function cancle(){
    if(!confirm("정말 가입을 취소하시겠습니까?")){
      return;
    }else {
      location.replace("/member/loginForm");
    }
  }



  $("#frm").on('submit',function (){
    const pw = $("#pw").val()
    const shaPw = sha512(pw);
    console.log(shaPw)
    $("#shaPw").val(shaPw);
    e.preventDefault();
  })




</script>
</body>

</html>
