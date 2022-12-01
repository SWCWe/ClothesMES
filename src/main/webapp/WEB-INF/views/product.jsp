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
        <title>제품 목록 Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/button.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
         <!-- jquery 정의 -->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        
    </head>
    <body class="sb-nav-fixed">
 <%@ include file="nav-top.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                          <%@ include file = "./nav.jsp" %>
            </div>
            <div id="layoutSidenav_content" class="mt-2">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">제품 목록 👕</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                
                               
                            </div>
                            <div class="card-body">
                               	
                               	<!-- 검색 폼  -->
                               	
                               	<div class="production-search product mt-2 mb-4">
                               	<form id="ProductSearch" method = "post">
                               	
                            
                            		
                            				<div class="date-search-form">
	                            				<input id="start_r_date" type = "date" class =" form-control" name = "start_r_date">
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="end_r_date" type = "date" class =" form-control" name = "end_r_date">
	                            			</div>
                            	
                            			<div class="emp_search_form">
                            			<select class="form-select" name="prod_code" >
                            				<option selected disabled> 제품코드 </option>
                            				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
                            					<option>${prod.prod_code}</option>
                            				</c:forEach>
                            			</select>
                            			</div>
                            			
                            			<div class="prod_code_search-form">
	                            			<input type ="text" id ="search"class="form-control" placeholder = "제품이름"/>
                            			</div>
                            			
                            			<div class="prod_code_search-form">
	                            			<select class="form-select" name="prod_rack" id="rack" style="width: 117px;">
                            				<option selected disabled> 보관장소 </option>
                            				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
                            					<option>${prod.prod_rack}</option>
                            				</c:forEach>
                            			</select>
                            			</div>
                            			
                            			<div class="pruduction_form_button">
                            				<button type="button" onclick="ProductSearch()" class="btn btn-light"> 🔍 </button>
                            				<button type="reset" onclick="productLoad()" class="btn btn-light">
                            				<i class="fa-solid fa-arrow-rotate-left"></i>
                            				  </button>
                            			</div>
                            			
                            			
                            			
                            			
                            			
                            			
                            		</form>
                            	</div>
                            
                            
                            <!-- TABLE HEADER -->
                                
                                
                                <table id="" class="table table-borderless table-striped table-hover" >
                                   <thead>
                                        <tr class="">
                                        	
                                            <th style="width:20%;">제품 코드</th>
                                            <th style="width:20%;">제품 명</th>
                                            <th style="width:20%;">재고 수량</th>
                                            <th style="width:20%;">제조 일자</th>
                                            <th style="width:10%;">보관 장소</th>
                                            <th style="width:10%;">삭제</th>
                                    		<th style="width:1%"></th>
                                        </tr>
                                    </thead>
           						</table>
           						
           						
           						
           						<form id="deleteProduct" method="post">
           						
           					     <div style="overflow-y:scroll; width:100%; height:300px; text-align:center;">
           						
           						<!--  table body  -->
           						<table class="table table-borderless table-striped table-hover">
           						
                                    <tbody id="list">
                        				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
	                                        <tr>
	                                            <td style="width:20%;">${prod.prod_code}</td>
	                                            <td style="width:20%;">${prod.prod_name}</td>
	                                            <td style="width:20%;">${prod.prod_cnt}</td>
	                                            <td style="width:20%;">${prod.prod_m_date}</td>
	                                            <td style="width:10%;">${prod.prod_rack}</td>
	                                            <td style="width:10%;"><button type="button" onclick="deleteProduct('${prod.prod_code}')" class="btn btn-secondary btn-sm t-button">X</button></td>
	                                        </tr>
                                    	</c:forEach>
                        			</tbody>
                        			
                       			</table>
                    			  </div>
                        			
                        				  </form> 
                        			
                        			  
                        		
                        			  
                        			  
                        			  <form id ="ProductInsert" method = "post">
                        			<table  class="table table-borderless table-striped table-hover" >
                        			
                        				<!--  추가 FORM  -->
                                        
                                     
                                        
                                        <tr class="table-warning">
                                        	
                                        		
                                        		<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "제품코드" name="prod_code"/>
                                        		</td>
                                        		
                                        			<td style="width:20%;">
                                        				<input type="text" class="custom_select" placeholder = "제품명" name="prod_name"/>
                                        		</td>
                                        		
                                        		
                                        		<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "수량" name="prod_cnt"/>
                                       
                                        			
                                        		</td>
                                        		<td style="width:20%;">
                                        		<input type="date" name = "prod_m_date"/>
                                        		</td>
                                        		
                                        		
                                        		<td style="width:10%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "보관장소" name="prod_rack"/>
                                       
                                        			
                                        		</td>
                                        		
                                        		<td style="width:10%;"><input onclick="ProductInsert()" type="button" class="btn btn-success btn-sm" value="추가"> </td>
                                        
                                        		<td style="width:1%"> </td>
                                        
                                        	
                                        	
                                        </tr>
                                 
                                </table>
                              </form>
                             
                              
                              <script type="text/javascript">
                              var html = $("#list").html();
                              
                           // form에서 전송한 데이터를 받아 검색 내용을 조회하는 함수
                  			function ProductSearch() {
                  				// form에서 전송한 데이터를 json 형태로 저장
                  				var frmData = $("#ProductSearch").serialize();

                  				// ajax를 통해 searchRelease.do라는 곳으로 입력한 데이터를 보내 select하고
                  				// releaseList로 data 보냄
                  				$.ajax({
                  					url : "ProductRelease.do",
                  					type : "POST",
                  					data : frmData,
                  					dataType : "JSON",
                  					success : ProductList,
                  					error : function(e){
                  						console.log(e);
                  					}
                  				});
                  			};
                              
                  		// 조회 결과를 받아 화면에 보여주는 함수
                			function ProductList(data) {
                				var html = "";
                				for (var i = 0; i < data.length; i++) {
                					html += "<tr>";
                					html += "";
                					html += "<td>" + data[i].prod_code + "</td>";	
                					html += "<td>" + data[i].prod_name + "</td>";	
                					html += "<td>" + data[i].prod_cnt + "</td>";	
                					html += "<td>" + data[i].prod_m_date + "</td>";	
                					html += "<td>" + data[i].prod_rack + "</td>";	
                					html += "<td><button type='button' class='btn btn-danger btn-sm'>X</button></td>";
                					
                					html += "</tr>";
                				}
                				// id가 "releaseList"인 <tbody>안의 html 교체
                				$('#list').html(html);
                			}
                  			
                  			
                  			
                              
                              
                              
                  // 제품이름에서 자동완성기능 구현  시작점
				
                
				$('#search').on("keyup", function(key){
					var search = $("#search").val();
					
					if(search.length >0){
						$.ajax({
							url : "PsearchList.do",
							type : "POST",
							data : {"search" : search} ,
							datatype: "JSON" ,
							success : ProductList ,
							error : function(e){
								console.log(e);
							}
							
						});
					}else{
						
						 $("#list").html(html);
					}
					
					});
			
				/* 제품 정보 추가 기능 */
				// form에서 전송한 데이터를 받아 DB에 삽입하는 함수
				function ProductInsert() {
					// form에서 전송한 데이터를 json 형태로 저장
					var frmData = $("#ProductInsert").serialize();
					
					// ajax를 통해 insertRelease.do라는 곳으로 입력한 데이터를 보내 insert하고
					// ReleaseList로 data 보냄
					$.ajax({
						url : "insertProduct.do",
						type : "POST",
						data : frmData,
						success : productLoad,
						error : function(e){
							console.log(e);
						}
					});
				
				}
				
			
			// 자동완성 기능 종료시점
			
			// 삭제 기능
			function deleteProduct(prod_code) {
				
				$.ajax({
					url : "deleteProduct.do",
					type : "POST",
					data : {"prod_code" : prod_code},
					success : productLoad,
					error : function(e){
						console.log(e);
					}
				});
				
			}
			// 현재 DB에 저장된 데이터를 json 형태로 가져오는 함수?
			function productLoad() {
				$.ajax({
					url : "restProduct.do",
					success : ProductList,
					error : function(e){
						console.log(e);
					}
				});
			
			}
			
			
			</script>


								
								
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
        confirm
 	


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
