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
        <title>회원관리 Page</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="${path}/resources/css/styles.css" rel="stylesheet" />
        <link href="${path}/resources/css/button.css" rel="stylesheet" >
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <style>
        tr{
       
        	text-align : center;
        	font-size:16px;
        }
        
        a.dataTable-sorter{
        	text-align:center;
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
                        <h1 class="mt-4">회원관리 📝</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">

                            
                            <div class="card-body">
                            
                                <table id="datatablesSimple" class="table-borderless">
                                    <thead>
                                        <tr class="table-secondary">
                                        	<th><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></th>
                                            <th>사번</th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                  
                                    
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></th>
                                            <th>사번</th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                       
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                        	<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                            <td>1</td>
                                            <td>👦이철원</td>
                                            <td>생산</td>
                                            <td>사원</td>
                                   
                                 
                                        </tr>
                                        <tr>
                                    	<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                            <td>2</td>
                                            <td>👸윤예지</td>
                                            <td>생산</td>
                                            <td>사원</td>
                                
                                        </tr>
                                        <tr>
                                        	<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                            <td>3</td>
                                            <td>👦박성진</td>
                                            <td>생산</td>
                                            <td>사원</td>
                              
                                        </tr>
                                      
                                 
                                    </tbody>
                                </table>
      
                            </div>
                        </div>
                    </div>
                    
                     	 						<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> 회원등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action = "">
        <div class="list-group">
        	<div class="list-group-item" style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "user_code">사번</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class="form-control" name="user_code" />
        			</div>
        		</div>
        	</div>
        		<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "user_name">이름</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class="form-control" name = "user_name"/>
        			</div>
        		</div>
        	</div>
        	
        	<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "user-dep">부서</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "user-dep" name="user-dep">
        			
        					<option> 생산 </option>
        					<option> 품질  </option>
        					<option> 인사 </option>
        				</select>
        			</div>
        		</div>
        	</div>
        	
        	
        	       	<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "user_pos" class="form-label">직책</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "user_pos" name="user_pos">
        			
        					<option> 사원 </option>
        					<option> 팀장  </option>
        					<option> 사장 </option>
        				</select>
        			</div>
        		</div>
        	</div>
        	
        	
        </div>
        
        
  
        
        
        </form>
    
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" data-bs-dismiss="modal">물건등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
