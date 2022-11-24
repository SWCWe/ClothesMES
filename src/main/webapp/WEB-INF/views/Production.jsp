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
        <title>생산관리 Page</title>
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
        
        @media (max-width:576px) {
        	.production-search{
        		width:300px;
        		margin-left:35px;
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
                        <h1 class="mt-4">생산관리 💫</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                            
                            
                            	<div class="production-search mt-2 mb-4" style="display:flex; justify-content:center;">
                            		<form action = "" method = "get" style="display:grid; grid-template-columns : 30% 30% 30% 10%; grid-gap:10px; ">
                            			<div class="date-search-form">
                            				<input type = "date" class =" form-control" name = "date"/>
                            			</div>
                            	
                            			<div class="emp_search_form">
                            			<select class="form-select" name="emp_no">
                            				<option selected disabled> 담당자 </option>
                            				<option> 이철원 </option>
                            				<option> 박성진 </option>
                            			</select>
                            			</div>
                            			
                            			<div class="prod_code_search-form">
	                            			<select class="form-select" name="prod_code_search">
	                            				<option selected disabled> 제품별 </option>
	                            				<option> AD231 </option>
	                            				<option> AD2346 </option>
	                            			</select>
                            			</div>
                            			
                            			<div class="pruduction_form_button">
                            				<button type="submit" class="btn btn-light"> 🔍 </button>
                            			</div>
                            			
                            			
                            			
                            			
                            			
                            			
                            		</form>
                            	</div>
                                <table id="" class="table table-borderless table-striped table-hover" >
                                    <thead class="table-secondary" >
                                        <tr>
                                        	<th scope="col"><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></th>
                                            <th scope="col">생산 순번</th>
                                            <th scope="col">제품 코드</th>
                                            <th scope="col">생산 수량</th>
                                            <th scope="col">생산 일자</th>
                                            <th scope="col">제품 담당자</th>
                                    
                                        </tr>
                                    </thead>
           
                                    <tbody>
                                        <tr>
                                        	<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                            <td>1</td>
                                            <td>AD234</td>
                                            <td>100</td>
                                            <td>2022-11-23</td>
                                            <td>이철원</td>
                                            
                                 
                                        </tr>
                                        <tr>
                                        	<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                            <td>2</td>
                                            <td>AD343</td>
                                            <td>200</td>
                                            <td>2022-11-24</td>
                                            <td>이철원</td>
                                
                                        </tr>
                                        <tr>
                                            <td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                            <td>3</td>
                                            <td>AD231</td>
                                            <td>100</td>
                                            <td>2022-11-26</td>
                                            <td>이철원</td>
                              
                                        </tr>
                                        <tr>
                                         	<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                            <td>4</td>
                                            <td>AD2346</td>
                                            <td>300</td>
                                            <td>2022-11-28</td>
                                            <td>이철원</td>
                           
                                        </tr>
                                        
                                        <tr class="table-warning">
                                        	<form action ="" method = "get">
                                        		<td style="width:10%;"></td>
                                        		<td style="width:10%;"><input type="submit" class="btn btn-primary btn-sm" value="추가"> </td>
                                        		
                                        		<td style="width:20%">
                                        			<select class="custom_select" name = "prod_code">
                                        				<option selected disabled> 코드 선택 </option>
                                        				<option value=""> AD1234 </option>
                                        				<option value=""> AD1235 </option>
                                        			</select>
                                        		</td>
                                        		<td style="width:20%;">
                     
                                        				<input type="text" class="custom_select" placeholder = "수량입력" name="m_cnt"/>
                                       
                                        			
                                        		</td>
                                        		<td style="width:20%;">
                                        		<input type="date"/>
                                        		</td>
                                        		<td style="width:20%;" >
                                        			<select class="custom_select" name="emp_no">
                                        				<option selected disabled> 담당자 </option>
                                        				<option value=""> 이철원 </option>
                                        				<option value="emp_no"> 윤예지 </option>
                                        			</select>
                                        		</td>
                                        
                                        
                                        	
                                        	</form>
                                        </tr>
                                        
                                        
                                 
                                    </tbody>
                                </table>



										

								
								
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
        
 	


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
