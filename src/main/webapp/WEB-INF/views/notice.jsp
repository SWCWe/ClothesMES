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
                        <h1 class="mt-4">공지사항 ✔</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        
                     
                   
                 			<div class="list-gorup">
                 				
									<table class="table table-borderless table-hover"  frame=void>
										<tr class="table-secondary">
											<th><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></th>
											<th scope = "col" style = "width:10%;" >글번호</th>
											<th scope = "col" style = "width:60%">제목</th>
											<th scope = "col" style = "width:20%">작성자</th>
											<th scope = "col" style = "width:10%">조회수</th>
										
										</tr>
										
										<tr>
											<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
											<td>1</td>
											<td onclick="location.href='notice_view.do'" style="cursor:pointer;">안녕하세요</td>
											<td>홍길동</td>
											<td>1</td>
										</tr>
										<tr>
											<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
											<td>2</td>
											<td onclick="location.href='notice_view.do'" style="cursor:pointer;">건강 조심하세요</td>
											<td>홍길동</td>
											<td>1</td>
										</tr>
										<tr>
											<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
											<td>3</td>
											<td onclick="location.href='notice_view.do'" style="cursor:pointer;">만나서 반갑습니다!</td>
											<td>홍길동</td>
											<td>1</td>
										</tr>
									</table>
								
                 			</div>
                 			   <div class="button-group mb-4">
                        	<button onclick="location.href='notice_write.do'"class="custom-btn btn-13"> 글쓰기</button>
                        	<button class="custom-btn btn-5"> 삭제 </button>
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
