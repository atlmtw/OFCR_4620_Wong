<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% 
	int attempts=0;
	String message = null;
	try{
		attempts = (Integer)session.getAttribute("attempts");
		message = (String)request.getAttribute("message");
	}catch(Exception e){
		System.out.println("ERROR");
	}
	
	System.out.println("\"Hello");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="styles.css"></link>
<title>Login Page</title>
</head>
<body>
	<h1>Sign-In</h1>
	<p><%
		if(message==null){
			out.print("");
		}
		else{
			out.print(message);
		}
	%> 
	<br>
		You have made: <%=attempts%> attempts
	</p>
	<form name="loginForm" action="loginServlet" method="post" class="form-inline">
		<input type="text" name="username" class="form-control" maxlength="12" required>
		<input type="password" name="password" class="form-control"  maxlength="10" required>
		<input type="submit" name="submit" class="btn btn-primary" value="Login">
	</form>
</body>
</html>