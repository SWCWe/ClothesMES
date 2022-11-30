<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>이 사진의 제품 번호는 <%= request.getParameter("num") %> 입니다. </h3>
	<h3>이 사진의 정확도는  <%= request.getParameter("acc") %> 입니다.</h3>
	<p><img src="resource/img/frame2196.png"></p>
</body>
</html>