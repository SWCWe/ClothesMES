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
    <title>Login</title>
</head>
<body>
    <session class = "login">
        <div class = "login-container">
            <div class ="login-container-box d-flex align-items-center justify-content-center flex-column">
                <div class="login-container-box-top">
                    <form action ="" method = "post">
                        <div class = "form-group">
                            <input type = "text" class="form-control mb-3" id ="emp_no" placeholder = "아이디를 입력해 주세요"/>
                            <input type = "password" class ="form-control mb-3" id ="pw" placeholder = "비밀번호를 입력해 주세요"/>
                            
                            <input type = "button" onclick = "loginCheck()"class ="btn btn-primary form-control" value="로그인" name ="" placeholder = "비밀번호를 입력해 주세요"/>
                        </div>
                    </form>
                </div>
                <div class = "login-container-box-bottom d-flex mt-2">
                    <p class="login-container-box-bottom-left"> 아직 가입을 안하셨나요? </p> <span class = "login-container-box-bottom-right" onclick="location.href='join.do'"> 지금 가입하기 </span>
                </div>
            </div>
        </div>
    </session>
    <script type="text/javascript">
    
    function loginCheck(){
    	var userID = $("#emp_no").val();
    	var pwd  =   $("#pw").val();
    	var loginData = {"emo_no":userID, "pw":pwd}
    	
    	console.log("ajax 전송");
    	
    	$.ajax({
			url : "loginCheck.do",
			type : "POST",
			data : JSON.stringify(loginData),
			datatype:"json",
			success : function(result){
				if(result==0){
					alert("아이디와 비밀번호를 다시 확인 후 시도해 주세요.");
				return false;
				
				}else if(result ==9){
					alert("통신 오류");
				}else{
					// 로그인 성공 시
				  window.location.href="index.do";
				}
			
			error : function(e){
				console.log(e);
			}
		});
    	}
    	
    
    
    
    
    
    
    
    </script>
    
    
    
</body>
</html>