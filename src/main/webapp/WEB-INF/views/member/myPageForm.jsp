<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<head>
    <style>
        * {
            border: 1px solid black;
            box-sizing: border-box;
        }

        #container {
            margin: auto;
            text-align: center;

        }

        #navi {
            display: flex;
        }

        #navi_left {
            flex: 0.5;
        }

        #navi_center {
            flex: 1;
        }

        #navi_right {
            flex: 0.5;
        }


        /* 컨텐츠부분 */
        #body {
            display: flex;
        }

        #body_left {
            flex: 0.3;
        }

        #body_center {
            flex: 1;
        }

        #body_right {
            flex: 0.3;
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
           <a href=/member/myinfo><button>회원 정보 수정</button></a>
        </div>
        <div id="navi_right"></div>
    </div>
    <div id="body">
        <div id="body_left"></div>
        <div id="body_center">
            소설
            <button>신규등록</button>
            <br>
            만화
            <button>신규등록</button>
            <br>
            영상
            <button>신규등록</button>
            <br>
        </div>
        <div id="body_right"></div>

    </div>
    <div id="footer">footer</div>
</div>
</body>
</html>
