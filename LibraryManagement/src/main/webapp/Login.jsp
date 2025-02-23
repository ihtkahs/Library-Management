<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Login</title>
	</head>
	<body>
		<p><a href="index.jsp">Home</a></p>
		<% String msg = (String) request.getParameter("message");
		   if(msg != null) { %>
		   <p style="color:green"><%= msg %></p>
		<% } %>
		<% String err = (String) request.getAttribute("error");
			if(err != null) { %>
			<p style="color:red"> Error: <%= err %></p>
		<% } %>
		<h2>Login</h2>
		<div class="form">
			<form action="LoginCont">
				<label for="uname">Username</label><br>
				<input type="text" id="uname" name="uname" required><br><br>
				<label for="pass">Password</label><br>
				<input type="password" id="pass" name="pass" required><br><br>
				<input type="submit" value="Login"> <p>New User? <a href="Register.jsp">Register</a>
			</form>
		</div>
	</body>
</html>