<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>어떤 옷인지 맞춰보자!</h1>
	
	<form action="http://127.0.0.1:5000/predict" method="POST" enctype="multipart/form-data">
		사진선택 <input type="file" name="img" multiple="multiple">
		<input type="submit" value="예측하기">
	</form>
</body>
</html>