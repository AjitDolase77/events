<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Apply For Event</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
</head>
<body>
<form method="post">
<div class="container">
<%@ include file="header1.jsp" %>
<%@ page import="java.sql.*" %>
<br/>
<input type="hidden" name="eid" class="form-control" value="<% out.println(request.getParameter("id")); %>">
<input type="text" placeholder="Enter Your Name" class="form-control" name="name">
<br/>
<input type="text" placeholder="Enter Your Contct" class="form-control" name="contact">
<br/>
<input type="text" placeholder="Enter Your Email" class="form-control" name="email">
<br/>
<textarea placeholder="Enter Message" class="form-control" name="msg"> </textarea>
<br/>
<a href="view.jsp"><input type="submit" name="sub" value="Apply"></a>
<br/>

</div>
</form>
<%
String str11=request.getParameter("sub");
if(str11!=null){
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/eventmanagement","root","root");
	PreparedStatement prsm=con.prepareStatement("insert into applicant(eid,name,contact,email,msg)values(?,?,?,?,?)");
	prsm.setString(1, request.getParameter("eid").trim());
	prsm.setString(2, request.getParameter("name"));
	prsm.setString(3, request.getParameter("contact"));
	prsm.setString(4, request.getParameter("email"));
	prsm.setString(5, request.getParameter("msg"));
	prsm.executeUpdate();
}
%>




</body>
</html>