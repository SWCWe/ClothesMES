<%@page import="kr.smhrd.entity.ReleaseVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <title>출고관리 Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/button.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- jquery 정의 -->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>

        <!-- Chart.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
		<!-- <style type="text/css">
			.modal{
				position:absolute;
				width:100%;
				height:100%;
				background:rgba(0, 0, 0, 0, 8);
				top:0;
				left:0;
				display:none;
			}
		</style>
	 -->
    </head>
    
    <body class="sb-nav-fixed">
    
    <%
    	// 출고 순번, 제품 코드, 출고 일자, 출고 수량, 주문 순번, 담당자 이름, 보관 장소
    	List<ReleaseVO> list = (List<ReleaseVO>) request.getAttribute("list");
    
    	// 담당자 이름(중복X)
    	List<String> nameList = (List<String>) request.getAttribute("nameList");
    	
    	// 제품 코드(중복X)
    	List<String> prod_codeList = (List<String>) request.getAttribute("prod_codeList");
    	
    	// 주문 순번(중복X)
    	List<String> order_seqList = (List<String>) request.getAttribute("order_seqList");
    	
    	// 추가 폼에 들어갈 데이터
    	List<String> plusProd_codeList = (List<String>) request.getAttribute("plusProd_codeList");
    	List<String> plusOrder_seqList = (List<String>) request.getAttribute("plusOrder_seqList");
    	List<String> plusProd_rackList = (List<String>) request.getAttribute("plusProd_rackList");
    	
    	// 차트에 필요한 데이터
    	String chartDatas = (String) request.getAttribute("chartDatas");
    	
    	// 모달에 필요한 시퀀스를 저장할 변수
    	int r_seq = -1;
    %>
    
 <%@ include file="nav-top.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                          <%@ include file = "./nav.jsp" %>
            </div>
            <div id="layoutSidenav_content" class="mt-2">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">출고 관리 <i class="fa-brands fa-waze fa-beat" style="color:black;"></i></h1>
                        
                        <div class="card mb-4"></div>
                        
                        <!-- 출고 현황 차트 -->
                        <div class="card mb-4">
                            <div class="card-header arrow" onclick="chartShow()" style="height:45px; line-height:25px;">
                                <p style="margin-left:30px;">
	                              	제품 출고 현황
                                </p>
                            </div>
                            <!-- 차트 들어올 부분 -->
                            <div id="releaseChartArea" class="card-body" style="display:none;">
                            	<form>
                            		<div class="chart-form d-flex justify-content-center mt-3">
                            		<input type="text" class="form-control" name="cnt" id="cnt" style="width:300px;">
                            		<button type="button" onclick="releaseTB('top')" class="btn btn-lg btn-light" name="top" value="top">상위</button>
	                            	<button type="button" onclick="releaseTB('bottom')" class="btn btn-lg btn-light" name="bottom" value="bottom">하위</button>
	                            	<button type="reset" onclick="loadChartData(); d-con()" class="btn btn-lg btn-light" name="return" value="return">되돌리기</button>
                            		</div>
                            		
                            	</form>
                            	<div style="padding:1%;">
                            		<canvas id="releaseChart" style="overflow-x:scroll; width: 600px; height: 150px;"></canvas>
                            	</div>
                            </div>
                        </div>
                        
                        <div class="card mb-4">
                            <div class="card-header">
                               
                            </div>
                            <div class="card-body">
                            
                            	<!-- 검색 폼 -->
	                            <div class="production-search release mt-2 mb-4">
	                            		<form id="releaseSearch" method = "post">
	                            			
	                            			
	                            			<!-- 리셋 버튼 -->
	                            			<div class="pruduction_form_button d-flex justify-content-end">
	                            				<button type="reset" onclick="releaseLoad()" class="btn btn-light btn-lg">
                            						<i class="fa-solid fa-arrow-rotate-left"></i>
                            				  	</button>
	                            			</div>
	                            			
	                            			<!-- 제품 코드 검색 부분 -->
	                            			<div class="prod_code_search-form">
		                            			<select id="prod_code" class="form-select" name="prod_code">
		                            				<option selected disabled> 제품 </option>
	                            				<%for (int i = 0; i < prod_codeList.size(); i++) { %>
	                            					<option><%=prod_codeList.get(i) %></option>
	                            				<%} %>
		                            			</select>
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="start_r_date" type = "date" class =" form-control" name = "start_r_date">
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="end_r_date" type = "date" class =" form-control" name = "end_r_date">
	                            			</div>
	                            			
	                            			<!-- 주문 순번 검색 부분 -->
	                            			<div class="order_seq_search-form">
		                            			<select id="order_seq" class="form-select" name="order_seq">
		                            				<option selected disabled> 주문 순번 </option>
	                            				<%for (int i = 0; i < order_seqList.size(); i++) { %>
	                            					<option><%=order_seqList.get(i) %></option>
	                            				<%} %>
		                            			</select>
	                            			</div>
	                            	
	                            			<!-- 담당자 검색 부분 -->
	                            			<div class="emp_search_form">
	                            			<select id="name" class="form-select" name="name">
	                            				<option selected disabled> 담당자 </option>
	                            				<!-- 담당자 목록 출력 -->
	                            				<%for (int i = 0; i < nameList.size(); i++) { %>
	                            					<option><%=nameList.get(i) %></option>
	                            				<%} %>
	                            			</select>
	                            			</div>
	                            			
	                            			<!-- 검색 버튼 -->
	                            			<div class="pruduction_form_button">
	                            				<button type="button" onclick="releaseSearch()" class="btn btn-light btn-lg"> <i class="fa-solid fa-magnifying-glass"></i></button>
	                            			</div>
	                            			
	                            		</form>
	                            	</div>
                            
                            
                                <table class="table table-borderless table-striped table-hover" >
                                    <thead class="table-secondary" >
                                        <tr>
                                            <th style="width:10%;" scope="col">출고 순번</th>
                                            <th style="width:10%;" scope="col">주문 순번</th>
                                            <th style="width:12.5%;" scope="col">제품 코드</th>
                                            <th style="width:12.5%;" scope="col">출고 일자</th>
                                            <th style="width:10%;" scope="col">출고 수량</th>
                                            <th style="width:12.5%;" scope="col">담당자</th>
                                            <th style="width:12.5%;" scope="col">보관 장소</th>
                                        	<th style="width:5%;" scope="col">삭제</th>
                                            <th style="width:1%;" scope="col"></th>
                                        </tr>
                                    </thead>
                                 </table>
                                 
                                 <form id="deleteRelease" method="post">
	                                 <div style="overflow-y:scroll; width:100%; height:300px; text-align:center;">
	                                 
	                                 
		           						<table class="table table-borderless table-striped table-hover" >
		                                   	<!-- 출고 목록 보기 기능 -->
		                                    <tbody id="releaseList">
		                                    
		                                    
		                                    	<c:forEach items="${list}" var="release" varStatus="i">
													<input type="hidden" name="r_seq" value="${release.r_seq}">
			                                    	<tr>
			                                    		<td style="width:10%;">${release.r_seq}</td>
			                                    		<td style="width:10%;">${release.order_seq}</td>
			                                    		<td style="width:12.5%;">${release.prod_code}</td>
			                                    		<td style="width:12.5%;">${release.r_date}</td>
			                                    		<td style="width:10%;">${release.r_cnt}</td>
			                                    		<td style="width:12.5%;">${release.name}</td>
			                                    		<td style="width:12.5%;">${release.prod_rack}</td>
			                                    		<td style="width:5%;">
			                                    			<button type="button" class="btn btn-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal">X</button>
			                                    		</td> 
			                                    		
			                                    		<!-- <td style="width:5%;">
			                                    			<button id="modalBtn" type="button">X</button>
			                                    		</td> -->
			                                    	</tr>

		                                    	</c:forEach>
		                                   	</tbody>
		                               	</table>
	                               	</div>
                               	</form>
                               	
                               	<!-- 출고 정보 추가 폼 -->
                               	<form id="releaseInsertFrm" method="post">
	                               	<table class="table table-borderless table-striped table-hover">
	                                   	<tbody>
                                        	<tr class="table-warning">
                                        	
                                        		<td style="width:10%;"></td>
                                        		
                                        		<td style="width:10%;">
                                        			<select id="order_seqCategory" onChange="prod_codeChange(this.value)" class="custom_select" name="order_seq">
	                                        			<option selected disabled> 주문 순번 </option> 
	                                        			<%for (int i = 0; i < plusOrder_seqList.size(); i++) { %>
	                            							<option><%=plusOrder_seqList.get(i) %></option>
	                            						<%} %>
	                            					</select>
                                        		</td>
                                        		
                                        		<td style="width:12.5%">
                                        			<select id="prod_codeCategory" class="custom_select" name="prod_code">
                                        				<option selected disabled> 제품 코드 </option>
                                        			</select>
                                        		</td>
                                        		 
                                        		<td style="width:12.5%;">
                     									<input type="date" name="r_date">
                                        		</td>
                                        		
                                        		<td style="width:10%;">
                                        			<input type="text" class="custom_select" placeholder = "출고 수량" name="r_cnt"/>
                                        		</td>
                                        		
                                        		<td style="width:12.5%;" >
                                        			<input type="text" class="custom_select" placeholder = "사번" name="emp_no"/>
                                        		</td>
                                        		
                                        		<td style="width:12.5%;">
                                        			<button type="button" onclick="releaseInsert()" class="btn btn-primary btn-sm"> 추가 </button>
                                        		</td>
                                        		
                                        		<td style="width:6%;" scope="col"></td>
                                        		
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
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        
        <!-- Modal -->
        
        <div class='modal'>
        	<div class='modal_content'>
        		삭제하시겠습니까?
        	</div>
        </div>
        
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		         	정말로 삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		        <button type="button" onclick="deleteRelease();" class="btn btn-primary">삭제</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		     
		      </div>
		    </div>
		  </div>
		</div> 
        
 	

		<script type="text/javascript">
		
		/* 출고 데이터 삭제 기능 */
			function deleteRelease() {
				var frmData = $("#deleteRelease").serialize();
				$('#exampleModal').modal('hide');
				$.ajax({
					url : "deleteRelease.do",
					type : "POST",
					data : frmData,
					success : releaseLoad,
					error : function(e){
						console.log(e);
					}
				});
			}
		
			/* 차트 관련 기능 */
			
			// 차트 구역 보이기
			function chartShow() {
				// 안 보이면 보이게, 보이면 안 보이게
				if ($('#releaseChartArea').css('display') == 'none') {
					$('#releaseChartArea').slideDown(400);
				} else {
					$('#releaseChartArea').slideUp(400);
				}
			}
			
			// 동기로 가져온 차트에 필요한 데이터
			var chartDatas = ${chartDatas}                   // 컨트롤러에서 가공하여 넘겨준 데이터를 jsonData 변수에 담는다
			// 페이지가 열렸을 때 실행
			releaseChart(chartDatas);
			
			// 차트를 만들 수 있도록 데이터를 변환해서 차트를 만들어주는 함수
			function releaseChart(data) {
				// 데이터가 새로 반영될 때마다 차트가 겹쳐서 이전 데이터가 보이는 상황을 방지하기 위해
				// 삭제 후 다시 만들기
				$('#releaseChart').remove();
				$('#releaseChartArea').append('<canvas id="releaseChart" style="overflow-x:scroll; width: 600px; height: 150px;"></canvas>');
				
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
				
				var ctx1 = document.getElementById("releaseChart").getContext('2d');
				
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
			
			// 상위/하위 n개 데이터 차트 보이기
			function releaseTB(data) {
				// 사용자가 직접 입력한 수
				var cnt = document.getElementById('cnt').value;
				// data -> 어떤 버튼인지 구별
				$.ajax({
					url : "releaseTB.do",
					method : "POST",
					data : {"cnt" : cnt,
							"data": data},
					dataType : "JSON", 
					success : releaseChart,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 차트 데이터 가져오는 함수
			function loadChartData() {
				$.ajax({
					url : "loadChartRelease.do",
					dataType : "JSON", 
					success : releaseChart,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			/* 출고 정보 검색 기능 */
			// form에서 전송한 데이터를 받아 검색 내용을 조회하는 함수
			function releaseSearch() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#releaseSearch").serialize();

				// ajax를 통해 searchRelease.do라는 곳으로 입력한 데이터를 보내 select하고
				// releaseList로 data 보냄
				$.ajax({
					url : "searchRelease.do",
					type : "POST",
					data : frmData,
					dataType : "JSON",
					success : releaseList,
					error : function(e){
						console.log(e);
					}
				});
			};
			
			/* 다른 함수에서 데이터를 받아 화면에 보여주는 함수 */
			// db가 바뀔때마다 실행
			function releaseList(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<input type='hidden' name='r_seq' value=" + data[i].r_seq + ">";
					html += "<tr>";
					html += "<td style='width:10%;'>" + data[i].r_seq + "</td>";	
					html += "<td style='width:10%;'>" + data[i].order_seq + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].prod_code + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].r_date + "</td>";	
					html += "<td style='width:10%;'>" + data[i].r_cnt + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].name + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].prod_rack + "</td>";
					html += "<td style='width:5%;'><button type='button' class='btn btn-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#exampleModal'>X</button></td>"
					html += "</tr>";
				}
            	
				// id가 "releaseList"인 <tbody>안의 html 교체
				$('#releaseList').html(html);
				
				// db가 바뀌었을 때(추가, 삭제) 차트에도 바로 반영되도록
				loadChartData();
			}
			
			/* 출고 정보 추가 기능 */
			// form에서 전송한 데이터를 받아 DB에 삽입하는 함수
			function releaseInsert() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#releaseInsertFrm").serialize();
				
				// ajax를 통해 insertRelease.do라는 곳으로 입력한 데이터를 보내 insert하고
				// ReleaseList로 data 보냄
				$.ajax({
					url : "insertRelease.do",
					type : "POST",
					data : frmData,
					success : releaseLoad,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 현재 DB에 저장된 데이터를 json 형태로 가져오는 함수
			function releaseLoad() {
				$.ajax({
					url : "loadRelease.do",
					success : releaseList,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			
			
			/* 추가 폼 관련 함수 */
			// 추가 폼에서 주문 순번에 따라 제품 코드를 다르게 보여주는 함수
			// 주문 순번에 포함되어 있는 제품 코드만 가져오기
			function prod_codeChange() {
				var order_seq = document.getElementById("order_seqCategory").value;
				
				$.ajax({
					url : "prod_codeChange.do",
					type : "POST",
					data : {"order_seq" : order_seq},
					success : prod_codeCategoryChange,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 추가 폼의 카테고리 바꿔주는 함수
			function prod_codeCategoryChange(data) {
				var html = "<option selected disabled> 제품 코드 </option>";
				console.log(data)
				for (var i = 0; i < data.length; i++) {
					html += "<option>" + data[i] + "</option>";
				}
				// 추가 폼의 제품 코드 카테고리 html 교체
				$('#prod_codeCategory').html(html);
			}
			
			/* 모달 띄우기 */
			
		/* 	function showModal(data) {
				var 
			}
			
			$(function(){
				$("#modalBtn").click(function(){
					$(".modal").fadeIn();
				});
				$(".modal_content").click(function(){
					$(".modal").fadeOut();
				});
			}); */
			


		</script>
			
			
			
							
		<!-- release.js와 연결 -->
		<!-- <script src="${path}/resources/js/release.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="${path}/resources/js/chart.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" <script src="${path}/resources/js/scripts.js"></script>crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
