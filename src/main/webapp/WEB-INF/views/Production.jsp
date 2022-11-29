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
        	.add_production {
        		margin-left:-50px;
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
                                                                           철원이의 생산관리
                            </div>
                            <div class="card-body">
                            
                                <table id="" class="table table-borderless table-striped table-hover" >
                                    <thead class="table-secondary" >
                                        <tr>
                                            <th scope="col">제품 코드</th>
                                            <th scope="col">제품명</th>
                                            <th scope="col">생산 수량</th>
                                            <th scope="col">생산 일자</th>
                                            <th scope="col">제품 보관 장소</th>
                                    		<th scope="col">삭제</th>
                                        </tr>
                                    </thead>
           
                                    <tbody>
         								<!-- list에서 하나씩 꺼내서 변수 product에 담아라 라는 뜻  -->
                                        <c:forEach items = "${list}" var="product" varStatus="i">
											<tr>
												<td>${product.prod_code}</td>
												<td>${product.prod_name}</td>
												<td>${product.prod_cnt}</td>
												<td>${product.prod_m_date}</td>
												<td>${product.prod_rack}</td>
												<td><button type = "button" class ="btn btn-danger">x</button></td>
											</tr>	
										</c:forEach>
                                      
                                        
                                        <tr class="table-warning">
                                        	<form action ="" method = "get">
                                        	
                                        		<td style="width:20%;">             
                                        			<input type="text" class="custom_code" placeholder = "제품 코드" name="prod_code"/>
                                        		</td>
                                        		
                                        		<td style="width:20%;">             
                                        			<input type="text" class="custom_name" placeholder = "제품명" name="prod_name"/>
                                        		</td>
            		
                                        		<td style="width:20%;">             
                                        			<input type="text" class="custom_cnt" placeholder = "생산수량" name="prod_cnt"/>
                                        		</td>
                                        		
                                        		<td style="width:20%;">
                                        			<input type="date" calss ="custom_m_date" name ="prod_m_date"/>
                                        		</td>
                                        		
                                        		<td style="width:20%;" >	
                                        			<input type="text" class="custom_rack" placeholder = "제품 보관 장소" name="prod_rack"/>   
                                        		</td>
               
                                        		<td style="width:10%;"><input type="submit" class="btn btn-primary btn-sm" value="추가"> </td>
                                        
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
