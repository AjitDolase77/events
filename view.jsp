<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Event Management</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
</head>
<body>
<div class="container">
<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<br/>
<br/>
<h2>All Events</h2>
<table class="table">
<tr>
<td>Event Name</td>
<td>Event Date</td>
<td>Event Time</td>
<td>Event Description</td>
<td>Event Fees</td>
<td>Apply</td>
</br>
</tr>


<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/eventmanagement", "root", "root");
PreparedStatement prsm=con.prepareStatement("select * from events");
ResultSet rs11=prsm.executeQuery();
while(rs11.next()){
	try{
	%>
	<tr>
	<td><% out.println(rs11.getString(2)); %></td>
	<td><% out.println(rs11.getString(3)); %></td>
	<td><% out.println(rs11.getString(4)); %></td>
	<td><% out.println(rs11.getString(5)); %></td>
	<td><% out.println(rs11.getString(6)); %></td>
	
	
	</tr>
	
	<%
	}catch(Exception e){
		out.println("" + e);
	}
}
%>
</table>
</div>
</body>
</html>