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
        <title>내이름은 예지 팀장2조</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
         <link href="${path}/resources/css/styles.css" rel="stylesheet" >
         <link href="${path}/resources/css/button.css" rel="stylesheet" >
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

    	<!-- jquery 정의 -->

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    </head>
    <body class="sb-nav-fixed">
 		<%@ include file="nav-top.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
              <%@ include file = "./nav.jsp" %>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                    <!-- Dashboar -->
                        <h1 class="mt-4">주문목록</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">OrderList</li>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                	<div class="card-header"> 2022-02-01 22:22:22</div>
                                    <div class="card-body">
                                    	<div class="id_area mb-2"> ID : yujin123 </div>
                                    	<div class="d-flex align-items-center">
                                    	<h3> 말랑말랑 바지 </h3>
                                    	<div class="badge badge-lg bg-secondary ml-3"> 1개 </div>
                                    	</div>
                                    </div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Warning Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Success Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Danger Card</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <a class="small text-white stretched-link" href="#">View Details</a>
                                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart Example
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                제품 목록
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>제품 코드</th>
                                            <th>재품 명</th>
                                            <th>재고 수량</th>
                                            <th>제조 일자</th>
                                            <th>보관 장소</th>
                                          
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                           <th>제품 코드</th>
                                            <th>재품 명</th>
                                            <th>재고 수량</th>
                                            <th>제조 일자</th>
                                            <th>보관 장소</th>
                                        </tr>
                                    </tfoot>
                                    <tbody class="list">
                                       
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
        
        <script>
        function loadList(){
        	$.ajax({
        		url : "list.do",
        		method : "POST",
        		dataType : "JSON",
        		success : listProduct,
        		
        		error : function(e){
        			console.log(e);
        		}
        		
        	});
        }
        
        loadList();
   
        function listProduct(data){
        	var html = "<";
        	for(var i = 0; i < data.length; i++){
        		
        	html += "<tr>";
        	html += "<td style='width:20%'>" + data[i].prod_code + "</td>";
        	html += "<td style='width:20%'>" + data[i].prod_name + "</td>";
        	html += "<td style='width:20%'>" + data[i].prod_cnt + "</td>";
        	html += "<td style='width:20%'>" + data[i].prod_m_date + "</td>";
        	html += "<td style='width:20%'>" + data[i].prod_rack + "</td>";
        	html += "</tr>";
        		
        	}
        	
        	$('.list').html(html);
        	
        }
      
      
        function loadOrderList(){
        	$.ajax({
        		url : "restOrderList.do",
        		method : "POST",
        		dataType : "JSON",
        		success : function(list){
        			console.log(list)
        		},
        		error : function(e) {
        			console.log(e);
        		}
        	})
        }
        
      
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/assets/demo/chart-area-demo.js"></script>
        <script src="${path}/resources/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
