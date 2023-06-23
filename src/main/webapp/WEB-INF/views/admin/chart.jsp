<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin - Chart</title>
<!-- 공통 script & css -->
<c:import url="${path}/resources/js/scripts.jsp" />
<link href="${path}/resources/css/commons.css" type="text/css" rel="stylesheet">
</head>
<body>
	<!-- GNB & LNB -->
	<c:import url="${path}/resources/js/GNB.jsp">
		<c:param name="pageName" value="adminpage" />
		<c:param name="btnNum" value="${pagecode}" />
	</c:import>
	<!-- CONTENTS -->
	<div class="container-xl bg-secondary position-relative">
		<div class="row">
			<div class="col-9 w-100" id="member_type_chart" style="height: 500px"></div>
		</div>
		<div class="row">
			<div class="col-12 w-100" id="gallery_type_chart" style="height: 500px"></div>
		</div>
	</div>
	<!-- FOOTER -->
	<c:import url="${path}/resources/js/FOOTER.jsp" />
	<!-- script - Contents -->
	<script type="text/javascript">
		// 시각화 API & 코어 파트 패키지 로드
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		// API 로드될 때 실행할 콜백을 설정.
		google.charts.setOnLoadCallback(() => {
			drawChart("member_type_chart", 'PieChart', "Member Type", dataConvert(${memberCount}));
			drawChart("gallery_type_chart", 'BarChart', "Gallery Type", dataConvert(${galleryCount}));
		});
		
		// 데이터 테이블 채우기 & 파이 차트 인스턴스
		function drawChart(target, chart_type, title, data) {
			// 차트 옵션 설정
			var options = {
				'title' : title
			};

			// 차트 그리기
			var chart = new google.visualization.ChartWrapper();
			chart.setChartType(chart_type);
			chart.setDataTable(data);
			chart.setOptions(options);
			chart.setContainerId(target);
			
			chart.draw();
		}
		
		// 데이터 변환 함수
		function dataConvert(trans_data) {
			// 데이터를 담을 배열을 생성하고 헤더(컬럼명)를 추가
			var data = [ [ 'type', 'count' ] ];

			// memberCount의 각 요소를 반복하며 데이터 배열에 추가
			trans_data.forEach(function(item) {
					data.push([ item.type, item.count ]);
			});
			console.log(trans_data);
			// 데이터 테이블로 변환
			var chartData = google.visualization.arrayToDataTable(data);
			
			return chartData;
		}
	</script>
</body>
</html>