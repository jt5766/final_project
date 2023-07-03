<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <c:import url="${path}/resources/js/scripts.jsp"/>
    <link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha512/0.8.0/sha512.min.js"></script>
    <title>Document</title>
    <style>
        /**{border: 1px solid black}*/
        #wrap {
            display: flex;
            justify-content: center;
            width: calc(100vw - (100vw - 100%));
            height: 98vh;
            align-items: center;
        }

        #box1 {
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
            font-size: 13px;
        }

        h4 {
            font-size: 15px;
            font-weight: 50;
            color: #000000;
        }

        #info_box{
            display: flex;
            justify-content: center;
            flex-direction: column;
            display: none;

        }

        button{
            background-color: #5d5d5d;
            border-radius: 3px;
            color: white;
        }



        #dupl_font{
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

      #ChkId{
          font-size: 13px;
      }

    </style>
<body>

<!-- GNB & LNB -->
<c:import url="${path}/resources/js/GNB.jsp">
    <c:param name="pageName" value="mypage" />
    <c:param name="btnNum" value="1004" />
</c:import>
<div class="container-xl  position-relative p-0">
    <form action="/member/update" id="updatemember">
        <div id="wrap">
            <div id="box1">
                <div id="pass_box">
                    <h4>비밀번호 입력</h4>
                    <input type="password" id="pass"  placeholder="Password">
                    <input type="hidden" id="nick" value="${nickName}">
                    <button type="button" id="passwordChkBtn">확인</button>
                </div>

                <div id="info_box">
                    <div>
                        <h4>이메일</h4>
                        <input type="text" placeholder="Email" value="${email}@${set_email_type}" readonly>
                    </div>
                    <div>
                        <div id="dupl_font">
                            <h4>닉네임</h4>
                            <div id="ChkId"></div>
                        </div>
                        <input type="text" name="nickname" id="nickname" placeholder="Password" value="${nickName}">
                        <button id="duplicate_check" type="button"  onkeydown="inputNickChk">중복확인</button>
                    </div>
                </div>

                <div>
                    <button  id="infoUpdate" style="display: none">정보수정</button>
                    <button  type="button" id="passwordChange" style="display: none"> 비밀번호변경 </button>
                    <button  type="button" id="cancleBtn">취소</button>
                </div>

                <div>
                    <button  type="button" id="memberDelete" style="display:none">탈퇴 </button>
                </div>
            </div>


        </div>
    </form>
</div>
<c:import url="${path}/resources/js/FOOTER.jsp"/>

<script>
    $("#infoUpdate").attr("disabled", "disabled");
    var nickNameCheck;
    $("#passwordChange").click(function () {

        location.href = "/member/tofindPassword?email=${email}&email_type=${email_type}"
    })


    $("#passwordChkBtn").click(function () {


        const pass = $("#pass").val();
        const nick = $("#nick").val();
        const shapw = sha512(pass);
        $.ajax({
            url: "/member/passwordCheck",
            data: {
                password: shapw,
                nickname: nick
            },
            method: "post"
        }).done(function (resp) {
            resp = JSON.parse(resp);
            if (resp) {
                // $("#body_mid").css({display:"block"})
                $("#info_box").css("display", "inline-block")
                $("#pass_box").css({display: "none"})

                $("#infoUpdate").css("display", "inline-block")
                $("#passwordChange").css("display", "inline-block")
                $("#memberDelete").css("display", "inline-block")

            } else {

                alert("비밀번호를 다시입력해주세요");
            }
        })
    })


    /*탈퇴 버튼*/
    $("#memberDelete").click(function () {
        const result = confirm("회원을 탈퇴 하시겠습니까?")
        if (result) {
            location.href = "/member/memberDelete?code=${code}"
        }


    })
    /*취소 버튼*/
    $("#cancleBtn").click(function () {

        location.href = "/member/my-page/gallery"

    })

    const nickname = $('input[name=nickname]');
    $('#duplicate_check').on('click', function () {

        if(nickname.val()=== "${nickName}"){
            return
        }
        if (nickname.val().trim() !== '') {
            $.ajax({
                url: "/member/nickname/duplicate-check",
                data: {
                    nickname: nickname.val().trim()
                },
                contentType: "application/x-www-form-urlencoded; utf-8",
                method: "post"
            }).done(function (resp) {

                nickNameCheck = resp;
                if (resp > 0) {
                    $("#ChkId").html("사용할수없는 닉네임")
                    $("#ChkId").css('color','crimson')
                    $("#nickname").val("")

                } else {
                    $("#ChkId").html("사용가능한 닉네임")
                    $("#infoUpdate").attr("disabled", false);
                    $("#ChkId").css('color','dodgerblue')
                }
            });
        }
    });
    nickname.on('keydown', function () {
        $("#ChkId").html("");
        $("#infoUpdate").attr("disabled", true);
    })


    $('#updatemember').on('submit', function (e) {
        const nickname = $('input[name=nickname]');
        const nId=  $("#nId").css("display")
        if (nickname.val() === "" || nickNameCheck) {

            alert("중복 검사를 실시해주세요.");
            return false;
            e.preventDefault();
        }
    })
</script>
</body>
</html>
