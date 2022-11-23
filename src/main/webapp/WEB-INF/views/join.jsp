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
    <title>Join</title>
</head>
<body>
    <session class = "join">
        <div class = "join-container">
            <div class ="join-container-box d-flex align-items-center justify-content-center flex-column">
                <div class="join-container-box-top">
                    <form action ="" method = "post">
                        <div class = "form-group">
                            <div class="list-group">
                                <div class="list-group-item text-center p-3">
                                    <h1>회원가입💌</h1>
                                </div>
                      
                                <div class="list-group-item list-group-item-action">
                                    
    
                                        <input type="text" class="form-control form-control-lg" name="emp_no" placeholder="아이디">
                                       
                                  
                                </div>
                                <div class="list-group-item list-group-item-action">
                                    
                  
                                        <input type="password" class="form-control form-control-lg" name="pw" placeholder = "비밀번호">
                               
                                </div>

                                <div class="list-group-item list-group-item-action">
                                    
                                        
                                    <input type="text" class="form-control form-control-lg" name= "name" placeholder = "이름">
                                   
                               
                            </div>

                                <div class="list-group-item list-group-item-action">
                                   
                                        <select class="form-select" id = "item_manager" name="c_code">
                                            <option disabled selected> 기업이름 </option>
                                            <option value="yeji"> 무한상사 </option>
                                            <option value="cheolwon"> 철원상사  </option>
                                            <option value="seongjin"> 성진상사 </option>
                                        </select>
                                 
                                </div>
                              
                                <div class="list-group-item list-group-item-action">
                                    
                                    
                                        <select class="form-select" id = "item_manager" name="dept">
                                            <option disabled selected> 부서이름</option>
                                            <option value = "a"> 생산부서 </option>
                                            <option value = "b"> 영업부서  </option>
                                            <option value = "c"> 기획부서 </option>
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