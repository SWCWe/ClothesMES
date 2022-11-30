<%@page import="kr.smhrd.entity.ProductionVO"%>
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
        <!-- jquery 정의 -->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        
        
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
                            	
                            	<!-- 검색 폼 -->
	                            <div class="production-search mt-2 mb-4" style="display:flex; justify-content:center;">
	                            		<form id="manufactureSearch" method = "post" style="display:grid; grid-template-columns : 23% 23% 23% 23% 8%; grid-gap:10px; ">
	                            			
	                            			<!-- 제품 코드 검색 부분 -->
	                            			<div class="prod_code_search-form">
		                            			<select id="prod_code" class="form-select" name="prod_code">
		                            				<option selected disabled> 제품 코드 </option>
			                            				<c:forEach items = "${list}" var="manufacture">
															<option>${manufacture.prod_code}</option>
														</c:forEach>
		                            			</select>
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="start_r_date" type = "date" class =" form-control" name = "start_r_date">
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="end_r_date" type = "date" class =" form-control" name = "end_r_date">
	                            			</div>
	                            			
	                            			<!-- 주문 순번 검색 부분 -->
	                            			<div class="m_seq_search-form">
		                            			<select id="m_seq" class="form-select" name="m_seq">
		                            				<option selected disabled> 생산 순번 </option>
		                            				<c:forEach items = "${list}" var="manufacture">
														<option>${manufacture.m_seq}</option>
													</c:forEach>
		                            			</select>
	                            			</div>
	                       
	                            			<!-- 검색 버튼 -->
	                            			<div class="pruduction_form_button">
	                            				<button type="button" onclick="manufactureSearch()" class="btn btn-light"> 🔍 </button>
		                            			<button onclick="prodload()"> 🔍 </button>
	                            			</div>
	   
	                            		</form>
	                            	</div>
                            
 
                                <table class="table table-borderless table-striped table-hover" >
                                    <thead class="table-secondary" >
                                        <tr>
                                            <th style="width:10%;" scope="col">생산 순번</th>
                                            <th style="width:10%;" scope="col">제품 코드</th>
                                            <th style="width:12.5%;" scope="col">생산 일자</th>
                                            <th style="width:12.5%;" scope="col">생산 수량</th>
                                            <th style="width:10%;" scope="col">담당 사원</th>
                                        	<th style="width:5%;" scope="col">삭제</th>
                                        </tr>
                                    </thead>
                                 </table>
           
           						<form id="deleteprod" method="post">
           							<div style="overflow-y:scroll; width:100%; height:300px; text-align:center;">
		           						<table class="table table-borderless table-striped table-hover" >
                                    	<tbody id="prodList">
         								<!-- list에서 하나씩 꺼내서 변수 product에 담아라 라는 뜻  -->
                                        <c:forEach items = "${list}" var="manufacture" varStatus="i">
											<tr>
												<td style="width:14%;">${manufacture.m_seq}</td>
												<td style="width:15%;">${manufacture.prod_code}</td>
												<td style="width:19%;">${manufacture.prod_m_date}</td>
												<td style="width:16%;">${manufacture.m_cnt}</td>
												<td style="width:16.6%;">${manufacture.name}</td>
												<td style="width:5%;"><button type="button" onclick="deleteprod(${manufacture.m_seq})" class="btn btn-danger btn-sm">x</button></td>
											</tr>	
										</c:forEach>
                                 		</tbody>
		                               	</table>
	                               	</div>
                               	</form>
                                        
                                
                                <form id="manufactureInsertFrm" method="post">
                                    <table class="table table-borderless table-striped table-hover">
	                                   	<tbody>
                                        <tr class="table-warning">
                                        	
                                        		<td style="width:20%;">             
                                        			<input type="text" class="custom_code" placeholder = "제품 코드" name="prod_code"/>
                                        		</td>
                                        		
                                        		<td style="width:20%;">
                                        			<input type="date" calss ="custom_m_date" name ="prod_m_date"/>
                                        		</td>
                                        		
                                        		<td style="width:20%;">             
                                        			<input type="text" class="custom_cnt" placeholder = "생산수량" name="m_cnt"/>
                                        		</td>
                                        		
                                        		<td style="width:20%;">             
                                        			<input type="text" class="custom_emp_no" placeholder = "담당 사원 " name="name"/>
                                        		</td>

                                        		<td style="width:10%;">
                                        			<button type="button" onclick="manufactureInsert()" class="btn btn-primary btn-sm"> 추가 </button>
                                        		</td>
                                        	
                                        </tr>
                                        
                                    </tbody>
                                </table>
                               </form>
                               

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
        
 		<script type="text/javascript">
 		
 			function reset(){
 				location.reload();
 			}
 			
 		
 		// form에서 전송한 데이터를 받아 검색 내용을 조회하는 함수
			function manufactureSearch() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#manufactureSearch").serialize();

				// ajax를 통해 searchRelease.do라는 곳으로 입력한 데이터를 보내 select하고
				// releaseList로 data 보냄
				$.ajax({
					url : "searchmanufacture.do",
					type : "POST",
					data : frmData,
					dataType : "JSON",
					success : prodList,
					error : function(e){
						console.log(e);
					}
				});
			};
 		
 		// 조회 결과를 받아 화면에 보여주는 함수
			function prodList(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<tr>";
					html += "<td style='width:14%;'>" + data[i].m_seq + "</td>";	
					html += "<td style='width:15%;'>" + data[i].prod_code + "</td>";	
					html += "<td style='width:19%;'>" + data[i].prod_m_date + "</td>";	
					html += "<td style='width:16%;'>" + data[i].m_cnt + "</td>";	
					html += "<td style='width:16.6%;'>" + data[i].name + "</td>";	
					html += "<td style='width:5%;'><button type='button' onclick='deleteprod(" + data[i].m_seq + ")' class='btn btn-danger btn-sm'>x</button></td>"
					html += "</tr>";
				}
				// id가 "releaseList"인 <tbody>안의 html 교체
				$('#prodList').html(html);
			}
		
		// 현재 DB에 저장된 데이터를 json 형태로 가져오는 함수
			function prodload() {
				$.ajax({
					url : "loadProd.do",
					success : prodList,
					error : function(e){
						console.log(e);
					}
				});
			}

		// 삭제 기능
			function deleteprod(m_seq) {
				
				$.ajax({
					url : "deleteprod.do",
					type : "POST",
					data : {"m_seq" : m_seq},
					success : prodload,
					error : function(e){
						console.log(e);
					}
				});
			}
			
	   /* 출고 정보 추가 기능 */
			// form에서 전송한 데이터를 받아 DB에 삽입하는 함수
			function manufactureInsert() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#manufactureInsertFrm").serialize();
				
				// ajax를 통해 insertRelease.do라는 곳으로 입력한 데이터를 보내 insert하고
				// ReleaseList로 data 보냄
				$.ajax({
					url : "insertmanufacture.do",
					type : "POST",
					data : frmData,
					success : prodload,
					error : function(e){
						console.log(e);
					}
				});
			
			}
		
		</script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
