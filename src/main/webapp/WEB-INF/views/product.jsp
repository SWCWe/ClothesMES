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
        <style>
        tr{
       
        	text-align : center;
        	font-size:16px;
        }
        
        a.dataTable-sorter{
        	text-align:center;
        }
        
        .pruduction_form_button {
        	display:flex; 
        }
        
        .pruduction_form_button .btn:nth-child(1){
        	margin-right:10px;
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
       
       .production-search{

       	display:flex;
       	justify-content:center;
       }
       
       form {
       display:grid; grid-template-columns : 20% 20% 20% 20% 20%; grid-gap:10px;
       }
       
     

	@media (max-width:576px) {
		.production-search {
			display:block;
		}
 		.production-searchform {
       display:grid; grid-template-columns : 100%; grid-gap:10px;
       }
        .pruduction_form_button{
        	display:flex;
        	justify-content:end;

        }	
        
        .pruduction_form_button .btn{
        	width:100%;
        }
        
    
        }
        
        
        @media (max-width:1200px) {
		.production-search {
			display:block;
		}
 		.production-search form {
       display:grid; grid-template-columns : 100%; grid-gap:10px;
       }
        .pruduction_form_button{
        	display:flex;
        	justify-content:end;

        }	
        
        .pruduction_form_button .btn{
        	width:100%;
        }
        
            table tr {
        	font-size:12px;
        }
        	div.add table tr input::placeholder{
        		font-size:10px;
        	}
       
        	
        	 table input[type=text], table input[type=date], .custom_select{
     	font-size:10px;
     }
        	
  
        }
        
        
    
        </style>
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
                            	<div class="production-search mt-2 mb-4">
                            		<form action = "" method = "get" class="what">
                            			<div class="date-search-form">
                            				<input type = "date" class =" form-control" name = "date"/>
                            			</div>
                            	
                            			<div class="emp_search_form">
                            			<select class="form-select" name="emp_no">
                            				<option selected disabled> 제품코드 </option>
                            				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
                            					<option>${prod.prod_code}</option>
                            				</c:forEach>
                            			</select>
                            			</div>
                            			
                            			<div class="prod_code_search-form">
	                            			<input type ="text" class="form-control" placeholder = "제품이름"/>
                            			</div>
                            			
                            			<div class="prod_code_search-form">
	                            			<select class="form-select" name="emp_no">
                            				<option selected disabled> 보관장소 </option>
                            				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
                            					<option>${prod.prod_rack}</option>
                            				</c:forEach>
                            			</select>
                            			</div>
                            			
                            			<div class="pruduction_form_button">
                            				<button type="submit" class="btn btn-light"> 🔍 </button>
                            				<button type="reset" class="btn btn-light">
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
           						<div style = "overflow-y : scroll; width:100%; height:300px;">
           						
           						<!--  table body  -->
           						<table class="table table-borderless table-striped table-hover">
           						
                                    <tbody>
                		
                        
                        				<c:forEach items = "${list}" var = "prod" varStatus = 'i'>
                                    	
	                                        <tr>
	                                        	
	                                            <td style="width:20%;">${prod.prod_code}</td>
	                                            <td style="width:20%;">${prod.prod_name}</td>
	                                            <td style="width:20%;">${prod.prod_cnt}</td>
	                                            <td style="width:20%;">${prod.prod_m_date}</td>
	                                            <td style="width:10%;">${prod.prod_rack}</td>
	                                            <td style="width:10%;"><button type="button" class="btn btn-secondary btn-sm" onclick="location.href='prodDel.do'">X</button></td>
	                                 			<td style="width:1%"></td>
	                                        </tr>
                                    	</c:forEach>
                        				
                        			</tbody>
                        			</table>
                        			  </div>
                        			<div class="add">
                        			<table  class="table table-borderless table-striped table-hover" >
                        				<!--  추가 FORM  -->
                                        
                                        <tr class="table-warning">
                                        	<form action ="prodInsert.do" method = "get">
                                        		
                                        		<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "제품코드" name="prod_code"/>
                                       
                                        			
                                        		</td>
                                        			<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "제품명" name="prod_name"/>
                                       
                                        			
                                        		</td>
                                        		
                                        		
                                        		<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "수량입력" name="prod_cnt"/>
                                       
                                        			
                                        		</td>
                                        		<td style="width:20%;">
                                        		<input type="date" name = "prod_m_date"/>
                                        		</td>
                                        		
                                        		
                                        		<td style="width:10%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "보관장소" name="prod_rack"/>
                                       
                                        			
                                        		</td>
                                        		
                                        		<td style="width:10%;"><input type="submit" class="btn btn-success btn-sm" value="추가"> </td>
                                        
                                        		<td style="width:1%"> </td>
                                        
                                        	
                                        	</form>
                                        </tr>
                                        
                                        
                                 
                                    
                                </table>
                              </div>


										

								
								
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
