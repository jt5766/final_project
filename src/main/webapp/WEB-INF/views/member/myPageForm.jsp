<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" scope="session" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.min.js"></script>
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
<style>
* {
	border: 1px solid black;
	box-sizing: border-box;
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

.secrete {
	color: red;
}
</style>
</head>
<body>
	<c:import url="${path}/resources/js/GNB.jsp" />
	<div id="lnb">
		<h3 class="text-center">마이페이지</h3>
		<nav class="navbar navbar-expand-lg bg-light">
			<div class="container-xl justify-content-evenly btn-group">
				<button class="btn btn-outline-dark read-btn" id="gallery">갤러리</button>
				<button class="btn btn-outline-dark read-btn" id="community">커뮤니티</button>
				<button class="btn btn-outline-dark" onclick="location.href='/chat/testlink'">1:1 채팅</button>
				<button class="btn btn-outline-dark" onclick="location.href='/member/myinfo'">회원 정보 수정</button>
			</div>
		</nav>
	</div>
	<div class="container-xl" id="my-content"></div>
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<script>
	$('.read-btn').on('click', function() {
	    $.ajax({
	          url:"/member/my-page",
	          contentType:"text/plain; utf-8",
	          accept:"application/json",
	          data:{tCode:$(this).attr('id')}
	      }).done(resp => {
	          console.log(resp);
	          $('#my-content').html(makeDom(resp));
	      });
	})

  const makeDom = (resp) => {
      let type = [];
      if(resp[9999] === 'gallery'){
	  	type = JSON.parse('${categoryType}');
      } else if (resp[9999] === 'community') {
	  	type = JSON.parse('${boardType}');
      }

      const baseContainer = $('<div class="col-me-6">').appendTo($('<div class="row">'));
      for (let i = 0; i < type.length; i++) {
          const data = resp[type[i].code];
          baseContainer.append($('<div class="d-flex justify-content-between">').text(type[i].name));
          if (resp[9999] === 'gallery'){
              for (let i = 0; i < data.length; i++) {
                  if (data[i].yn === 'N') {
                      baseContainer.append(
                          `
    <div onclick="location.href='/\${resp[9999]}/\${data[i].seq}'" class="secrete">
        \${data[i].title}
    </div>`);
                  } else {
                      baseContainer.append(
                          `
    <div onclick="location.href='/\${resp[9999]}/\${data[i].seq}'">
        \${data[i].title}
    </div>`);
                  }
              }
          } else if (resp[9999] === 'community') {
              let code = type[i].code;
              for (let i = 0; i < data.length; i++) {
        	  baseContainer.append(`
<div onclick="location.href='/\${resp[9999]}/toBoardView?seq=\${data[i].seq}&board_type=\${code}'">
	\${data[i].title}
</div>`);
              }
          }
      }
      return baseContainer;
  }
  const toInsert = (e) => {
      location.href=`/gallery/toInsert/\${code}`
  }

</script>
</body>
</html>
