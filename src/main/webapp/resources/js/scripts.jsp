<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- JQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- JQuery UI -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
<!-- Bootstrap : CSS & JS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap Icon -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/tabulator-tables@5.5.0/dist/js/tabulator.min.js"></script>
<!-- Auto Logout -->
<script>
	$(document).ready(function() {
		// 윈도우 닫기 상태 변수. [true - 사용 안함 / false - 사용 중]
		var closing_window = false;
	
		// 윈도우에 포커스 IN인 경우 false
		$(window).on('focus', function() {
			closing_window = false;
		});
	
		// 윈도우에 포커스 OUT인 경우 true
		$(window).on('blur', function() {
			closing_window = true;
	
			// 최소화인 경우 false
			if (!document.hidden) {
				closing_window = false;
			}
	
			// 창 크기 조절하는 경우 false
			$(window).on('resize', function(e) {
				closing_window = false;
			});
	
			// 다중 리스님 방지
			$(window).off('resize');
		});
	
		// 마우스가 HTML 영역 벗어나는 경우 true
		$('html').on('mouseleave', function() {
			closing_window = true;
		});
	
		//  마우스가 HTML 영역 진입하는 경우 false
		$('html').on('mouseenter', function() {
			closing_window = false;
		});
	
		// 키 입력 이벤트
		$(document).on('keydown', function(e) {
			// ALT+TAB & window 단축키 인경우 false
			if (e.keyCode == 91 || e.keyCode == 18) {
				closing_window = false;
			}
			// 새로고침 (F5 & CTRL+F5 & CTRL+R) 인 경우 false
			if (e.keyCode == 116 || (e.ctrlKey && e.keyCode == 82)) {
				closing_window = false;
			}
			// mac[Meta(91) - Q (81) / W (87) / R(82)]
			if (e.metaKey && (e.keyCode == 81 || e.keyCode == 87 || e.keyCode == 82) ) {
				closing_window = false;
			}
		});
	
		// a 태그 클릭한 경우 false
		$(document).on("click", "a", function() {
			closing_window = false;
		});
	
		// 버튼 클릭한 경우 false
		$(document).on("click", "button", function() {
			closing_window = false;
		});
	
		// submit 한 경우 false
		$(document).on("submit", "form", function() {
			closing_window = false;
		});
	
		// submit input 클릭한 경우 false
		$(document).on("click", "input[type=submit]", function() {
			closing_window = false;
		});
	
		// 종료시 진행할 함수 - 동기 통신으로 종료 실행
		var toDoWhenClosing = function() {
			  navigator.sendBeacon("/member/logOut/", "");
		};
	
		// 종료시 기능 실행
		window.addEventListener("beforeunload", function(e) {
			if (closing_window) {
				toDoWhenClosing();
			}
		});
	});
</script>