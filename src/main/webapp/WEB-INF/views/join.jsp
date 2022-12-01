<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel = "stylesheet" href="https://bootswatch.com/5/lumen/bootstrap.min.css">
    <link href="${path}/resources/css/join.css" rel="stylesheet" />
    <script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
    <title>Join</title>
    <style>
    	.id_input_re_1{
    		color : green;
    		display:none;
    	}
    	
    	.id_input_re_2{
    		color : red;
    		display : none;
    	}
    </style>
</head>
<body>
    <session class = "join">
        <div class = "join-container">
            <div class ="join-container-box d-flex align-items-center justify-content-center flex-column">
                <div class="join-container-box-top">
                    <form action ="joinInsert.do" method = "post">
                        <div class = "form-group">
                            <div class="list-group">
                                <div class="list-group-item text-center p-3">
                                    <h1>회원가입💌</h1>
                                </div>
                      
                                <div class="list-group-item list-group-item-action">
                                    
    
                                        <input type="text" class="form-control form-control-lg id_input" name="emp_no" placeholder="아이디">
                                       
                                  
                                </div>
                               
                                <div class="list-group-item list-group-item-action">
                                    
                  
                                        <input type="password" class="form-control form-control-lg" name="pw" placeholder = "비밀번호">
                               
                                </div>

                                <div class="list-group-item list-group-item-action">
                                    
                                        
                                    <input type="text" class="form-control form-control-lg" name= "name" placeholder = "이름">
                                   
                               
                            </div>

                                <div class="list-group-item list-group-item-action">
                                   
                                        <select class="form-select" id = "item_manager" name="position">
                                            <option disabled selected> 직책 </option>
                                            <option value="사원"> 사원 </option>
                                            <option value="부장"> 부장 </option>
                                           
                                        </select>
                                 
                                </div>
                              
                                <div class="list-group-item list-group-item-action">
                                    
                                    
                                        <select class="form-select" id = "item_manager" name="dept">
                                            <option disabled selected> 부서이름</option>
                                            <option value = "생산부"> 생산부 </option>
                                            <option value = "출하부"> 출하부  </option>
                                            <option value = "경영부"> 경영부 </option>
                                        </select>
                                       
                                 
                                </div>
                                
                           
                                <div class="joinbutton">

                                    
                                    <input type="submit" class="btn btn-primary mt-3" style = "width:130px; font-size:30px" value="가입">
                                </div>
                            </div>
                            
                            
                        </div>
                    </form>
                </div>
                <div class = "join-container-box-bottom d-flex mt-2">
                    <p class="join-container-box-bottom-left"> 이미 가입 하셨나요? </p> <span class = "join-container-box-bottom-right" onclick="location.href='login.do'"> 로그인 하러 가기 </span>
                </div>
            </div>
        </div>
    </session>
    

    
</body>
</html>