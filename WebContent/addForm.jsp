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
<link rel="stylesheet" href="ocfr.css" type="text/css"/>
</head>
<body>
<%@include file="header.jsp" %>
<h1>Add New Member</h1>


<form name=addForm action=addPerson method=post class="form-inline">

 <label>
      Person ID
   </label>
   <input type=text name=personID value="" class="form-control" required/>
   <br />
   
  <label>
      First Name
   </label>
   <input type=text name=firstName value="" class="form-control" required/>
   <br />
   
<label>
      Last Name
   </label>
   <input type=text name=lastName value="" class="form-control" required/>
   <br />

<label>
      Suffix
   </label>
   <input type=text name=suffix value="" class="form-control"/>
   <br />
   
   <label>
      Address
   </label>
   <input type=text name=address value="" class="form-control" required/>
   <br />
   
   <label>
      City
   </label>
   <input type=text name=city value="" class="form-control" required/>
   <br />
   
   <label>
      County
   </label>
   <input type=text name=county value="" class="form-control" required/>
   <br />
   
   <label>
      State
   </label>
   <input type=text name=state value="" class="form-control" maxlength=2 required/>
   <br />
   
   <label>
      Zip
   </label>
   <input type=text name=zip value="" class="form-control" required />
   <br />
   
  
   
   <label for="gender">Gender</label>
    <select class="gender" id="gender" class="form-control" required>
      <option>Male</option>
      <option>Female</option>
      <option>Other</option>
    </select>
    <br />
   
      <label>
      Position
   </label>
   <input type=text name=position value="" class="form-control" required/>
   <br />
   
      <label>
      Work Phone
   </label>
   <input type=text name=workPhone value="" class="form-control" required/>
   <br />
   
     <label>
      Main Phone
   </label>
   <input type=text name=mainPhone value="" class="form-control" required/>
   <br />
   
   <label>
      Email
   </label>
   <input type=text name=email value="" class="form-control" required/>
   <br />
   
   <label>
      Radio Number
   </label>
   <input type=text name=radioNumber value="" class="form-control" required/>
   <br />
   
      <label>
      Station Number
   </label>
   <input type=text name=stationNumber value="" class="form-control" required/>
   <br />
   
    
   
   <label for="active">Active?</label>
    <select class="active" id="active" class="form-control" required>
      <option>Yes</option>
      <option>No</option>
      
    </select>
    <br />
   
   <button type="submit" class="btn btn-primary">Submit</button>
   
</form>
<%@include file="footer.jsp" %>
</body>
</html>