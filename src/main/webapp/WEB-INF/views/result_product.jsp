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
	

	
	
	<img src="resources/assets/img/frame521.png" alt="My Image"/>
	<img src="C:\resource\frame521.png" alt="My Image"/>
	
</body>
</html>