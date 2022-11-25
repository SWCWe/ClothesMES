<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="jquery-3.6.0.min.js"></script>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="http://127.0.0.1:5000/" method="POST" enctype="multipart/form-data">

<script type="text/javascript">
	function makeQuestionToModel(question){
		console.log("useApitTest function called");
		console.log(question);
		$.ajax({
			type:"Get",
			url : "http://127.0.0.1:5000/"+question,
			datatype: "json",
			success:function(data){
				console.log(data);
				console.log('getting answer from flask server succeed')
			}
		
		})
		.fail(function(){
			alert("실패"); });	
	}
	
</script>
</form>
</body>


</html>
