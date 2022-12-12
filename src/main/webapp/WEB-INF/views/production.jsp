<%@page import="kr.smhrd.entity.ProductionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>생산관리 Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/button.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- chart.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
        <!-- jquery 정의 -->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        
        
        <style>
        tr{
       
        	text-align : center;
        	font-size:16px;
        }
        
        a.dataTable-sorter{
        	text-align:center;
        }
        
        @media (max-width:576px) {
        	.add_production {
        		margin-left:-50px;
        	}
        }
        
        table input[type=text],
         table input[type=date],
         .custom_select
        {
        
       padding:0; margin:0; width:60%; ; border:none; background-color:transparent; height:30px; font-size:21px; text-align:center;
       }
       
       table input[type=text]:focus,
       table input[type=date]:focus,
       .custom_select
       {
      outline:none;
       }
       
       table tr{
       	height:40px;
       	line-height:40px;
       }
       
       .modal fade{
       	
       }
       
    </style>
    </head>
    <!-- 차트에 피요한 데이터 동기식 -->
    <% String chartDatas = (String) request.getAttribute("chartDatas"); %>
    
    <body class="sb-nav-fixed">
      
 	<%@ include file="nav-top.jsp" %>
 	<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
    	<%@ include file = "./nav.jsp" %>
        	</div>
            <div id="layoutSidenav_content" class="mt-2">
            	<main>
                	<div class="container-fluid px-4">
                		<h1 class="mt-4">생산관리 💫 <i class="fa-brands fa-waze fa-beat" style="color:black;"></i></h1>
                        <div class="card mb-4">
                        
                            <div class="card-header">
                            	 <!-- 출고 현황 차트 -->
		                        <div class="card mb-4">
		                            <div class="card-header" onclick="chartShow()" style="height:45px;">
		                                <p>
			                                <i class="fas fa-chart-area me-1"></i>제품 생산 현황
		                                </p>
		                            </div>
		                            
		                         <!-- 차트 들어올 부분 -->
			                     	<div id="manufactureChartArea" class="card-body" style="display:none;">
				                    	<div style="padding:1%;">
				                        	<canvas id="manufactureChart" style="overflow-x:scroll; width: 600px; height: 150px;"></canvas>
				                        </div>
			                    	</div>
		                        </div>
			                </div>
                         
                            <div class="card-body">         
                            	<!-- 검색 폼 -->
	                            <div class="production-search mt-2 mb-4" style="display:flex; justify-content:center;">
	                            		<form id="manufactureSearch" method = "post" style="display:grid; grid-template-columns : 23% 23% 23% 23% 8%; grid-gap:10px; ">
	                            			
	                            			<div class="date-search-form">
	                            				<input id="start_r_date" type = "date" class =" form-control" name = "start_r_date">
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="end_r_date" type = "date" class =" form-control" name = "end_r_date">
	                            			</div>
	                            			
	                            			<!-- 제품 코드 검색 부분 -->
	                            			<!-- 제품 코드 중복을 방지하기 위해 별도로 만든 prod_codeList로 받아온다 -->
	                            			<!-- VO 형태가 아닌 String prod_code 단일값이여서 코드가 들어있는 변수 manufacture만 쓰면됨 -->
	                            			<!-- ${manufacture} (O) /  ${manufacture.prod_code} (X) -->
	                            			<div class="prod_code_search-form">
		                            			<select id="prod_code" class="form-select" name="prod_code">
		                            				<option selected disabled> 제품 코드 </option>
			                            				<c:forEach items = "${prod_codeList}" var="manufacture">
															<option>${manufacture}</option>
														</c:forEach>
		                            			</select>
	                            			</div>
	                            			
	                            			<!-- 담당 사원 검색 부분 -->
	                            			<!-- 담당 사원 중복을 방지하기 위해 별도로 만든 nameList로 받아온다 -->
	                            			<!-- VO 형태가 아닌 String name 단일값이여서 코드가 들어있는 변수 manufacture만 쓰면됨 -->
	                            			<!-- ${manufacture} (O) /  ${manufacture.name} (X) -->
	                            			<div class="prod_code_search-form">
		                            			<select id="name" class="form-select" name="name">
		                            				<option selected disabled> 담당 사원 </option>
			                            				<c:forEach items = "${nameList}" var="manufacture">
															<option>${manufacture}</option>
														</c:forEach>
		                            			</select>
	                            			</div>

	                            			
	                            			<div class="pruduction_form_button">
	                            				<!-- 검색 버튼 -->
	                            				<button type="button" onclick="manufactureSearch()" class="btn btn-light"> 🔍 </button>
	                            				<!-- 검색 부분 초기화 / 생산관리 테이블 초기화 버튼 -->
		                            			<button type="reset"  onclick="prodload()" class="btn btn-dark">🔍 </button>
	                            			</div>
	                            		</form>
	                            	</div>
 
                                <table class="table table-borderless table-striped table-hover" >
                                    <thead class="table-secondary" >
                                        <tr>
                                            <th style="width:10%;" scope="col">생산 순번</th>
                                            <th style="width:10%;" scope="col">제품 코드</th>
                                            <th style="width:12.5%;" scope="col">생산 일자</th>
                                            <th style="width:12.5%;" scope="col">생산 수량</th>
                                            <th style="width:10%;" scope="col">담당 사원(사원번호)</th>
                                        	<th style="width:5%;" scope="col">삭제</th>
                                        </tr>
                                    </thead>
                                 </table>
           
           						<!-- 생산관리 DB에 있는 값 반복문 통해 보여주는곳 -->
           						<form id="deleteprod" method="post">
           							<div style="overflow-y:scroll; width:100%; height:400px; text-align:center;">
		           						<table class="table table-borderless table-striped table-hover" >
                                    	<tbody id="prodList">
         								<!-- list에서 하나씩 꺼내서 변수 manufacture에 담아라 라는 뜻  -->
         								<!-- VO에 묶여있기때문에 원하는 값을 가져오기 위해서는  manufacture.m_seq 이런 형태로 불러와야함-->
                                        <c:forEach items = "${list}" var="manufacture" >
                                        	<input type="hidden" name="m_seq" value = "${manufacture.m_seq}">
											<tr>
												<td style="width:14%;">${manufacture.m_seq}</td>
												<td style="width:15%;">${manufacture.prod_code}</td>
												<td style="width:19%;">${manufacture.prod_m_date}</td>
												<td style="width:16%;">${manufacture.m_cnt}</td>
												<td style="width:16.6%;">${manufacture.name}(${manufacture.emp_no})</td>
												<td style="width:5%;"><button type="button" data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-danger btn-sm">x</button></td>
											</tr>	
										</c:forEach>
                                 		</tbody>
		                               	</table>
	                               	</div>
                               	</form>
    
                                <!-- 생산 추가 부분-->
                                <form id="manufactureInsertFrm" method="post">
                                    <table class="table table-borderless table-striped table-hover">
	                                   	<tbody>
	                                        <tr class="table-warning">
	                                        	<td style="width:20%;">             
	                                        		<input type="text" class="custom_code" placeholder = "제품 코드" name="prod_code"/>
	                                        	</td>
	                                        		
	                                        	<td style="width:20%;">
	                                        		<input type="date" class ="custom_m_date" name ="prod_m_date"/>
	                                       		</td>
	                                        		
	                                       		<td style="width:20%;">             
	                                       			<input type="text" class="custom_cnt" placeholder = "생산수량" name="m_cnt"/>
	                                       		</td>
	                                        		
	                                       		<td style="width:20%;">             
	                                       			<input type="text" class="custom_emp_no" placeholder = "사원 번호 " name="emp_no"/>
	                                       		</td>
	
	                                       		<td style="width:20%;">
	                                       			<button type="button" onclick="manufactureInsert()" class="btn btn-primary btn-sm"> 추가 </button>
	                                       		</td>      	
	                                        </tr>  
                                    	</tbody>
                                	</table>
                               	</form>

                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">CPRMS</div>
                            <div>
                                <a href="#">made by</a>
                                &middot;
                                <a href="#">쫑쫑이</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-sm">
		    	<div class="modal-content">
		    			         
		     	<div class="modal-header">
					게시물을 정말 삭제하시겠습니까?
		     	</div>
			 	
			 	<div class="modal-footer">
		     		<button type="button" class="btn btn-primary" onclick="deleteprod()">삭제하기</button>
		      		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
			 	</div>
			      
				</div>
			</div>
		</div>
		
        
 		<script type="text/javascript">
 		
 		/* 차트 관련 기능 */
		// 차트 구역 보이기
		function chartShow() {
			// 안 보이면 보이게, 보이면 안 보이게
			if ($('#manufactureChartArea').css('display') == 'none') {
					$('#manufactureChartArea').slideDown(400);
			} else {
					$('#manufactureChartArea').slideUp(400);
			}
		}
		
		// 동기로 가져온 차트에 필요한 데이터
		var chartDatas = ${chartDatas}                  // 컨트롤러에서 가공하여 넘겨준 데이터를 jsonData 변수에 담는다
		// 페이지가 열렸을 때 실행
		manufactureChart(chartDatas);
		
		// 차트를 만들 수 있도록 데이터를 변환해서 차트를 만들어주는 함수
		function manufactureChart(data) {
			// 데이터가 새로 반영될 때마다 차트가 겹쳐서 이전 데이터가 보이는 상황을 방지하기 위해
			// 삭제 후 다시 만들기
			$('#manufactureChart').remove();
			$('#manufactureChartArea').append('<canvas id="manufactureChart" style="overflow-x:scroll; width: 600px; height: 150px;"></canvas>');
			
			var jsonObject = JSON.stringify(data);       // js에서 문자열 형태로 사용할 수 있도록 변환
			var jData = JSON.parse(jsonObject);          // 다시, json 객체로 사용할 수 있게 재변환된 데이터를 담음
			
			var labelList = new Array();
			var valueList = new Array();
			var colorList = new Array();
			
			for (var i = 0; i < jData.length; i++) {
				var d = jData[i];
				labelList.push(d.Code);     // jData에 담겨있는 값들 추출하여 분배
				valueList.push(d.Count);
				colorList.push(colorize()); // 그냥 랜덤하게 색깔 넣어주는 함수
			}
			
			var datas = {
					labels : labelList,
					datasets : [{
						backgroundColor : colorList,
						data : valueList
					}]
			};
			
			var ctx1 = document.getElementById("manufactureChart").getContext('2d');
			
			new Chart(ctx1, {
				type : 'bar',
				data : datas,
				options : {
					legend : {
						display : false
					},
					scales : {
						yAxes : [
							{
								ticks:{
									beginAtZero: true, // y축 범위설정 0부터 시작
									fontSize : 14,
								}
							}
							
						],
						xAxes : [
							{
								ticks : {
									fontSize : 20 // x축 폰트 크기 설정(제품 코드)
								}
							}
						]
					}
				}
			});
		}
		
		function colorize() { // 랜덤하게 색을 넣어주는 함수. 그냥 편의를 위해 넣음
			var r = Math.floor(Math.random()*200);
			var g = Math.floor(Math.random()*200);
			var b = Math.floor(Math.random()*200);
			var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
			return color;
		}
		

		// 차트 데이터 가져오는 함수
		function loadChartData() {
			$.ajax({
				url : "loadChartManufacture.do",
				dataType : "JSON", 
				success : manufactureChart,
				error : function(e){
					console.log(e);
				}
			});
		}
 		
		
 		// form에서 전송한 데이터를 받아 검색 내용을 조회하는 함수
		function manufactureSearch() {
			// form에서 id값이 manufactureSearch 이 전송한 데이터를 json 형태로 저장
			var frmData = $("#manufactureSearch").serialize();
			
			// ajax를 통해 searchmanufacture.do라는 곳으로 입력한 데터를 보내 select하고
			// prodList로 data 보냄
			$.ajax({
					url : "searchmanufacture.do",
					type : "POST",
					data : frmData,
					dataType : "JSON",
					success : prodList,
					error : function(e){
						console.log(e);
					}
				});
			};
 		
 		// 조회 결과를 받아 화면에 보여주는 함수
		function prodList(data) {
			var html = "";
			for (var i = 0; i < data.length; i++) {
					html += "<input type ='hidden' name='m_seq' value = " + data[i].m_seq + ">"
					html += "<tr>";
					html += "<td style='width:14%;'>" + data[i].m_seq + "</td>";	
					html += "<td style='width:15%;'>" + data[i].prod_code + "</td>";	
					html += "<td style='width:19%;'>" + data[i].prod_m_date + "</td>";	
					html += "<td style='width:16%;'>" + data[i].m_cnt + "</td>";	
					html += "<td style='width:16.6%;'>" + data[i].name + "(" + data[i].emp_no + ")" + "</td>";
					html += "<td style='width:5%;'><button type='button' data-bs-toggle='modal' data-bs-target='#exampleModal' class='btn btn-danger btn-sm'>x</button></td>"
					html += "</tr>";
				}
				// id가 "prodList"인 <tbody>안의 html 교체
				$('#prodList').html(html);
			}
		
		// 현재 DB에 저장된 데이터를 json 형태로 가져오는 함수
			function prodload() {
				$.ajax({
					url : "loadProd.do",
					success : prodList,
					error : function(e){
						console.log(e);
					}
				});
			}

		// 삭제 기능
			function deleteprod() {
				var frmData = $('#deleteprod').serialize();
				$("#exampleModal").modal('hide');
				
				$.ajax({
					url : "deleteprod.do",
					type : "POST",
					data : frmData,
					success : prodload,
					error : function(e){
						console.log(e);
					}
				});
			}
			
	   		/* 생산 정보 추가 기능 */
			// form에서 전송한 데이터를 받아 DB에 삽입하는 함수
			function manufactureInsert() {
				// form에서 id값이 manufactureInsertFrm 이 전송한 데이터를 json 형태로 저장
				var frmData = $("#manufactureInsertFrm").serialize();
				
				// ajax를 통해 insertmanufacture.do라는 곳으로 입력한 데이터를 보내 insert하고
				// prodList로 data 보냄
				$.ajax({
					url : "insertmanufacture.do", 
					type : "POST",
					data : frmData,
					success : prodload,
					error : function(e){
						console.log(e);
					}
				});
			
			}
		</script>
		
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
