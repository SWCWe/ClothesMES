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
        <title>일정관리</title>
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
        
        body{
        	background-color:puple;
        }
     
     
     	.card{
     	box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
     	}
     	
		.card-day {
			display:flex;
			align-items:center;
			font-size : 23px;
			
		}
		
		.add-button {
			display: flex;
			justify-content : center;
		}
		
		.add-button .btn{
			width:200px;
			font-size:30px;
			box-shadow: rgba(17, 12, 46, 0.15) 0px 48px 100px 0px;
		}
     	
        </style>
    </head>
    <body class="sb-nav-fixed">
		<%@ include file= "nav-top.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">

	            <%@ include file = "./nav.jsp" %>
            </div>
            <div id="layoutSidenav_content" class="mt-2">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">일정관리 🗓</h1>
                        
                        <div class="card mb-4">
               
                        </div>
 
 
 						<div class="container mt-5">
 						
 						
 						<div class="row" >
 							
 							
 							<div class="col-sm-3 offset-sm-1" >
 							 								<div class="card">
 								
 									<div class="card-header card-secondary" style="display : flex; justify-content:space-between">
 										<div class="card-day">
 											2022-01-03
 										</div>
 										<div class="card-button">
 											<button class = "btn btn-danger" type="button">X</button>
 										</div>
 									
 									</div>
 									
 							
 										<div class="list-group">
 											<div class="list-group-item" ">
 												<div class="row">
 													<div class="col-sm-6">
 														<div class="list-group-item list-group-item-action" style="margin-top:20px;">
 															<div class="list-grid-top">
 																목표수량
 																<hr/>
 															</div>
 															<div class="list-grid-top">
 																<h1 style="font-size:30px;">330개</h1>
 															</div>
 														</div>
 													</div>
 								
 													<div class="col-sm-6">
 															<div class="list-group-item list-group-item-action" style="margin-top:20px;">
 															<div class="list-grid-top">
 																메모
 																<hr/>
 															</div>
 															<div class="list-grid-bottom" style="cursor:pointer;">
 																<div class="description">
 																lorem ipsum dollor....
 																</div>
 										
 																
 															</div>
 															
 															
 															
 												
 															
 												



 														</div>
 													</div>
 													<div class="card-active-button mt-4" style="display:flex; justify-content:center;">
 													<button class="btn btn-secondary mb-2" type="button" style= " width:80%; "> 시작하기</button>
 													</div>
 													
 												</div>
 											</div>
 										</div>
 								
 								
 								</div>
 							</div>
 						
 							
 							
 							<div class="col-sm-3 offset-sm-1">
 							 								<div class="card">
 								
 									<div class="card-header card-secondary" style="display : flex; justify-content:space-between">
 										<div class="card-day" >
 											2022-01-03
 										</div>
 										<div class="card-button">
 											<button class = "btn btn-danger" type="button">X</button>
 										</div>
 									
 									</div>
 									
 							
 										<div class="list-group">
 											<div class="list-group-item" ">
 												<div class="row">
 													<div class="col-sm-6">
 														<div class="list-group-item list-group-item-action" style="margin-top:20px;">
 															<div class="list-grid-top">
 																목표수량
 																<hr/>
 															</div>
 															<div class="list-grid-top">
 																<h1 style="font-size:30px;">330개</h1>
 															</div>
 														</div>
 													</div>
 																<div class="col-sm-6">
 															<div class="list-group-item list-group-item-action" style="margin-top:20px;">
 															<div class="list-grid-top">
 																메모
 																<hr/>
 															</div>
 															<div class="list-grid-bottom" style="cursor:pointer;">
 																<div class="description">
 																lorem ipsum dollor....
 																</div>
 														
 																
 															</div>
 															
 															
 															
 												
 															
 												



 														</div>
 													</div>
 													
 													
 													<div class="card-active-button mt-4" style="display:flex; justify-content:center;">
 													<button class="btn btn-secondary mb-2" type="button" style= " width:80%; "> 시작하기</button>
 													</div>
 													
 												</div>
 											</div>
 										</div>
 								
 								
 								</div>
 							</div>
 						</div>
 						
 						</div>
 						




 	<session class = "add-schedule">
 		<div class="add-button mt-5">
 			<button class="btn btn-success mb-5" data-bs-toggle="modal" data-bs-target="#addModal"> 추가하기</button>
 		</div>
 	</session>
 	
 	
 	 						<!-- 추가하기 Modal -->
 	 						<!--  modal head -->
 	 				<div class = "modal fade" id = "addModal" tabindex = '-1' aria-labelledby = "addModalLabel" aria-hidden = "true">
 	 					<div class = "modal-dialog">
 	 						<div class="modal-content">
 	 							<div class="modal-header">
 	 							<!--  Tabs  -->
 	 							<ul class="nav nav-tabs" role = "tablist">
 	 								<li class="nav-item" role = "presentation">
 	 									<a class = "nav-link" data-bs-toggle = "tab" href = "#home" aria-selected = "false" role = "tab" tabindex = "-1"> 생산추가 </a>
 	 									
 	 								</li>
 	 								
 	 
 	 								
 	 								<li class="nav-item" role = "presentation">
 	 									<a class = "nav-link active" data-bs-toggle="tab" href = "#dayadd" aria-selected = "true" role = "tab" > 일정추가 </a>
 	 									
 	 								</li>
 	 								
 	 								
 	 								
 	 							</ul>
 	 							
 	 							
 	 							</div>
 	 							
 	 						
 	 							<!--  모달 content -->
 	 							<div id = "myTabContent" class ="tab-content">
 	 							<!--  모달 content 1  -->
 	 								<div class = "tab-pane fade" id = "home" role = "tabpanel">
 	 <form action = "">
        <div class="list-group">
        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "startDay">생산날짜</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "date" class="form-control" name="startDay"/>
        			</div>
        		</div>
        	</div>
        	
        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "finalDay">목표날짜</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "date" class="form-control" name="finalDay"/>
        			</div>
        		</div>
        	</div>
        	
        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "finalDay">목표시간</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "time" class="form-control" name="finalDay"/>
        			</div>
        		</div>
        	</div>
        	
        	
        	        	
        	        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "finalDay">생산자명</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "user-dep" name="user-dep">
        			
        					<option> 윤예지 </option>
        					<option> 이철원  </option>
        					<option> 박성진 </option>
        				</select>
        			</div>
        		</div>
        	</div>
        	
        	
        	        	        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "finalDay">관리자명</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "user-dep" name="user-dep">
        			
        					<option> 관리자1 </option>
        					<option> 관리자2  </option>
        					<option> 관리자3 </option>
        				</select>
        			</div>
        		</div>
        	</div>
        	
        	        	        	        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "finalDay">제품이름</label>
        			</div>
        			<div class = "col-sm-8">
        				<select class="form-select" id = "user-dep" name="user-dep">
        			
        					<option> 둥실둥실 기모 상하복 세트 </option>
        					<option> 루루 티셔츠  </option>
        					<option> 오늘도즐거워 기모 치마레깅스 </option>
        				</select>
        			</div>
        		</div>
        	</div>
        	
        	
        	
    
        	
        	
        		<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "addDayInput">목표수량</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class="form-control" name = "chellenge"/>
        			</div>
        		</div>
        	</div>
        	
        	        		<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "addDayInput">내용</label>
        			</div>
        			<div class = "col-sm-8">
        				<textarea class="form-control" name = "addDes"></textarea>
        			</div>
        		</div>
        	</div>
        	
        	
        </div>
        
        
  
        
        
        </form>

    
 	 								</div>
 	 								
 	 								<!--  모달 content 2  -->

 	 								
 	 								
 	 		
<div class="tab-pane fade" id="dayadd" role = "tabpanel">
  <form action = "">
        <div class="list-group">
        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "addDayInput">시작 일자</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type="datetime-local" class = "form-control"name="starttime">
        			</div>
        		</div>
        	</div>
        	
        	
        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "addDayInput">종료 일자 </label>
        			</div>
        			<div class = "col-sm-8">
        				<input type="datetime-local" class = "form-control"name="starttime">
        			</div>
        		</div>
        	</div>
        	
        	
        	        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "addDayInput">일정 내용</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class="form-control">
        			</div>
        		</div>
        	</div>
        	
        	
        	        	        	<div class="list-group-item">
        		<div class="row">
        			<div class="col-sm-4">
        				<label for = "addDayInput">일정 장소</label>
        			</div>
        			<div class = "col-sm-8">
        				<input type = "text" class = "form-control">
        			</div>
        		</div>
        	</div>

        	

        	
        	
        </div>
        
        
  
        
        
        </form>
  </div>
 	 								
 	 								
 	 								
 	 								<!-- 모달 푸터 -->
 	 								              <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
       
      </div>
 	 								
 	 								
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
