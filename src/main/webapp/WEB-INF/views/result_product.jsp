<%@page import="org.springframework.util.StringUtils"%>
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
	
	
	
	<table border="1" bordercolor="black" height="300" width ="1000px" align = "center" style = "font-size:20px; border-style:solid;">
    	<tr bgcolor="white" align ="center">
			<p><td colspan = "3" span style="color:black; font-size:25px;">AI 분류 결과</td></p>
    	</tr>
    	
    	<tr align = "center" bgcolor="#FFFFF0">	
			<td>사진</td>
			<td style = "width:800px">제품코드</td>
			<td style = "width:500px">정확도</td>
	    </tr>
	
		
		<%	for(int i = 0; i < fileName.size(); i++) { 	
				String imgN = fileName.get(i);
				String im = imgN.substring(0, imgN.length()-4) + ".png";
				System.out.println(im);
				
				//
				String a[] = {"#FFFAFA", "#F0FFF0", "#F5FFFA", "#F0FFFF", "#F0F8FF", "#F8F8FF"};
		%>
			<tr>
				<td><img src="resources/assets/img/<%=im %>" alt="My Image"/></td>
				<td bgcolor = <%=a[i % 6]%> style = "text-align: center"><%= txtName.get(fileName.size() - i - 1) %></td>
				<td bgcolor = <%=a[i % 6]%> style = "text-align: center"><%= txtAcc.get(fileName.size() - i - 1) %></td>
			</tr>
		<% 	} %>
	</table>

	

	
	<!-- 
	<img src="resources/assets/img/frame521.png" alt="My Image"/>
	<img src="resources/assets/img/frame2195.png" alt="My Image"/>
	<img src="C:\resource\frame521.png" alt="My Image"/>
	 -->
	
</body>
</html>