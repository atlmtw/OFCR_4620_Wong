<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="model.Person" %>
<%@ page import="dbHelpers.PersonHelper" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<%
	PersonHelper ph = new PersonHelper();

	ResultSet rs = (ResultSet)request.getAttribute("rs");
	if(rs == null){
		rs = ph.readTable(0);
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Station Reports</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<h1>Station Report</h1>
	
	<form name="stationForm" action="stationReports" method="post" class="form-inline">
		 <label>Filter By Station#</label>
		 <select name="stationlist" class="form-control">
		  <option value="0" Selected>None</option>
		  <option value="1">Station#001</option>
		  <option value="2">Station#002</option>
		  <option value="3">Station#003</option>
		  <option value="4">Station#004</option>
		  <option value="5">Station#005</option>
		  <option value="6">Station#006</option>
		  <option value="7">Station#007</option>
		  <option value="8">Station#008</option>
		 </select>
		 <input type="submit" class="btn btn-default" value="Submit">
 	</form>
	<a href="csvExporter"><input type="button" class="btn btn-default" value="Export to CSV"></a>
	
 	<p>
 		<%=ph.generateReport(rs)%>
 	</p>
 	<%@include file="footer.jsp" %>
</body>
</html>