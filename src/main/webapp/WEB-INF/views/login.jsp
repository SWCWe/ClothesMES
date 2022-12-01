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
    <link href="${path}/resources/css/login.css" rel="stylesheet" />
     <!-- jquery 정의 -->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <title>Login</title>
</head>
<body>
    <session class = "login">
        <div class = "login-container">
            <div class ="login-container-box d-flex align-items-center justify-content-center flex-column">
                <div class="login-container-box-top">
                
                    <form action ="loginCheck.do" method = "post">
                        <div class = "form-group">
                            <input type = "text" class="form-control mb-3" name ="emp_no" placeholder = "아이디를 입력해 주세요"/>
                            <input type = "password" class ="form-control mb-3" name ="pw" placeholder = "비밀번호를 입력해 주세요"/>
                            
                            <input type = "submit" class ="btn btn-primary form-control" value="로그인" />
                        </div>
                    </form>
                    
                </div>
                <div class = "login-container-box-bottom d-flex mt-2">
                    <p class="login-container-box-bottom-left"> 아직 가입을 안하셨나요? </p> <span class = "login-container-box-bottom-right" onclick="location.href='join.do'"> 지금 가입하기 </span>
                </div>
            </div>
        </div>
    </session>
    

    
    
    
</body>
</html>