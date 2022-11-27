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
    
    <%
    	// 출고 순번, 제품 코드, 출고 일자, 출고 수량, 주문 순번, 담당자 이름, 보관 장소
    	List<ReleaseVO> list = (List<ReleaseVO>) request.getAttribute("list");
    
    	// 담당자 이름(중복X)
    	List<String> nameList = (List<String>) request.getAttribute("nameList");
    	
    	// 제품 코드(중복X)
    	List<String> prod_codeList = (List<String>) request.getAttribute("prod_codeList");
    	
    	// 주문 순번(중복X)
    	List<String> order_seqList = (List<String>) request.getAttribute("order_seqList");
    %>
    
 <%@ include file="nav-top.jsp" %>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                          <%@ include file = "./nav.jsp" %>
            </div>
            <div id="layoutSidenav_content" class="mt-2">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">출고관리 💫</h1>
                        
                        <div class="card mb-4">
               
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                            
                            	<!-- 검색 폼 -->
	                            <div class="production-search mt-2 mb-4" style="display:flex; justify-content:center;">
	                            		<form id="releaseSearch" method = "post" style="display:grid; grid-template-columns : 23% 23% 23% 23% 8%; grid-gap:10px; ">
	                            			<div class="date-search-form">
	                            				<input id="r_date" type = "date" class =" form-control" name = "r_date">
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
	                            			
	                            			<!-- 제품 코드 검색 부분 -->
	                            			<div class="prod_code_search-form">
		                            			<select id="prod_code" class="form-select" name="prod_code">
		                            				<option selected disabled> 제품별 </option>
	                            				<%for (int i = 0; i < prod_codeList.size(); i++) { %>
	                            					<option><%=prod_codeList.get(i) %></option>
	                            				<%} %>
		                            			</select>
	                            			</div>
	                            			
	                            			<!-- 주문 순번 검색 부분 -->
	                            			<div class="order_seq_search-form">
		                            			<select id="order_seq" class="form-select" name="order_seq">
		                            				<option selected disabled> 주문 순번별 </option>
	                            				<%for (int i = 0; i < order_seqList.size(); i++) { %>
	                            					<option><%=order_seqList.get(i) %></option>
	                            				<%} %>
		                            			</select>
	                            			</div>
	                            			
	                            			<div class="pruduction_form_button">
	                            				<button type="button" onclick="releaseSearch()" class="btn btn-light"> 🔍 </button>
	                            				
	                            			</div>
	                            			
	                            		</form>
	                            	</div>
                            
                            
                                <table id="" class="table table-borderless table-striped table-hover" >
                                    <thead class="table-secondary" >
                                        <tr>
                                        	<th scope="col"><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></th>
                                            <th scope="col">출고 순번</th>
                                            <th scope="col">제품 코드</th>
                                            <th scope="col">출고 일자</th>
                                            <th scope="col">출고 수량</th>
                                            <th scope="col">주문 순번</th>
                                            <th scope="col">담당자</th>
                                            <th scope="col">보관 장소</th>
                                        </tr>
                                    </thead>
           
                                    <tbody>
                                    
                                    	<!-- 출고 목록 보기 기능 -->
                                    	<c:forEach items="${list}" var="release" varStatus="i">
                                    	<tr>
                                    		<td><input class="form-check-input" type = "checkbox" value id = "flex-CheckChecked"></td>
                                    		<td>${release.r_seq}</td>
                                    		<td>${release.prod_code}</td>
                                    		<td>${release.r_date}</td>
                                    		<td>${release.r_cnt}</td>
                                    		<td>${release.order_seq}</td>
                                    		<td>${release.name}</td>
                                    		<td>${release.prod_rack}</td>
                                    	</tr>
                                    	</c:forEach>
<!--                                                     
                                        
                                       <!-- 추가 폼  -->
                                        <tr class="table-warning">
                                        	<form action ="" method = "get">
                                        		<td style="width:12.5%;"></td>
                                        		<td style="width:12.5%;"><input type="submit" class="btn btn-primary btn-sm" value="추가"> </td>
                                        		
                                        		<td style="width:12.5%%">
                                        			<select class="custom_select" name = "prod_code">
                                        				<option selected disabled> 코드 선택 </option>
                                        				<option value=""> AD1234 </option>
                                        				<option value=""> AD1235 </option>
                                        			</select>
                                        		</td>
                                        		<td style="width:12.5%%;">
                     									<input type="date"/>
                                        				
                                       
                                        			
                                        		</td>
                                        		<td style="width:12.5%%;">
                                        		<input type="text" class="custom_select" placeholder = "수량입력" name="m_cnt"/>
                                        		</td>
                                        		<td style="width:12.5%%;" >
                                        			<select class="custom_select" name="emp_no">
                                        				<option selected disabled> 담당자 </option>
                                        				<option value=""> 이철원 </option>
                                        				<option value="emp_no"> 윤예지 </option>
                                        			</select>
                                        		</td>
                                        
                                        	</form>
                                        </tr>
                                    </tbody>
                                </table>

		<script type="text/javascript">
		

		
			/* 출고 정보 검색 기능 */
			
			// form에서 전송한 데이터를 받아 검색 내용을 조회하는 함수
			function releaseSearch () {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#releaseSearch").serialize();

				// ajax를 통해 searchRelease.do라는 곳으로 입력한 데이터를 보내 select하고
				// 검색 결과 보여주기
				$.ajax({
					url : "searchRelease.do",
					type : "POST",
					data : frmData,
					dataType : "JSON",
					success : searchReleaseList,
					error : function(e){
						console.log(e);
					}
				});
			};
			
			// 조회 결과를 받아 화면에 보여주는 함수?
			function searchReleaseList(data) {
				console.log("data: " + data[0].order_seq);
				// 여기까지는 데이터가 잘 들어옴
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
