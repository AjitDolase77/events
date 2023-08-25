<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create Event</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<%@ include file="header.jsp"%>

		<br />
		<form method="post">
			<input type="text" placeholder="Enter Your Title"
				class="form-control" name="title"> <br /> <input type="date"
				placeholder="Enter Your Date" class="form-control" name="date">
			<br /> <input type="time" placeholder="Enter Your Time"
				class="form-control" name="time"> <br />
			<textarea placeholder="Enter Event Description" name="desc"
				class="form-control"></textarea>
			<br /> <input type="text" placeholder="Enter Your Fees"
				class="form-control" name="fees"> <br /> <input
				type="submit" name="sub">
		</form>
		<%@ page import="java.sql.*"%>
		<%
		String str11 = request.getParameter("sub");
		if (str11 != null) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost/eventmanagement", "root", "root");
				PreparedStatement prsm = con.prepareStatement("insert into events(name,date,time,description,fees)values(?,?,?,?,?)");
				prsm.setString(1, request.getParameter("title"));
				prsm.setString(2, request.getParameter("date"));
				prsm.setString(3, request.getParameter("time"));
				prsm.setString(4, request.getParameter("desc"));
				prsm.setString(5, request.getParameter("fees"));
				prsm.executeUpdate();
			} catch (Exception e) {
				out.println("" + e);
			}
		%>
		<script>
			alert("Event Create Succesfully")
		</script>
		<%

}

%>




	</div>


</body>
</html>