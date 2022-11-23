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
        <title>재고관리 Page</title>
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
                        <h1 class="mt-4">재고관리 👕</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                            
                                <table id="datatablesSimple" class="table-borderless table-striped">
                                    <thead>
                                        <tr class="">
                                        	<th>날짜</th>
                                            <th>제품 코드</th>
                                            <th>제품 명</th>
                                            <th>재고 수량</th>
                                            <th>기업코드</th>
                                            <th>제품 보관 장소</th>
                                    
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>날짜</th>
                                            <th>제품 코드</th>
                                            <th>제품 명</th>
                                            <th>재고 수량</th>
                                            <th>기업코드</th>
                                            <th>제품 보관 장소</th>
                                       
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                        	<td>2022-01-12</td>
                                            <td>A0132</td>
                                            <td>둥실둥실 기모 상하복 세트</td>
                                            <td>100</td>
                                            <td>GG123</td>
                                            <td>D-1</td>
                                            
                                 
                                        </tr>
                                        <tr>
                                       		<td>2022-01-12</td>
                                            <td>A0132</td>
                                            <td>루루티셔츠</td>
                                            <td>100</td>
                                            <td>GG124</td>
                                            <td>D-2</td>
                                
                                        </tr>
                                        <tr>
                                        	<td>2022-01-12</td>
                                            <td>A0132</td>
                                            <td>오늘은 즐거워 기모 치마 레깅스</td>
                                            <td>100</td>
                                            <td>GG125</td>
                                            <td>R-1</td>
                              
                                        </tr>
                                        <tr>
                                        	<td>2022-01-12</td>
                                            <td>A0132</td>
                                            <td>보들 컬러 밪</td>
                                            <td>100</td>
                                            <td>GG126</td>
                                            <td>R-3</td>
                           
                                        </tr>
                                 
                                    </tbody>
                                </table>
                                   <div class="button-group mb-4">
                        	<button class="custom-btn btn-13" data-bs-toggle="modal" data-bs-target="#exampleModal"> 물건등록</button>
                        	<button class="custom-btn btn-5"> 삭제 </button>
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
        
 	
 	 						<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> 물건 등록하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action = "">
        <div class="list-group">
        	<div class="list-group-item" style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "item_code">제품 코드</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class="form-control" name="item_code" />
        			</div>
        		</div>
        	</div>	
        		<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "item_name">제품 명</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class="form-control" name = "item_name"/>
        			</div>
        		</div>
        	</div>
        	
        	<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "item_stock">재고 수량</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type="text" class="form-control" name="item_stock"/>
        			</div>
        		</div>
        	</div>
        	
        	
        	       	<div class="list-group-item"style="line-height:41px;">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "item_manager" class="form-label">기업코드</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "item_manager" name="item_manager">
        			
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
        				<label for = "item_manager" class="form-label">제품 보관 장소</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "item_manager" name="item_manager">
        			
        					<option> D1 </option>
        					<option> D2  </option>
        					<option> R1 </option>
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

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
