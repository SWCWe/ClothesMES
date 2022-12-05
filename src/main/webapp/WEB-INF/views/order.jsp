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
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

        <!-- jquery 정의 -->
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
                            				<button type="reset" onclick="orderLoad()" class="btn btn-light">
                            				<i class="fa-solid fa-arrow-rotate-left"></i>
                            				  </button>
                            				
                            			</div>
                            			
                            				<div class="date-search-form">
	                            				<input id="start_r_date" type = "date" class =" form-control" name = "start_r_date">
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="end_r_date" type = "date" class =" form-control" name = "end_r_date">
	                            			</div>

                           

                            	
                            			<div class="emp_search_form">
                            			<select class="form-select" name="order_seq" >
                            				<option selected disabled> 주문번호 </option>
                            				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
                            					<option>${prod.order_seq}</option>
                            				</c:forEach>
                            			</select>
                            			</div>
                            			
                            			<div class="prod_code_search-form">
	                            			<select class="form-select" name="prod_code"style="">
                            				<option selected disabled> 제품코드 </option>
                            				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
                            					<option>${prod.prod_code}</option>
                            				</c:forEach>
                            			</select>
                            			</div>
                            			
                            			
                            			<div class="prod_code_search-form">
	                            			<input type ="text" name="cus_id" id ="idSearch"class="form-control" placeholder = "주문아이디"/>
                            			</div>
                            			
                            			
                            			
                            			<div class="pruduction_form_button">
                            				<button type="button" onclick="orderSearch()" class="btn btn-light"> 🔍 </button>
                            				
                            			</div>
                            			
                            			
                            			
                            			
                            			
                            			
                            		</form>
                            	</div>
                            
                            
                            
                            
                               
                            <!-- TABLE HEADER -->
                                
                                
                                <table id="" class="table table-borderless table-striped table-hover" >
                                  <thead>
                                        <tr class="table-secondary">
                                        	
                                        	<th style="width:10%">주문 번호</th>
                                            <th  style="width:20%">주문 날짜</th>
                                            <th style="width:20%">주문 아이디</th>
                                            <th style="width:20%">제품 코드</th>
                                            <th style="width:20%">제품 수량</th>
                                            <th style="width:10%"> 삭제 </th>
                                            <th style="width:1%"></th>

                                            
                                          
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
	                                            <td style="width:20%;">${prod.prod_code}</td>
	                                            <td style="width:20%;">${prod.od_cnt}</td>
	                                            <td style="width:10%;"><button type="button" onclick="" class="btn btn-secondary btn-sm">X</button></td>
	                                 			
	                                        </tr>
                                    	</c:forEach>
                        				
                        			</tbody>
                        			</table>
                        			  </div>
                        			
                        				  </form> 
      
      
    								   <form id ="orderInsert" method = "post">
                        			<table  class="table table-borderless table-striped table-hover" >
                        			
                        				<!--  추가 FORM  -->
                                        
                                     
                                        
                                        <tr class="table-warning">
                                        	
                                        		
                                        		<td style="width:10%;">
                     
                                        			
                                       
                                        			
                                        		</td>
                                        			<td style="width:20%;">
                     
                                        				<input type="date" name = "prod_m_date"/>
                                       
                                        			
                                        		</td>
                                        		
                                        		
                                        		<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "주문아이디" name="prod_cnt"/>
                                       
                                        			
                                        		</td>
                                        		<td style="width:20%;">
                                        			<input type="text" class="custom_select" placeholder = "제품 코드" name="prod_cnt"/>
                                        		</td>
                                        		
                                        		
                                        		<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "제품 수량" name="prod_rack"/>
                                       
                                        			
                                        		</td>
                                        		
                                        		<td style="width:10%;"><input onclick="orderInsert()" type="button" class="btn btn-success btn-sm" value="추가"> </td>
                                        
                                        		<td style="width:1%"> </td>
                                        
                                        	
                                        	
                                        </tr>
                                 
                                </table>
                              </form>
      
      
      
      
      
      
      
      <!--  검색기능 추가하기  -->
      
      	

           					
           					


										

								
								
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
<div class="modal fade" id="orderModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> 주문 등록하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action = "">
        <div class="list-group">
        	<div class="list-group-item" style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "item_code">주문 날짜</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "date" class="form-control" name="order_date" />
        			</div>
        		</div>
        	</div>	
        		<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "item_name">주문 아이디</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class="form-control" name = "cus_id"/>
        			</div>
        		</div>
        	</div>
        	
        	<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "prod_code">제품 코드</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "item_manager" name="prod_code">
        			
        					<option> 윤예지 </option>
        					<option> 이철원  </option>
        					<option> 박성진 </option>
        				</select>
        			</div>
        		</div>
        	</div>
        	
        	
        	       	<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "item_manager" class="form-label">주문 수량</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type="text" class="form-control" name = "od_cnt">
        			</div>
        		</div>
        	</div>
        	
  
        	
        	
        </div>
        
        
  
        
        
        </form>
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       
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
			function orderSearch() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#orderSearch").serialize();

				// ajax를 통해 searchRelease.do라는 곳으로 입력한 데이터를 보내 select하고
				// releaseList로 data 보냄
				$.ajax({
					url : "searchOrder.do",
					type : "POST",
					data : frmData,
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
					html += "<td><input class='form-check-input' type = 'checkbox' value id = 'flex-CheckChecked'></td>";
					html += "<td>" + data[i].od_seq + "</td>";	
					html += "<td>" + data[i].order_seq + "</td>";	
					html += "<td>" + data[i].order_date + "</td>";	
					html += "<td>" + data[i].cus_id + "</td>";	
					html += "<td>" + data[i].prod_code + "</td>";	
					html += "<td>" + data[i].od_cnt + "</td>";	
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
		
		</script>
      


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
