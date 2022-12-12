<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<style type="text/css">
		@font-face {
		    font-family: 'LINESeedKR-Bd';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
		    font-weight: 700;
		    font-style: normal;
		}
		
		@font-face {
		    font-family: 'LINESeedKR-Rg';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Rg.woff2') format('woff2');
		    font-weight: 400;
		    font-style: normal;
		}
		
		.container {
			/* 한 줄에 다섯 개씩 정렬 */
			display: grid;
			grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
			width: 500px;
			height: 500px;
		}
		
		div {
			/* 창고 부분 글꼴 */
			font-family: 'LINESeedKR-Rg';
			font-size: 20px;
		}
		
		#title {
			/* 제품 보관 장소(rack) 부분 */
			width: 500px;
			text-align: center;
			/* 제목 상하에 마진 줌 (상우하좌 순서) */
			margin: 30px 0 20px 0;
		}
		
		.item {
			/* 창고 틀 */
			width:100px;
			height:100px;
			border:1px solid black;
			text-align:center;
			position: relative;
		}
		
		.led {
			/* 빨간 상자 */
			width: 25px;
			height: 25px;
			background-color: red;
			margin: auto;
			position: absolute;
			top: 50%;
			left: 50%;
			margin: -50px 0 0 -50px;
			
		}
		
		p {
			/* 제품 위치(A1 이런거) 중앙 정렬을 위해 위쪽에 마진 줌 */
			margin: 38px 0px 0px 0px;
		}
		
		.wrapper {
			/* 화면 중앙에 오게 하려고 제목이랑 창고랑 각각 div에 가두고 이거 속성 줌 */
			display: flex;
			justify-content: center;
			align-items: center;
		}
	</style>

</head>
<body onload="ledOn()"> <!-- 새로고침하면 ledOn 함수 실행 -->


	
	
	
	<input type="hidden" id="racks" value="${racks}">
	
	
	<script type="text/javascript">
	var array;
		function ledOn() {
			// 받아온 데이터 넣으셔서 쓰셔요
			var array = $("#racks").val();
           
            console.log(array);
            
			for (var i = 0; i < array.length; i+=4) {
				var id = array[1]+array[2];
				var id = array[i+1]+array[i+2]
				var html = "<p><b>" + id + "</p><div class='led' id='" + id + "'></div>"
				$("#" + id).html(html);
			}
			
		}
	
	</script>

	
	
	<div class="wrapper">
		<div style="font-family:'LINESeedKR-Bd'; font-size:30px;"><p id="title">제품 보관소(Rack)</p></div>
	</div>
	<div class="wrapper">
		<div class="container">
			<div id="A1" class="item">
				<p>A1</p>
			</div>
			<div id="A2" class="item">
				<p>A2</p>
			</div>
			<div id="A3" class="item">
				<p>A3</p>
			</div>
			<div id="A4" class="item">
				<p>A4</p>
			</div>
			<div id="A5" class="item">
				<p>A5</p>
			</div>
			<div id="B1" class="item">
				<p>B1</p>
			</div>
			<div id="B2" class="item">
				<p>B2</p>
			</div>
			<div id="B3" class="item">
				<p>B3</p>
			</div>
			<div id="B4" class="item">
				<p>B4</p>
			</div>
			<div id="B5" class="item">
				<p>B5</p>
			</div>
			<div id="C1" class="item">
				<p>C1</p>
			</div>
			<div id="C2" class="item">
				<p>C2</p>
			</div>
			<div id="C3" class="item">
				<p>C3</p>
			</div>
			<div id="C4" class="item">
				<p>C4</p>
			</div>
			<div id="C5" class="item">
				<p>C5</p>
			</div>
			<div id="D1" class="item">
				<p>D1</p>
			</div>
			<div id="D2" class="item">
				<p>D2</p>
			</div>
			<div id="D3" class="item">
				<p>D3</p>
			</div>
			<div id="D4" class="item">
				<p>D4</p>
			</div>
			<div id="D5" class="item">
				<p>D5</p>
			</div>
			<div id="E1" class="item">
				<p>E1</p>
			</div>
			<div id="E2" class="item">
				<p>E2</p>
			</div>
			<div id="E3" class="item">
				<p>E3</p>
			</div>
			<div id="E4" class="item">
				<p>E4</p>
			</div>
			<div id="E5" class="item">
				<p>E5</p>
			</div>
		</div>
	</div>
	
</body>
</html>