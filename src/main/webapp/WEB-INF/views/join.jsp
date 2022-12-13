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
    <link href="${path}/resources/css/style.css" rel="stylesheet" />
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
    <session class = "join" style="height:140vh; display:flex; align-items:center">
        <div class = "join-container">
            <div class ="join-container-box d-flex align-items-center justify-content-center flex-column">
                <div class="join-container-box-top">
                    <form id ="Register" method = "post">
                        <div class = "form-group">
                            <div class="list-group">
                                <div class="list-group-item text-center p-3">
                                    <h1>회원가입💌</h1>
                                </div>
                      			
                      			<!-- 아이디  -->
                                <div class="list-group-item list-group-item-action">
                                    
                                  
    
                                        <input type="text" class="form-control form-control-lg" id ="emp_no" name="emp_no" placeholder="사번" required maxlength="8">
                                        <span class="point successNameChk">사번은 2자 이상 8자 이하로 설정해 주시기 바랍니다.</span>
                                        <input type = "hidden" id = "nameDoubleChk"/>
                                  
                                </div>
                               
                               
                               <!-- 이름 -->
                                <div class="list-group-item list-group-item-action">
                                    
                                  
    
                                        <input type="text" class="form-control form-control-lg" id = "name" name="name" placeholder="이름을 입력해 주세요" required maxlength="8">
                
                                        <span class="point successIdChk">이름은 2자 이상 8자 이하로 설정해 주시기 바랍니다.</span>
                                        <span class = "point"> ※ 영문자, 소문자 입력가능, 최대 10자 까지 입력 </span>
                                        <input type = "hidden" id = "idDoubleChk"/> 
                                </div>
                                
                                <!-- 비밀번호 -->
                                <div class="list-group-item list-group-item-action">
                                    
                  
                                        <input type="password" class="form-control form-control-lg" id = "userpass" name="pw" placeholder = "비밀번호" required maxlength="8" autocomplete="off">
                               			<span class = "point">※ 비밀번호는 총 8자 까지 입력가능 </span>
                                </div>
                                
                                <!-- 비밀번호 확인 -->
                                <div class="list-group-item list-group-item-action">
                                    
                  
                                        <input type="password" class="form-control form-control-lg" id="userpasschk" name="pw_chk" placeholder = "비밀번호 확인" required maxlength="8" autocomplete="off">
                               			<span class = "point successPwChk"></span>
                               			<input type="hidden" id = "pwDoubleChk" />
                                </div>
                                

                      			<!-- 직책 -->

                                <div class="list-group-item list-group-item-action">
                                   
                                        <select class="form-select" id = "item_manager" name="position">
                                            <option disabled selected> 직책 </option>
                                            <option value="사원"> 사원 </option>
                                            <option value="부장"> 부장 </option>
                                           
                                        </select>
                                 
                                </div>
                              
                              <!-- 부서 -->
                                <div class="list-group-item list-group-item-action">
                                    
                                    
                                        <select class="form-select" id = "item_manager1" name="dept">
                                            <option disabled selected> 부서이름</option>
                                            <option value = "생산부"> 생산부 </option>
                                            <option value = "출하부"> 출하부  </option>
                                            <option value = "경영부"> 경영부 </option>
                                        </select>
                                       
                                 
                                </div>
                                
                                <div class="row">
                                
                                <div class ="col col-xl-6  d-flex justify-content-center">
                                
                                	<!-- 이용약관  -->
							
							<div class= "use-info">
								<fieldset>
									<legend class="text-center"><span>이용</span>약관</legend>
									<p class="agreeText">
										<label for="agreement1">아래 사항에 동의 합니다.</label>
										<input id="agreement1" type="checkbox" name="agreement1"/>
										<textarea class ="form-control" id="text1" readonly>
											이용약관 
										</textarea>
									</p>
								</fieldset>
							
							</div>
                                </div>
                                <div class ="col col-xl-6 d-flex justify-content-center">
                                <fieldset class="fieldarea f3">
									<legend class="text-center"><span>개인정보</span>취급방침</legend>
									<p class="agreeText">
										<label for="agreement2">아래 사항에 동의 합니다.</label>
										<input id="agreement2" type="checkbox" name="agreement2"/>
										<textarea class="form-control" id="text2" readonly>
											개인정보 방침 및 안내
										</textarea>
									</p>
								</fieldset>
                                </div>
                                </div>
                           
						
							
							<!-- 버튼 -->
                                <div class="joinbutton" style="display:flex; justify-content:center">

                                    
                                    <input type="submit" id = "button1" class="btn btn-primary mt-3" onclick="location.href='login.do'" style = "font-size:30px" value="등록하기">
                                    <input type="button" id = "button2" class="btn btn-primary mt-3" style = "font-size:30px; margin-left:10px;" value="다시쓰기">
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
    


