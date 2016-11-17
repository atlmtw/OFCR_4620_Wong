<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.ArrayList" %>    
<%@ page import="model.Certification" %>
<%@ page import="dbHelpers.PersonHelper" %>
<%@ page import="model.Person" %>
    
<%
	ArrayList<Certification> alc = (ArrayList<Certification>)request.getAttribute("alc");
	int person_id = (Integer)request.getAttribute("person_id");
	
	PersonHelper ph = new PersonHelper();
	Person person = ph.doReadOne(person_id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type=text/css>
body{
	padding-left:20px
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<title>Profile Page</title>
</head>
<body>
<%@include file="header.jsp" %>
	<h1>Profile for <%=person.getfName() + " " + person.getlName()%></h1>
	<p>
		Position: <%=person.getPosition() %>
		<br>
		Gender: <%=person.getGender() %>
		<br>
		Street Address: <%=person.getStreetAddress()%>
		<br>
		City: <%=person.getCity() %>
		<br>
		County: <%=person.getCounty() %>
		<br>
		State: <%=person.getState() %>
		<br>
		Zip Code: <%=person.getZipCode() %>
		<br>
		Work Phone: <%=person.getwPhone() %>
		<br>
		Main Phone: <%=person.getmPhone() %>
		<br>
		Email: <%=person.getEmail() %>
		<br>
		Radio #: <%=person.getRadioNum() %>
		<br>
		Station #: <%=person.getStationNum() %>
		<br>
		Active?: <%=person.getpActive() %>
	</p>
	<p>
		<%
		for(int i = 0; i<alc.size(); i++){
			Certification cert = alc.get(i);
		%>
		<h2>Certificate ID: <%=cert.getCertID() %></h2>
		Certificate Name: <%=cert.getCertName() %>
		<br>
		Certificate Sponsor: <%=cert.getCertSponsor() %>
		<br>
		Certificate Expiration: <%=cert.getCertExpiry() +" years"%>
	
		<form action="deleteCertificate" method="post" class="form-inline">
		<input type="hidden" name="person_id" value="<%=person.getPersonID()%>">
		<input type="hidden" name="cert_id" value="<%=cert.getCertID()%>">
		<input type="submit" name="delete" class="btn btn-default" value="Delete Certificate">
		</form>
		
		<form action="updateFormCertificate" method="post" class="form-inline">
		<input type="hidden" name="person_id" value="<%=person.getPersonID()%>">
		<input type="hidden" name="cert_id" value="<%=cert.getCertID()%>">
		<input type="submit" name="update" class="btn btn-default" value="Update Certificate">
		</form>
	
		<% 
		out.println(" ");
		} %>
	</p>
	<form action="addCertForPerson.jsp" method="post" class="form-inline">
		<input type="hidden" name="person_id" value="<%=person.getPersonID()%>">
		<input type="submit" class="btn btn-primary" value="Add Certificate For <%=person.getfName()%> <%=person.getlName()%>">
	</form>
<%@include file="footer.jsp" %>
</body>
</html>