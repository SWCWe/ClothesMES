<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<String> fileName = (ArrayList<String>) request.getAttribute("fileName");
		ArrayList<String> txtName = (ArrayList<String>) request.getAttribute("txtName");
		ArrayList<String> txtAcc = (ArrayList<String>) request.getAttribute("txtAcc");
	%>

	
	<%	for(int i = 0; i < fileName.size(); i++) { 	%>
			<h3><%= fileName.get(fileName.size() - i - 1) %></h3>
			<h3><%= txtName.get(i) %></h3>
			<h3><%= txtAcc.get(i) %></h3>
	<% 	} %>
	
	<style>
		
	</style>
	
	<img src="C:/Users/aiSchool/git/ClothesMES/src/main/webapp/resources/assets/img/frame521.png" alt="My Image2" width="100" height="200"/>
	<img src="frame2196.png" alt="My Image" width="100" height="200"/>
	<img src="C:\Users\aiSchool\MachineLearning\yolov5\runs\detect\exp2\frame521.png" alt="My Image1" width="100" height="200"/>
</body>
</html>