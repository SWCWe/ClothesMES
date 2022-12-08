<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--###수정한곳 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<!-- jquery 정의 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="${path}/resources/css/styles.css" rel="stylesheet">
    <!--###수정한곳 -->   		
      		
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark" style="display:flex; justify-content: space-between; padding: 0 10px;">
            <!-- Navbar Brand-->
            <div class="d-flex">
            <a class="navbar-brand ps-3" href="index.do">CPRMS</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars" style="position: absolute; left:30px; top: 23px;"></i></button>
        
            </div>
            <div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

		<!-- 로그인/비로그인 조건문 -->           
			<c:choose>
				<c:when test="${not empty vo.emp_no}">
					<li>${vo.emp_no} 님 환영합니다!</li>  
				</c:when>
				
				<c:otherwise>
					로그인 해주세요! 
				</c:otherwise>
			</c:choose>
  		<!-- 로그인/비로그인 조건문 -->
                        <li><a class="dropdown-item" href="login.do">Login</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="logout.do">Logout</a></li>
                    </ul>
                </li>
            </ul>
            </div>
        </nav>