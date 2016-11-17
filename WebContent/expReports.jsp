<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.PersonCertificate" %>
<%@ page import="dbHelpers.PersonCertificateHelper" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	PersonCertificateHelper pch = new PersonCertificateHelper();
	String message = (String)request.getAttribute("message");
	ResultSet rs = (ResultSet)request.getAttribute("rs");
	if(rs == null){
		rs = pch.readAll(0);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link rel="stylesheet" href="ocfr.css" type="text/css" />
<title>Expired Reports</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<h1>Expired Certificates Report</h1>
	
	<form name="expiredForm" action="expiredServlet" method="post" class="form-inline">
		 <label>Filter By Certificate</label>
		 <select name="certificateslist" class="form-control">
		  <option value="0" Selected>None</option>
		  <option value="107">Firefighter I Academy</option>
		  <option value="107">Firefighter I State of GA</option>
		  <option value="109">CPR for the Professional Rescuer</option>
		  <option value="111">Firefighter II</option>
		  <option value="112">Fire Inspector</option>
		  <option value="113">EMT</option>
		  <option value="114">Hazardous Material</option>
		  <option value="115">Fire Prevention</option>
		  <option value="116">Fire Apparatus Management</option>
		  <option value="117">Fire Technology</option>
		  <option value="118">Ambulance Driver's License</option>
		  <option value="119">Fire Investigation</option>
		  <option value="120">Fire Science</option>
		  <option value="122">Auto Extrication</option>
		  <option value="123">Volunteer Firefighter</option>
		  <option value="124">Confined Space</option>
		  <option value="125">Structural Collapse</option>
		  <option value="126">Rescue Technician</option>
		  <option value="127">Fire Instructor</option>
		 </select>
		 <input type="submit" class="btn btn-default" value="Submit">
 	</form>
 	
	<p>
		<%=pch.tableGenerator(rs) %>
	</p>
	<%@include file="footer.jsp" %>
</body>
</html>