<script type="text/javascript">

<!--  이름 체크 -->
$("#emp_no").blur(function(){
	var sm_name = $("#emp_no").val();
	if(sm_name == "" || sm_name.length < 2){
		$(".successNameChk").text("사번은 2자 이상 8자 이하로 설정해주세요 :)");
		$(".successNameChk").css("color", "red");
		$("#nameDoubleChk").val("false");
	}else{
		$.ajax({
			url : 'nameCheck.do',
			type : 'post',
			data : {"emp_no" : sm_name},
			
			success : function(data) {
				if (data == 0) {
					$(".successNameChk").text("사용가능한 아이디입니다.");
					$(".successNameChk").css("color", "green");
					$("#nameDoubleChk").val("true");
				} else {
					$(".successNameChk").text("사용중인 아이디입니다.");
					$(".successNameChk").css("color", "red");
					$("#nameDoubleChk").val("false");
				}
			}, error : function() {
				console.log("실패");
			}
		});
	}
});

// 비밀번호 체크
//비밀번호 확인
	$("#userpasschk").blur(function(){
		if($("#userpasschk").val() == $("#userpass").val()){
			$(".successPwChk").text("비밀번호가 일치합니다.");
			$(".successPwChk").css("color", "green");
			$("#pwDoubleChk").val("true");
		}else{
			$(".successPwChk").text("비밀번호가 일치하지 않습니다.");
			$(".successPwChk").css("color", "red");
			$("#pwDoubleChk").val("false");
		}
	});


// 이용약관 체크박스 확인
$("input:checkbox").click(checkedChange);
   function checkedChange() {
       if($(this).prop("checked")){
           $("label[for="+this.id+"]").text("동의되었습니다.");
           $("label[for="+this.id+"]").css("color","blue");
       }else{
           $("label[for="+this.id+"]").text("동의 해주시기 바랍니다.");
           $("label[for="+this.id+"]").css("color","red");
       }
   }


   //최종 틍록하기 버튼 클릭시 각 부분별 입력값 맞는지 확인
   $("#button1").click(function(){
	    if($("#agreement1").prop("checked") && $("#agreement2").prop("checked") && $("#nameDoubleChk").val() == "true" && $("#pwDoubleChk").val() == "true"){
	    	alert($('#name').val()+"님 환영합니다. 선택해주셔서 감사합니다 :)");
   			Register();
	    }else{
	    	alert("회원가입을 완료할 수 없습니다. 다시한번 확인해주십시오.");
	    	if(!$("#agreement1").prop("checked")){
	    		$("label[for=agreement1]").text("동의 해주시기 바랍니다.");
	    		$("label[for=agreement1]").css("color","red");
	    	}
	    	if(!$("#agreement2").prop("checked")) {
	    		$("label[for=agreement2]").text("동의 해주시기 바랍니다.");
	    		$("label[for=agreement2]").css("color","red");
	    	}
	    	if($("#nameDoubleChk").val() != "true"){
	    		$(".successNameChk").text("아이디를 입력해주세요 :)");
				$(".successNameChk").css("color", "red");
	    	}
	    	
	    	if($("#pwDoubleChk").val() != "true"){
	    		$(".successPwChk").text("비밀번호가 일치하지 않습니다 :)");
				$(".successPwChk").css("color", "red");
	    	}
	    	
	    	return false
	    }    	    	
   });



   
   
   
   //회원가입 ajax
   
   			 var link_url = "login.do";
   // form에서 전송한 데이터를 받아 DB에 삽입하는 함수
			function Register() {
				// form에서 전송한 데이터를 json 형태로 저장
				var frmData = $("#Register").serialize();
				
				// ajax를 통해 insertRelease.do라는 곳으로 입력한 데이터를 보내 insert하고
				// ReleaseList로 data 보냄
				$.ajax({
					url : "joinRegister.do",
					type : "POST",
					data : frmData,
					//success : location.replace(link_url),
					success : function(link_url, textStatus) {
						if (data.redirect) {
				            window.location.href = data.redirect;
				        }
					},
					
					error : function(e){
						console.log(e);
					}
				});
			}
   
   function loginGo() {
	   location.href="production.do";
   }
	
   
   
	
   
   
   
   
   
   
   
   


</script>


    
</body>
</html>