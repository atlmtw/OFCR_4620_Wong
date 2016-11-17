<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    String table = (String) request.getAttribute("table");
%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Read Table JSP</title>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<link href="ocfr.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="header.jsp" %>

<h1>Member Listings</h1>

<%= table %>
<br />
<a href="addForm.jsp">Add</a>
<%@include file="footer.jsp" %>
</body>
</html>