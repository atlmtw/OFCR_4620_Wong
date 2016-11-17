<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HEADER</title>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="ocfr.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
</head>
<body>
<div>
<div id="one" class="logo">
<a href="home.jsp">
<img src="http://classiccitycomputing.com/oconeecountyfire.com/wp-content/uploads/2014/04/OCFireLogo.png" />
</a>
</div>
<div class="container">

          <div id="two" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
              <li><a href="addForm.jsp"><strong>Add Members</strong></a></li>
              <li><a href="read"><strong>Member Listings</strong></a></li>
              <li><a href="UserRead"><strong>User Listings</strong></a></li>
              <li><a href="stationReports.jsp"><strong>Station Report</strong></a></li>
              <li><a href="expReports.jsp"><strong>Expired Certificates Report</strong></a></li>
              <li><a href="loginServlet?logout=true"><strong>Logout</strong></a></li>
            </ul>
          </div><!--/.nav-collapse -->
</div><!--/.container-fluid -->
</div>
</body>
</html>