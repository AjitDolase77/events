<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Data</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
</head>
<body>
<div class="container">

<%@ page import="java.sql.*" %>
<%@ include file="header2.jsp" %>
<br/>

<br/>
<%	
String str11=request.getParameter("a1");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/eventmanagement","root","root");
PreparedStatement prsm=con.prepareStatement("select * from events where eid=?");
prsm.setString(1,str11);
ResultSet rs11=prsm.executeQuery();
while(rs11.next()){
%>	
	<form method="post">
	<input type="hidden" name="eid" value="<%out.println(rs11.getString(1));%>">
	<br/>
	<input type="text" value="<% out.println(rs11.getString(2)); %>" class="form-control" name="n1">
	<br/>
	<input type="text" value="<% out.println(rs11.getString(3)); %>" class="form-control" name="d1">
	<br/>
	<input type="text" value="<% out.println(rs11.getString(4)); %>" class="form-control" name="t1">
	<br/>
	<textarea  class="form-control" name="s1"><% out.println(rs11.getString(5));%></textarea>
    <br/>
    <input type="text" value="<% out.println(rs11.getString(6)); %>" class="form-control" name="f1">
	<br/>
	<input type="submit" value="Update"  name="update" >
	<br/>
	</form>	
<%	
}
%>
<%
	String str1=request.getParameter("update");
	if(str1!=null){
		PreparedStatement prstm=con.prepareStatement("update events set name=?, date=?, time=?, description=?, fees=? where eid=?");
		prstm.setString(1, request.getParameter("n1"));
		prstm.setString(2, request.getParameter("d1"));
		prstm.setString(3, request.getParameter("t1"));
		prstm.setString(4, request.getParameter("s1"));
		prstm.setString(5, request.getParameter("f1"));
		prstm.setString(6, request.getParameter("a1"));
		prstm.executeUpdate();

	
%>
		<script>alert("Event update Succesfully")</script>
		
<%
	
	}
%>
</div>
</body>
</html>





















