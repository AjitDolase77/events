<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.4.1/dist/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<br /> <br />
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">

				<div class="panel panel-default">
					<div class="panel-heading">Login Here</div>
					<div class="panel-body">
						<form>
							<input type="text" placeholder="Enter Your Username" name="uname"
								class="form-control" required=""> <br></br> <input
								type="Password" placeholder="Enter Your Password" name="pass"
								class="form-control" required=""> <br></br> <input
								type="submit" value="Login" name="sub">
						</form>
						<%
							String str11 = request.getParameter("sub");
							if (str11 != null) {
								String uname = request.getParameter("uname");
								String pass = request.getParameter("pass");
								if (uname.contentEquals("admin") && pass.contentEquals("admin")) {
									response.sendRedirect("admin.jsp");
								} else {
						%>
						<script>
							alert("Enter Valid Data")
						</script>
						<%
							}

							}
						%>
					</div>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</body>
</html>