<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Form</title>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<link href="ocfr.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="header.jsp" %>
<h1>Add New Entry</h1>


<form name=addForm action=addUser method=post class="form-inline" >


 <label>
      User ID:
   </label>
   <input type=text name=user_id value="" class="form-control" required/>
   <br />
   

 <label>
      Username:
   </label>
   <input type=text name=username value="" class="form-control" required/>
   <br />
   
  <label>
      Password:
   </label>
   <input type=text name=password value="" class="form-control" required/>
   <br />
   

   
   <button type="submit" class="btn btn-primary">Submit</button>
   
</form>
<%@include file="footer.jsp" %>
</body>
</html>