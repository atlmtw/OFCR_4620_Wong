<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
</head>
<body style="background-color: lightgray" id="homepage">
	<div style="position: relative; height: 100px">
	<div> <%@include file="header.jsp" %> </div>
	<div id="indent">
	<h1>Oconee County Fire Rescue</h1>
	<p>Using the menu above, you may navigate through the Certifications Database.</p>
	<p>Please contact us at admin@ocfr.com should you need assistance.</p>  
	</div>
	<div style="height:130px">
	
	</div>
	
	
	<div class=".col-*-offset-0">
	<%@include file="footer.jsp" %>
	</div>

</div>
</body>
</html>