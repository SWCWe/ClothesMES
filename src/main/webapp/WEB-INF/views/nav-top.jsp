<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--###수정한곳 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
			<!-- jquery 정의 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!--###수정한곳 -->   		
      		
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.do">의류 분류 및 재고관리 시스템</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form>
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
        </nav>