<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.Certification" %>
<%
	Certification cert = (Certification) request.getAttribute("cert");
	int person_id = (Integer) request.getAttribute("person_id");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Certification Form</title>
</head>
<body>
<%@include file="header.jsp" %>
	<h1>Update Certification Form</h1>
	<form name="updateCertForm" action="updateCertificate" method="post" class="form-inline">
		<input type=text name="cert_id" value="<%=cert.getCertID() %>" class="form-control" readonly>
		<br>
		<input type=text name="cert_name" value="<%=cert.getCertName()%>" class="form-control" >
		<br>
		<input type=text name="cert_sponsor" value="<%=cert.getCertSponsor()%>" class="form-control" >
		<br>
		<input type=text name="cert_expiry_type" value="<%=cert.getCertExpiry()%>" class="form-control" >
		<input type=hidden name="person_id" value="<%=person_id %>">
		<br>
		<input type="submit" class="btn btn-default" value="Update Certificate">
	</form>
<%@include file="footer.jsp" %>
</body>
</html>