<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="model.User" %>
    
<% User user = (User) request.getAttribute("user"); %>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Library - Update a Product</title>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<link href="ocfr.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%@include file="header.jsp" %>
<h1>Update User</h1>

<form name=useredit action=userEdit method=post class="form-inline">



<label>
      User ID:
   </label>
   <!--  Changed this field to disabled. Users should not be able to update the ID! -->
   <input type=text name=user_id value="<%= user.getUserID() %>" class="form-control" readonly="readonly" />
   <br />

    <label>
      Username:
   </label>
 
   <input type=text name=username value="<%= user.getUsername() %>" class="form-control" required/>
   <br />

   <label>
     Password:
   </label>
   <input type=text name=password value="Enter New Password Here" class="form-control" required/>
   <br />
   
   <input type=submit name=submit value="Update the User" class="btn btn-primary"/>

</form>
<%@include file="footer.jsp" %>
</body>
</html>