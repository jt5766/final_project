<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
  <title>Document</title>
  <style>
    *{
      border: 1px solid black;
      box-sizing: border-box;
    }
    #container{
      margin: auto;
      text-align: center;

    }



    #navi{
      display: flex;
    }

    #navi_left{
      flex: 0.5;
    }
    #navi_center{
      flex: 1;
    }
    #navi_right{
      flex: 0.5;
    }


    /* 컨텐츠부분 */
    #body{
      display: flex;

    }

    #body_left{
      flex: 0.3;
    }
    #body_center{
      flex: 1;
    }
    #body_mid{
      display: none;
    }

    #body_right{
      flex: 0.3;
    }


    #body_center div{

    }


  </style>
</head>
<body>
<form action="/member/update">
<div id="container">
  <div id="header">gnb</div>
  <div id="navi">
    <div id="navi_left"></div>
    <div id="navi_center">마이페이지<br>
      <button type="button">갤러리</button>
      <button type="button">커뮤니티</button>
      <button type="button">1:1채팅</button>
    </div>
    <div id="navi_right"></div>
  </div>
  <div id="body">
    <div id="body_left"></div>

    <div id="body_center"><br>
      <div id="body_top">
        비밀번호<br>
        <input type="password" id="pass" placeholder="내용을입력해주세요"> <button type="button" id="passwordChkBtn">확인</button>
        <input type="hidden" id="nick"  value="${nickName}">

      </div><br>

      <div id="body_mid">
        이메일<br>
        <input type="text" placeholder="내용을입력해주세요" value="${email}@${set_email_type}" readonly> <br>
       새로운 비밀번호<br>
        <input type="password" name= password placeholder="내용을입력해주세요"> <br>
        비밀번호 확인 <br>
        <input type="password" placeholder="내용을입력해주세요"> <br>
        닉네임<br>
        <input type="text" name="nickname" placeholder="내용을입력해주세요" value="${nickName}" > <br><br>

      </div><br>

      <div id="body_bottom">
        <button>정보수정</button>
        <button type="button" id="cancleBtn">취소</button> <br><br>
        <button type="button" id="signOutBtn">탈퇴</button> <br>
      </div>
    </div>
    <div id="body_right"></div>

  </div>

  <div id="footer">footer</div>
</div>
</form>
<script>
    $("#passwordChkBtn").click(function (){
      const pass = $("#pass").val();
      const nick = $("#nick").val();

      $.ajax({
          url:"/member/passwordCheck",

        data:{
            password:pass,
            nickname:nick
        },
        method:"post"
      }).done(function (resp) {
        resp = JSON.parse(resp);
        if(resp){
          // $("#body_mid").css({display:"block"})
          $("#body_mid").css("display","block")
          $("#body_top").css({display:"none"})

        }else{

          alert("비밀번호를 다시입력해주세요");
        }
      })
    })

    $("#cancleBtn").click(function (){
      location.href="/member/mypage"

    })

</script>
</body>
</html>
