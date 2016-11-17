<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="model.Person" %>
    <% Person person = (Person) request.getAttribute("person"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Member Profile</title>
</head>
<body>

	<%@include file="header.jsp" %>
	
	<h1>Member Profile</h1>
	<form name=edit action=edit method=post class="form-inline" >
	
	<label>
      Person ID:
   </label>
   <input type=text name=personID value="<%= person.getPersonID() %>" class="form-control" readonly />
   <br />
	
	<label>
      First Name:
   </label>
   <input type=text name=fName value="<%= person.getfName() %>" class="form-control" />
   <br />
   
   <label>
      Last Name:
   </label>
   <input type=text name=lName value="<%= person.getlName() %>" class="form-control"/>
   <br />
   
   <label>
      Position:
   </label>
   <input type=text name=position value="<%= person.getPosition() %>" class="form-control"/>
   <br />
   
   <label>
      Suffix:
   </label>
   <input type=text name=suffix value="<%= person.getSuffix() %>" class="form-control"/>
   <br />
   
   <label for="gender">Gender</label>
    <select name=gender class="gender" id="gender" class="form-control">
      <option>Male</option>
      <option>Female</option>
      <option>Other</option>
    </select>
   <br> 
   
   <label>
      Street Address:
   </label>
   <input type=text name=streetAddress value="<%= person.getStreetAddress() %>" class="form-control"/>
   <br />
   
      <label>
      City:   </label>
   <input type=text name=city value="<%= person.getCity() %>" class="form-control"/>
   <br />
   
     <label>
      County:
   </label>
   <input type=text name=county value="<%= person.getCounty() %>" class="form-control"/>
   <br /> 
   
    <label>
      State:
   </label>
   <input type=text name=state value="<%= person.getState() %>" class="form-control"/>
   <br /> 
   
   <label>
      Zip Code:
   </label>
   <input type=text name=zipCode value="<%= person.getZipCode()%>" class="form-control"/>
   <br /> 
   
   <label>
      WorkPhone:   </label>
   <input type=text name=wPhone value="<%= person.getwPhone() %>" class="form-control"/>
   <br /> 
   
    <label>
      Main Phone:
   </label>
   <input type=text name=mPhone value="<%= person.getmPhone() %>" class="form-control"/>
   <br /> 
   
   <label>
      Email Address:
   </label>
   <input type=text name=email value="<%= person.getEmail() %>" class="form-control"/>
   <br /> 
   
    <label>
      Radio #:
   </label>
   <input type=text name=radioNum value="<%= person.getRadioNum() %>" class="form-control"/>
   <br /> 
   
	<label>
      Station #:
   </label>
   <input type=text name=stationNum value="<%= person.getStationNum() %>" class="form-control"/>
   <br /> 
   
    <label>
      Active:    </label>
   <input type=text name=pActive value="<%= person.getpActive() %>" class="form-control"/>
   <br /> 
      
   
   <input type=submit name=submit value="Update Profile" class="btn btn-primary"/>

</form>
	
	
	<%@include file="footer.jsp" %>

</body>
</html>