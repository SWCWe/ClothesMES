<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원가입 페이지</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
              <!-- jquery 정의 -->
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>


<body>

<form id="Register" method="post">
<!--  이름 입력 창  -->
<div>
	<tr>
  <th>
  	<label for="emp_no">아이디</label>
  </th>
  <td>
    <input id="emp_no" type="text" name="emp_no" placeholder="아이디을 설정해주세요." maxlength="10" title="8자 까지 입력" required autofocus/>
    <span class="point successNameChk">아이디는 2자 이상 8자 이하로 설정해주시기 바랍니다.</span>
    <input type="hidden" id="nameDoubleChk"/>
  </td>
	</tr>
</div>

<!-- 아이디 입력 창 -->
<div>
<tr>
	<th>
		<label for="name">이&emsp;름</label>
	</th>
	<td>
		<input id="name" type="text" name="name" placeholder="이름를 입력해주세요." required maxlength="8"/>
		<span class="point successIdChk"></span><br/>
		<span class="point">※ 영문자, 소문자 입력가능, 최대 10자 까지 입력</span>
		<input type="hidden" id="idDoubleChk"/>
	</td>
</tr>
</div>
<!--  비밀번호 입력 창 -->
<div>
<tr>
	<th>
		<label for="userpass">비밀번호</label>
	</th>
	<td>
		<input id="userpass" type="password" name="pw"  required maxlength="8" autocomplete="off"/>
		<span class="point">※ 비밀번호는 총 8자 까지 입력가능</span>
	</td>
</tr>
</div> 

<tr>
	<th>
		<label for="userpasschk">비밀번호 확인</label>
	</th>
	<td>
		<input id="userpasschk" type="password" name="pw_chk" placeholder="동일하게 입력해주세요." required maxlength="8" autocomplete="off"/>
		<span class="point successPwChk"></span>
		<input type="hidden" id="pwDoubleChk"/>
	</td>
</tr>

<div class="list-group-item list-group-item-action">
                                   
                                        <select class="form-select" id = "item_manager" name="position">
                                            <option disabled selected> 직책 </option>
                                            <option value="부장"> 부장 </option>
                                            <option value="대리"> 대리  </option>
                                            <option value="사원"> 사원 </option>
                                        </select>
                                 
                                </div>
                              
                                <div class="list-group-item list-group-item-action">
                                    
                                    
                                        <select class="form-select" id = "item_manager1" name="dept">
                                            <option disabled selected> 부서이름</option>
                                            <option value = "생산부"> 생산부서 </option>
                                            <option value = "영업부"> 영업부서  </option>
                                            <option value = "기획부"> 기획부서 </option>
                                        </select>
                                       
                                 
                                </div>




<div>
<fieldset class="fieldarea f2">
	<legend><span>이용</span>약관</legend>
	<p class="agreeText">
		<label for="agreement1">아래 사항에 동의 합니다.</label>
		<input id="agreement1" type="checkbox" name="agreement1"/>
		<textarea id="text1" readonly>
			이용약관
		</textarea>
	</p>
</fieldset>

<fieldset class="fieldarea f3">
	<legend><span>개인정보</span>취급방침</legend>
	<p class="agreeText">
		<label for="agreement2">아래 사항에 동의 합니다.</label>
		<input id="agreement2" type="checkbox" name="agreement2"/>
		<textarea id="text2" readonly>
			개인정보 방침 및 안내
		</textarea>
	</p>
</fieldset>
</div>

<div class="btnCenter">
	<input type="button" id="button1" value="등록하기" title="등록하기 버튼"/>
	<input type="reset" id="button2" value="다시쓰기" title="다시쓰기 버튼"/>
</div>

</form>








<script type="text/javascript">

<!--  이름 체크 -->
$("#emp_no").blur(function(){
	var sm_name = $("#emp_no").val();
	if(sm_name == "" || sm_name.length < 2){
		$(".successNameChk").text("아이디는 2자 이상 8자 이하로 설정해주세요 :)");
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
	    	alert($('#sm_id').val()+"님 환영합니다. 선택해주셔서 감사합니다 :)");
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
					success : location.replace(link_url),
					error : function(e){
						console.log(e);
					}
				});
			}
   
	
   
   
	
   
   
   
   
   
   
   
   


</script>


</body>
</html>