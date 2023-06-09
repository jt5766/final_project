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
<div id="container">
  <div id="header">gnb</div>
  <div id="navi">
    <div id="navi_left"></div>
    <div id="navi_center">마이페이지<br>
      <button>갤러리</button>
      <button>커뮤니티</button>
      <button>1:1채팅</button>
      <button>회원 정보 수정</button>
    </div>
    <div id="navi_right"></div>
  </div>
  <div id="body">
    <div id="body_left"></div>
    <div id="body_center"><br>
      <div id="body_top">
  <form action="/member/passwordCheck">
        비밀번호<br>
        <input type="text" name= "password" placeholder="내용을입력해주세요"> <button>확인</button>
        <input type="hidden" name="nickname" value="${nickname}">
  </form>
      </div><br>
      <div id="body_mid">
        이메일<br>
        <input type="text" placeholder="내용을입력해주세요"> <br>
        비밀번호<br>
        <input type="text" placeholder="내용을입력해주세요"> <br>
        비밀번호 확인 <br>
        <input type="text" placeholder="내용을입력해주세요"> <br>
        닉네임<br>
        <input type="text" placeholder="내용을입력해주세요"> <br><br>

      </div><br>

      <div id="body_bottom">
        <button>정보수정</button>
        <button>취소</button> <br><br>
        <button>탈퇴</button> <br>
      </div>
    </div>
    <div id="body_right"></div>

  </div>
  <div id="footer">footer</div>
</div>
</body>
</html>
