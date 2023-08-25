<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove Event</title>
</head>
<body>

<%@ page import="java.sql.*" %>
<%@ include file="header3.jsp" %>
<br/>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/eventmanagement","root","root");
PreparedStatement prsm=con.prepareStatement("delete from events where eid=?");
prsm.setString(1,request.getParameter("a1"));
prsm.executeUpdate();
%>

</body>
</html>