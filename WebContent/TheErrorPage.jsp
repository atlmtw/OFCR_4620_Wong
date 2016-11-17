<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<html>
<head>
<title>Show Error Page</title>
</head>
<body>
<pre>
	Error Stack Trace<% exception.printStackTrace(response.getWriter()); %>
</pre>
<h1>Opps...</h1>
<p>Sorry, an error occurred.</p>
<p>Hope you find out what happened!<br>Make sure to look at the console!</p>
<p>Here's a personal message from our CEO: <br>
<img src="http://static1.fjcdn.com/comments/Tfw+i+actually+like+these+headphones+_25c06fcf25b6ce30e86e773ed2f45d8c.png">
</p>
</body>
</html>