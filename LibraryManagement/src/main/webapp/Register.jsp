<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<p><a href="index.jsp">Home</a></p>
		<h2>Register</h2>
		<% String err = (String) request.getAttribute("error");
			if(err != null) { %>
			<p style="color:red"> Error: <%= err %></p>
		<% } %>
			
		<div class="form">
			<form action="RegisterCont" method="post">
				<label for="fname">Full Name</label><br>
				<input type="text" id="fname" name="fname" required><br><br>
				<label for="mail">Mail ID</label><br>
				<input type="email" id="mail" name="mail" required><br><br>
				<label for="uname">Username</label><br>
				<input type="text" id="uname" name="uname" required><br><br>
				<label for="pass">Password</label><br>
				<input type="password" id="pass" name="pass"><br><br>
				<label for="rpass"> Retype Password</label><br>
				<input type="password" id="rpass" name="rpass"><br><br>
				<p><input type="checkbox" name="status">I agree to the <a href="#">Terms & Conditions</a><br><br>
				<input type="submit" value="Register"> <p>Already a member? <a href="Login.jsp">Login</a></p>
			</form>
		</div>
	</body>
</html>