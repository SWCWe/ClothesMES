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
        <title>주문상세 Page</title>
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
                        <h1 class="mt-4">주문 상세 ✔</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        
                     
                   
      
       			<form action ="" method = "get">
       			<div class="list-group" style="width : 80%; margin:0 auto;">
       				<div class="list-group-item list-group-item-action disabled">
       					<div class="row">
       						<div class="col-sm-2">
       							<label for = "info_title"> 주문 순번 </label>
       						</div>
       						<div class="col-sm-10">
       							<input type= "text" class="form-control" value = "1.">
       						</div>
       							
       						
       					</div>
       				</div>
       		
       				<div class="list-group-item list-group-item-action disabled">
       					<div class="row">
       						<div class="col-sm-2">
       							<label for = "제품 코드" > 제품코드 </label>
       						</div>
       						<div class="col-sm-10">
       							<input type= "text" class="form-control" value = "ADD1">
       						</div>
       							
       						
       					</div>
       				</div>
       				
       				       				<div class="list-group-item list-group-item-action disabled">
       					<div class="row">
       						<div class="col-sm-2">
       							<label for = "제품 이름" > 제품이름 </label>
       						</div>
       						<div class="col-sm-10">
       							<input type= "text" class="form-control" value = "루루티셔츠">
       						</div>
       							
       						
       					</div>
       				</div>
       				
       				       				<div class="list-group-item list-group-item-action disabled">
       					<div class="row">
       						<div class="col-sm-2">
       							<label for = "info_des"> 주문수량 </label>
       						</div>
       						<div class="col-sm-10">
       							<input type= "text" class="form-control" value = "100">
       						</div>
       							
       						
       					</div>
       				</div>
       				
       				
       			</div>
       			
       		

                 			
                        </form>
                           <div class="button-group mt-5 mb-4" style="width:80%; margin:0 auto;">
                        	<button class="custom-btn btn-5" onclick="location.href='order.do'"> 뒤로가기 </button>
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
        <script type="text/javascript">
        	function goBack() {
        		window.history.back();
        	}
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
