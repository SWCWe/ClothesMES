<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="UTF-8">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>주문관리 Page</title>
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
                        <h1 class="mt-4">주문 관리 🧚‍♀️ </h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">

                            
                            <div class="card-body">
                            
                                <table id="datatablesSimple" class="table-borderless">
                                    <thead>
                                        <tr class="table-secondary">
                                        	<th>주문 순번</th>
                                            <th>주문 날짜</th>
                                            <th>주문 아이디</th>
                                          
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th>주문 순번</th>
                                            <th>주문 날짜</th>
                                            <th>주문 아이디</th>
                                       
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <!-- 여기 부터 바꿨음. -->
                                        <c:forEach items = "${list}" var="OrderVO" varStatus="i">
                                        	<tr>
                                        	<!--
                                        		<td><a href="order_view.do?order_seq=${OrderVO.order_seq}">${OrderVO.order_seq}</a></td>
                                        		<td><a href="order_view.do?order_seq=${OrderVO.order_seq}">${OrderVO.order_date}</a></td>
                                        		<td><a href="order_view.do?order_seq=${OrderVO.order_seq}">${OrderVO.cus_id}</a></td>
                                        	-->
                                        	
                                        		<td><a href="order_view.do?order_seq=${OrderVO.order_seq}">${OrderVO.order_seq}</a></td>
                                        		<td>${OrderVO.order_date}</td>
                                        		<td>${OrderVO.cus_id}</td>
                                        	
                                        	</tr>
                                        </c:forEach>
                                      	
                                 		<!-- 여기까지 바꿨음. -->
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
