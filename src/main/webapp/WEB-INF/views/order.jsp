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
        <title>주문 관리 Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/button.css" rel="stylesheet" />
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
         
         
        
    
    
    
    
    <body class="sb-nav-fixed">
    
 <%@ include file="nav-top.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                          <%@ include file = "./nav.jsp" %>
            </div>
            <div id="layoutSidenav_content" class="mt-2">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">주문 관리 📋</h1>
                        
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                
                               
                            </div>
                            <div class="card-body">
                               	

                             
                            	<!-- 검색 폼  -->
                               	
                               	<div class="production-search order mt-2 mb-4">
                               	<form id="orderSearch" method = "post">
                               	
                            		<!-- 리셋버튼 -->
                            		<div class="pruduction_form_button d-flex justify-content-end">
                           				<button type="reset" onclick="orderLoad()" class="btn btn-lg btn-light">
                           				<i class="fa-solid fa-arrow-rotate-left"></i>
                           				</button>
                           			</div>
                            			
                        			<div class="date-search-form">
                           				<input id="start_r_date" type="date" class="form-control" name="start_r_date">
                           			</div>
                           			
                           			<div class="date-search-form">
                           				<input id="end_r_date" type="date" class="form-control" name="end_r_date">
                           			</div>
                            			
                           			<div class="prod_code_search-form">
                           				<input id="order_seq" type="number" class="form-control" name="order_seq" placeholder="주문 번호">
                           			</div>
                           			
                           			<div class="date-search-form">
                            			<input type ="text" id ="idSearch" class="form-control" name="cus_id" placeholder="주문 아이디">
                           			</div>
                           			
                           			<!-- 출고 여부 검색 -->
                           			<div class="date-search-form">
                            			<select id="od_status" class="form-select" name="od_status">
                            				<option value=0>주문 접수</option>
                            				<option value=1>출고 완료</option>
                            				<option value=2>전체</option>
                            			</select>
                           			</div>
                           			
                           			<div class="pruduction_form_button">
                           				<button type="button" onclick="orderSearch()" class="btn btn-light btn-lg"> <i class="fa-solid fa-magnifying-glass"></i> </button>
                           			</div>
                           		</form>
                           	</div>
                            
                               
                            <!-- TABLE HEADER -->
                                <table id="" class="table table-borderless table-striped table-hover" >
                                  <thead>
                                        <tr class="table-secondary">

                                            <th style="width:10%">주문 번호</th>
                                            <th style="width:20%">접수 날짜</th>
                                            <th style="width:20%">주문 아이디</th>
                                            <th style="width:12%">주문 개수</th>
                                            <th style="width:12%">주문 상세</th>
                                            <th style="width:12%">출고 상태</th>
                                            <th style="width:10%"> 삭제 </th>
                                            <th style="width:2%"></th>
                                        </tr>
                                    </thead>

                                  </table>
                                    
                                    <form id="deleteorder" method="post">
           						
           					     <div style="overflow-y:scroll; width:100%; height:300px; text-align:center;">
           						
           						<!--  table body  -->
           						<table class="table table-borderless table-striped table-hover">
           						
                                    <tbody id="list">
                        				
                        				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
	                                        <tr>
	                                            <td style="width:10%;">${prod.order_seq}</td>
	                                            <td style="width:20%;">${prod.order_date}</td>
	                                            <td style="width:20%;">${prod.cus_id}</td>
	                                            <td style="width:12%;">${prod.all_cnt}</td>
	                                            <td style="width:12%;"><button type="button" onclick="orderDetailLoad(${prod.order_seq})" class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#orderModal">확인</button></td>
	                                            <c:if test="${prod.od_status == 0}"><td style="width:12%;">주문 접수</td></c:if>
	                                            <c:if test="${prod.od_status > 0}"><td style="width:12%;">출고 완료</td></c:if>
	                                            <td style="width:10%;"><button type="button" onclick="" class="btn btn-secondary btn-sm">X</button></td>
	                                        </tr>
                                    	</c:forEach>
                        				
                        			</tbody>
                        			</table>
                        			  </div>
                        			
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
        
        <!-- 주문 상세 Modal -->
                
		<div class="modal fade" id="orderModal"  aria-labelledby="exampleModalLabel" aria-hidden="true">
		  	<div class="modal-dialog">
		    	<div class="modal-content">
		      		
		      		<div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
		      		
		      		<div id="orderDetailList" class="modal-body">
                        <!-- 비동기로 html 삽입 -->
		      		</div> <!-- modal-body -->
		      		
		    	</div>
		  	</div>
		</div>
		
        <!-- 출고 확인 Modal -->
                
		<div class="modal fade" id="releaseCkModal" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  	<div class="modal-dialog">
		    	<div class="modal-content">
		      		
		      		<div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      		</div>
		      		
		      		<div id="" class="modal-body">출고하시겠습니까?</div>
		      		<div class="modal-footer">
		      			<button type='button' class='btn btn-lg btn-secondary' data-bs-dismiss='modal' onclick='rCompletion()'>출고 완료</button>	
		      			<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>닫기</button>	
		      		</div>
		    	</div>
		  	</div>
		</div>

        
     	<script type="text/javascript">
     	var html = $("#list").html();
     	  
     	// 아이디 검색으로 주문정보 가져오기
     	
     	$('#idSearch').on("keyup", function(key){
			var idSearch = $("#idSearch").val();
			
			if(idSearch.length >0){
				$.ajax({
					url : "idSearch.do",
					type : "POST",
					data : {"idSearch" : idSearch} ,
					datatype: "JSON" ,
					success : orderList ,
					error : function(e){
						console.log(e);
					}
					
				});
			}else{
				
				 $("#list").html(html);
			}
			
			});
	
     	
     	
			/* 주문 정보 검색 기능 */
			
			// form에서 전송한 데이터를 받아 검색 내용을 조회하는 함수
			// ajax를 통해 searchOrder.do라는 곳으로 입력한 데이터를 보내 select하고
			// orderList로 data 보냄
			function orderSearch() {
				// form에서 전송한 데이터 가져오기
				var start_r_date = $('#start_r_date').val();
				var end_r_date = $('#end_r_date').val();
				var order_seq = $('#order_seq').val();
				var od_status = $('#od_status').val();
				
				// 주문 순번이 입력되지 않았다면
				if (order_seq == "") {
					order_seq = 0;
				}
				
				$.ajax({
					url : "searchOrder.do",
					type : "POST",
					data : {"start_r_date" : start_r_date,
							"end_r_date" : end_r_date,
							"order_seq" : order_seq,
							"od_status" : od_status},
					dataType : "JSON",
					success : orderList,
					error : function(e){
						console.log(e);
					}
				});
			};
			
			// 조회 결과를 받아 화면에 보여주는 함수
			function orderList(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<tr>";
					html += "<td style='width:10%;'>" + data[i].order_seq + "</td>";	
					html += "<td style='width:20%;'>" + data[i].order_date + "</td>";	
					html += "<td style='width:20%;'>" + data[i].cus_id + "</td>";	
					html += "<td style='width:12%;'>" + data[i].all_cnt + "</td>";
					html += "<td style='width:12%;'><button type='button' onclick='orderDetailLoad(" + data[i].order_seq + ")' class='btn btn-secondary btn-sm' data-bs-toggle='modal' data-bs-target='#orderModal'>확인</button></td>"
					if (data[i].od_status === 0) {
						html += "<td style='width:12%;'>주문 접수</td>";
					}else {
						html += "<td style='width:12%;'>출고 완료</td>";
					}
					html += "<td style='width:10%;'><button type='button' onclick='' class='btn btn-secondary btn-sm'>X</button></td>"
					html += "</tr>";
				}
				// id가 "releaseList"인 <tbody>안의 html 교체
				$('#list').html(html);
			}
			
			
		
			/* 주문 정보 추가 기능          만들어야됨 아직 안만듬 */
			
			// form에서 전송한 데이터를 받아 DB에 삽입하는 함수
			/* function orderInsert() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("releaseInsert").serialize();
				
				// ajax를 통해 insertRelease.do라는 곳으로 입력한 데이터를 보내 insert하고
				// ReleaseList로 data 보냄
				$.ajax({
					url : "insertRelease.do",
					type : "POST",
					data : frmData,
					dataType : "JSON",
					success : releaseLoad,
					error : function(e){
						console.log(e);
					}
				});
			} */
			
			// 현재 DB에 저장된 데이터를 json 형태로 가져오는 함수?
			function orderLoad() {
				$.ajax({
					url : "restorder.do",
					method : "POST",
					dataType : "JSON",
					success : orderList,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			/* 주문 상세 창 */
			
			// 주문 상세 제품 목록 가져오기
			function orderDetailLoad(order_seq) {
				// order_seq 가져와서 보내야 함
				console.log(order_seq);
				
				$.ajax({
					url : "orderDetail.do",
					method : "POST",
					data : {'order_seq' : order_seq},
					dataType : "JSON",
					success : orderDetailList,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 조회 결과를 받아 화면에 보여주기
			function orderDetailList(data) {
				var html = "";
				/* 주문 번호 */
				html += "<div class='list-group-item list-group-item-action'>"
				html += "<div class ='row'>"
				html += "<div class='col col-lg-3'> <span class='point successNameChk'>주문 번호: </span></div><div class='col col-lg-9'><b> " + data[0].order_seq + " </b></div></div>"
				html += "</div>"
				/* 접수 날짜 */
				
				html += "<div class='list-group-item list-group-item-action'>"
				html += "<div class ='row'>"
				html += "<div class='col col-lg-3 col-sm-6'><span class='point successIdChk'>접수 날짜: </span></div><div class='col col-lg-9 col-sm-6'><b>" + data[0].order_date + "</b></div></div>"
				html += "</div>"
				/* 주문인 */
				html += "<div class='list-group-item list-group-item-action'>"
				html += "<div class ='row'>"
				html += "<div class='col col-lg-3 col-sm-6'><span class='point'>주문인: </span></div><div class='col col-lg-9 col-sm-6'><b>" + data[0].cus_id + "</b></div></div>"
				html += "</div>"
				/* 출고 상태 */
				html += "<div class='list-group-item list-group-item-action'>"
				if (data[0].od_status === 0) {
					html += "<div class='row'><div class='col col-lg-3 col-sm-6'><span class='point'>출고 상태: </span></div><div class='col col-lg-9 col-sm-6'><b> 주문 접수 </b> </div></div>"
				} else {
					html += "<div class='row'><div class='col col-lg-3 col-sm-6'><span class='point'>출고 상태: </span></div><div class='col col-lg-9 col-sm-6'><b> 출고 완료 </b> </div></div>"
				}
				html += "</div>"
				/* 제품 목록 */
                html += "<table class='table table-borderless table-striped table-hover'>"
                html += "<thead><tr class='table-secondary'>"
                html += "<th style='width:20%'>제품 코드</th>"
                html += "<th style='width:30%'>제품 명</th>"
                html += "<th style='width:20%'>주문 수량</th>"
                html += "<th style='width:2%'></th>"
                html += "</tr></thead></table>"
				
				html += "<form id='releaseCk' method='post'>"
				html += "<div style='overflow-y:scroll; width:100%; height:300px; text-align:center;'>";
				html += "<table class='table table-borderless table-hover'>"
				html += "<tbody>"
				for (var i = 0; i < data.length; i++) {
					html += "<tr>";
					html += "<td style='width:20%'>" + data[i].prod_code + "</td>";	
					html += "<td style='width:30%'>" + data[i].prod_name + "</td>";	
					html += "<td style='width:20%'>" + data[i].od_cnt + "</td>";		
					html += "</tr>";
				}
				html += "</tbody></table></div>"
				html += "<div class='modal-footer' style = 'display:flex; justify-content:space-between;'>"
				html += "<div class='buttonTwo'>"
				html += "<button type='button' onclick='findRack(" + data[0].order_seq + ")' class='btn btn-primary' style='margin-right:10px;'>제품 위치</button>"
				// 출고가 되었으면 출고 완료 버튼이, 출고가 안 되었으면 출고 준비 버튼이 보이도록
				if (data[0].od_status === 0){
					html += "<input type='hidden' name='order_seq' value=" + data[0].order_seq + ">"
					html += "<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#releaseCkModal'>출고 준비</button></div>"
				} else if (data[0].od_status > 0){
					html += "<button type='button' class='btn btn-secondary'>출고 완료</button></div>"					
				} else {
					console.log("error");
					console.log(data[0].od_status);
				}
				html += "<div class='buttonThree'>"
				html += "<button type='button' class='btn btn-secondary' data-bs-dismiss='modal'>닫기</button>"
				html += "</div></div></form>"
				
				// id가 "orderDetailList"인 <div>안의 html 교체
				$('#orderDetailList').html(html);
				
				hideModal(); // 모달을 숨기고
				orderLoad(); // 주문 목록 업데이트
			}
			
			// 출고 상태 update
			function rCompletion(){
				var frmData = $("#releaseCk").serialize();
				// $('releaseCkModal').modal('hide');
				$.ajax({
					url : "statusUpdate.do",
					method : "POST",
					data : frmData,
					success : orderDetailLoad,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// releaseCkModal 없애기
			function hideModal(){
				$('releaseCkModal').modal('hide');
			}
			
			// 이중 모달 띄우기
			$(document).on('hidden.bs.modal', function (event) {
				if ($('.modal:visible').length) {
					$('body').addClass('modal-open');
				}
			});
			
			// 출고 위치 알림
			function findRack(order_seq){
				$.ajax({
					url : "findRack.do",
					method : "POST",
					data : {"order_seq" : order_seq},
					dataType : "JSON",
					success : sendRack,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 출고 위치 데이터 보내기
			function sendRack(data) {
				console.log(data)
				$.ajax({
					url : "sendRack.do",
					method : "POST",
					data : data,
					success : console.log("위치 알림 성공"),
					error : function(e){
						console.log(e);
					}
				});
			}
		
		</script>
		
   		<!-- jquery 정의 -->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>


    </body>
</html>
