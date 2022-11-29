<%@page import="kr.smhrd.entity.ReleaseVO"%>
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
        <title>출고관리 Page</title>
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
        
        .pruduction_form_button .btn:nth-child(1){
        	margin-right:10px;
        }
        
      
        
        table input[type=text],
         table input[type=date],
         .custom_select
        {
        
       padding:0; margin:0; width:60%; ; border:none; background-color:transparent; height:30px; font-size:17px; text-align:center;
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
       
       .production-search{
       	display:flex;
       	justify-content:center;
       }
       .production-search form{
        display:grid; grid-template-columns : 16% 16% 16% 16% 16% 16%; grid-gap:10px; 
       }
       
       
       
 

       
          @media (max-width:1200px) {
		.production-search {
			display:block;
		}
 		.production-search form {
       display:grid; grid-template-columns : 100%; grid-gap:10px;
       }
        .pruduction_form_button{
        	display:flex;
        	justify-content:end;

        }	
        
        .pruduction_form_button .btn{
        	width:100%;
        }
        
            table tr {
        	font-size:12px;
        }
        	div.add table tr input::placeholder{
        		font-size:10px;
        	}
       
        	
        	 table input[type=text], table input[type=date], .custom_select{
     	font-size:10px;
     }
        	
  
        }
        
        
       @media (max-width:576px) {
		.production-search {
			display:block;
		}
 		.production-searchform {
       display:grid; grid-template-columns : 100%; grid-gap:10px;
       }

        .pruduction_form_button .btn{
        	width:100%;
        }
        
    
        }
        </style>
    </head>
    
    <body class="sb-nav-fixed">
    
    <%
    	// 출고 순번, 제품 코드, 출고 일자, 출고 수량, 주문 순번, 담당자 이름, 보관 장소
    	List<ReleaseVO> list = (List<ReleaseVO>) request.getAttribute("list");
    
    	// 담당자 이름(중복X)
    	List<String> nameList = (List<String>) request.getAttribute("nameList");
    	
    	// 제품 코드(중복X)
    	List<String> prod_codeList = (List<String>) request.getAttribute("prod_codeList");
    	
    	// 주문 순번(중복X)
    	List<String> order_seqList = (List<String>) request.getAttribute("order_seqList");
    	
    	// 추가 폼에 들어갈 데이터
    	List<String> plusProd_codeList = (List<String>) request.getAttribute("plusProd_codeList");
    	List<String> plusOrder_seqList = (List<String>) request.getAttribute("plusOrder_seqList");
    	List<String> plusProd_rackList = (List<String>) request.getAttribute("plusProd_rackList");
    	
    %>
    
 <%@ include file="nav-top.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                          <%@ include file = "./nav.jsp" %>
            </div>
            <div id="layoutSidenav_content" class="mt-2">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">출고 관리 <i class="fa-brands fa-waze fa-beat" style="color:black;"></i></h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                               
                            </div>
                            <div class="card-body">
                            
                            	<!-- 검색 폼 -->
	                            <div class="production-search mt-2 mb-4">
	                            		<form id="releaseSearch" method = "post">
	                            			
	                            			<!-- 제품 코드 검색 부분 -->
	                            			<div class="prod_code_search-form">
		                            			<select id="prod_code" class="form-select" name="prod_code">
		                            				<option selected disabled> 제품 </option>
	                            				<%for (int i = 0; i < prod_codeList.size(); i++) { %>
	                            					<option><%=prod_codeList.get(i) %></option>
	                            				<%} %>
		                            			</select>
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="start_r_date" type = "date" class =" form-control" name = "start_r_date">
	                            			</div>
	                            			
	                            			<div class="date-search-form">
	                            				<input id="end_r_date" type = "date" class =" form-control" name = "end_r_date">
	                            			</div>
	                            			
	                            			<!-- 주문 순번 검색 부분 -->
	                            			<div class="order_seq_search-form">
		                            			<select id="order_seq" class="form-select" name="order_seq">
		                            				<option selected disabled> 주문 순번 </option>
	                            				<%for (int i = 0; i < order_seqList.size(); i++) { %>
	                            					<option><%=order_seqList.get(i) %></option>
	                            				<%} %>
		                            			</select>
	                            			</div>
	                            	
	                            			<!-- 담당자 검색 부분 -->
	                            			<div class="emp_search_form">
	                            			<select id="name" class="form-select" name="name">
	                            				<option selected disabled> 담당자 </option>
	                            				<!-- 담당자 목록 출력 -->
	                            				<%for (int i = 0; i < nameList.size(); i++) { %>
	                            					<option><%=nameList.get(i) %></option>
	                            				<%} %>
	                            			</select>
	                            			</div>
	                            			
	                            			<!-- 검색 버튼 -->
	                            			<div class="pruduction_form_button">
	                            				<button type="button" onclick="releaseSearch()" class="btn btn-light"> 🔍 </button>
	                            			    <button type="reset" onclick="releaseLoad()" class="btn btn-light">
                            						<i class="fa-solid fa-arrow-rotate-left"></i>
                            				  	</button>
	                            			</div>
	                            			
	                            		</form>
	                            	</div>
                            
                            
                                <table class="table table-borderless table-striped table-hover" >
                                    <thead class="table-secondary" >
                                        <tr>
                                            <th style="width:10%;" scope="col">출고 순번</th>
                                            <th style="width:10%;" scope="col">주문 순번</th>
                                            <th style="width:12.5%;" scope="col">제품 코드</th>
                                            <th style="width:12.5%;" scope="col">출고 일자</th>
                                            <th style="width:10%;" scope="col">출고 수량</th>
                                            <th style="width:12.5%;" scope="col">담당자</th>
                                            <th style="width:12.5%;" scope="col">보관 장소</th>
                                        	<th style="width:5%;" scope="col">삭제</th>
                                            <th style="width:1%;" scope="col"></th>
                                        </tr>
                                    </thead>
                                 </table>
                                 
                                 <form id="deleteRelease" method="post">
	                                 <div style="overflow-y:scroll; width:100%; height:300px; text-align:center;">
		           						<table class="table table-borderless table-striped table-hover" >
		                                   	<!-- 출고 목록 보기 기능 -->
		                                    <tbody id="releaseList">
		                                    	<c:forEach items="${list}" var="release" varStatus="i">
			                                    	<tr>
			                                    		<td style="width:10%;">${release.r_seq}</td>
			                                    		<td style="width:10%;">${release.order_seq}</td>
			                                    		<td style="width:12.5%;">${release.prod_code}</td>
			                                    		<td style="width:12.5%;">${release.r_date}</td>
			                                    		<td style="width:10%;">${release.r_cnt}</td>
			                                    		<td style="width:12.5%;">${release.name}</td>
			                                    		<td style="width:12.5%;">${release.prod_rack}</td>
			                                    		<td style="width:5%;"><button onclick="deleteRelease(${release.r_seq})" class="btn btn-secondary btn-sm">X</button></td>
			                                    	</tr>
		                                    	</c:forEach>
		                                   	</tbody>
		                               	</table>
	                               	</div>
                               	</form>
                               	
                               	<!-- 출고 정보 추가 폼 -->
                               	<form id="releaseInsertFrm" method="post">
	                               	<table class="table table-borderless table-striped table-hover">
	                                   	<tbody>
                                        	<tr class="table-warning">
                                        	
                                        		<td style="width:10%;"></td>
                                        		
                                        		<td style="width:10%;">
                                        			<select id="order_seqCategory" onChange="prod_codeChange(this.value)" class="custom_select" name="order_seq">
	                                        			<option selected disabled> 주문 순번 </option> 
	                                        			<%for (int i = 0; i < plusOrder_seqList.size(); i++) { %>
	                            							<option><%=plusOrder_seqList.get(i) %></option>
	                            						<%} %>
	                            					</select>
                                        		</td>
                                        		
                                        		<td style="width:12.5%">
                                        			<select id="prod_codeCategory" class="custom_select" name="prod_code">
                                        				<option selected disabled> 제품 코드 </option>
                                        			</select>
                                        		</td>
                                        		
                                        		<td style="width:12.5%;">
                     									<input type="date" name="r_date">
                                        		</td>
                                        		
                                        		<td style="width:10%;">
                                        			<input type="text" class="custom_select" placeholder = "출고 수량" name="r_cnt"/>
                                        		</td>
                                        		
                                        		<td style="width:12.5%;" >
                                        			<input type="text" class="custom_select" placeholder = "담당자" name="name"/>
                                        		</td>
                                        		
                                        		<td style="width:12.5%;">
                                        			<button type="button" onclick="releaseInsert()" class="btn btn-primary btn-sm"> 추가 </button>
                                        		</td>
                                        		
                                        		<td style="width:6%;" scope="col"></td>
                                        		
	                                        </tr>
	                                    </tbody>
	                                </table>
                                </form>

		<script type="text/javascript">
		
			/* 출고 정보 검색 기능 */
			
			// form에서 전송한 데이터를 받아 검색 내용을 조회하는 함수
			function releaseSearch() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#releaseSearch").serialize();

				// ajax를 통해 searchRelease.do라는 곳으로 입력한 데이터를 보내 select하고
				// releaseList로 data 보냄
				$.ajax({
					url : "searchRelease.do",
					type : "POST",
					data : frmData,
					dataType : "JSON",
					success : releaseList,
					error : function(e){
						console.log(e);
					}
				});
			};
			
			// 조회 결과를 받아 화면에 보여주는 함수
			function releaseList(data) {
				var html = "";
				for (var i = 0; i < data.length; i++) {
					html += "<tr>";
					html += "<td style='width:10%;'>" + data[i].r_seq + "</td>";	
					html += "<td style='width:10%;'>" + data[i].order_seq + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].prod_code + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].r_date + "</td>";	
					html += "<td style='width:10%;'>" + data[i].r_cnt + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].name + "</td>";	
					html += "<td style='width:12.5%;'>" + data[i].prod_rack + "</td>";
					html += "<td style='width:5%;'><button type='button' onclick='deleteRelease(" + data[i].r_seq + ")' class='btn btn-danger btn-sm'>X</button></td>"
					html += "</tr>";
				}
				// id가 "releaseList"인 <tbody>안의 html 교체
				$('#releaseList').html(html);
			}
			
			/* 출고 정보 추가 기능 */
			// form에서 전송한 데이터를 받아 DB에 삽입하는 함수
			function releaseInsert() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#releaseInsertFrm").serialize();
				
				// ajax를 통해 insertRelease.do라는 곳으로 입력한 데이터를 보내 insert하고
				// ReleaseList로 data 보냄
				$.ajax({
					url : "insertRelease.do",
					type : "POST",
					data : frmData,
					success : releaseLoad,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 현재 DB에 저장된 데이터를 json 형태로 가져오는 함수
			function releaseLoad() {
				$.ajax({
					url : "loadRelease.do",
					success : releaseList,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 삭제 기능
			function deleteRelease(r_seq) {
				
				$.ajax({
					url : "deleteRelease.do",
					type : "POST",
					data : {"r_seq" : r_seq},
					success : releaseLoad,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 추가 폼에서 주문 순번에 따라 제품 코드를 다르게 보여주는 함수
			// 주문 순번에 포함되어 있는 제품 코드만 가져오기
			function prod_codeChange() {
				var order_seq = document.getElementById("order_seqCategory").value;
				
				$.ajax({
					url : "prod_codeChange.do",
					type : "POST",
					data : {"order_seq" : order_seq},
					success : prod_codeCategoryChange,
					error : function(e){
						console.log(e);
					}
				});
			}
			
			// 추가 폼의 카테고리 바꿔주는 함수
			function prod_codeCategoryChange(data) {
				var html = "<option selected disabled> 제품 코드 </option>";
				console.log(data)
				for (var i = 0; i < data.length; i++) {
					html += "<option>" + data[i] + "</option>";
				}
				// 추가 폼의 제품 코드 카테고리 html 교체
				$('#prod_codeCategory').html(html);
			}
			
		
		</script>
										
	
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
        
 	
		<!-- release.js와 연결 -->
		<!-- <script src="${path}/resources/js/release.js"></script> -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="${path}/resources/js/datatables-simple-demo.js"></script>
    </body>
</html>
