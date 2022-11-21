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
        <title>공자사항 Page</title>
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
                        <h1 class="mt-4">공지사항 등록 ✔</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        
                     
                   
      
       			<form action ="" method = "get">
       			<div class="list-group" style="width : 80%; margin:0 auto;">
       				<div class="list-group-item list-group-item-action disabled">
       					<div class="row">
       						<div class="col-sm-2">
       							<label for = "info_title"> 제목 </label>
       						</div>
       						<div class="col-sm-10">
       							<input type= "text" class="form-control" name="info_title" value = "제목입니다.">
       						</div>
       							
       						
       					</div>
       				</div>
       		
       				<div class="list-group-item list-group-item-action disabled">
       					<div class="row">
       						<div class="col-sm-2">
       							<label for = "info_des" > 내용 </label>
       						</div>
       						<div class="col-sm-10">
       							<textarea class="form-control" name = "info-des" cols ="40" rows="10"> 내용입니다.</textarea>
       						</div>
       							
       						
       					</div>
       				</div>
       				
       				       				<div class="list-group-item list-group-item-action disabled">
       					<div class="row">
       						<div class="col-sm-2">
       							<label for = "info_des"> 작성자 </label>
       						</div>
       						<div class="col-sm-10">
       							<input type = "text" class="form-control" value="홍길동">
       						</div>
       							
       						
       					</div>
       				</div>
       				
       				
       			</div>
       			
       		

                 			   <div class="button-group mt-5 mb-4" style="width:80%; margin:0 auto;">
                        	<button type="button" class="custom-btn btn-13"> 글쓰기</button>
                        	<button type="reset" class="custom-btn btn-5"> 리셋 </button>
                        </div>
                        </form>
                      
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
