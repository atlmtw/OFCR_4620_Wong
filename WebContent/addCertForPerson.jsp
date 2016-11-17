<%@ page errorPage="TheErrorPage.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<% //fiix this below
	int person_id = Integer.parseInt(request.getParameter("person_id"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="bootstrap/bootstrap.min.js"></script>
<link rel="stylesheet" href="ocfr.css" type="text/css"/>
<title>Add Certificate</title>
<script type="text/javascript">
	var certificates = [
	 {cid:107, cn:"Firefighter I Academy", cs:"OCFR", cet:99},
	 {cid:108, cn:"Firefighter I State of GA", cs:"GPSTC", cet:2},
	 {cid:109, cn:"CPR for the Professional Rescuer", cs:"American Heart Assoc.", cet:2},
	 {cid:111, cn:"Firefighter II", cs:"OCFR", cet:2},
	 {cid:112, cn:"Fire Inspector", cs:"GPSTC", cet:2},
	 {cid:113, cn:"EMT", cs:"Department of State Health Services", cet:2},
	 {cid:114, cn:"Hazardous Material", cs:"GPSTC", cet:2},
	 {cid:115, cn:"Fire Prevention", cs:"GPSTC", cet:2},
	 {cid:116, cn:"Fire Apparatus Management", cs:"GPSTC", cet:2},
	 {cid:117, cn:"Fire Technology", cs:"GPSTC", cet:2},
	 {cid:118, cn:"Ambulance Driver's License", cs:"Georgia Department of Public Health", cet:10},
	 {cid:119, cn:"Fire Investigation", cs:"GPSTC", cet:4},
	 {cid:120, cn:"Fire Science", cs:"GPSTC", cet:4},
	 {cid:121, cn:"Swift Water Rescue", cs:"GPSTC", cet:4},
	 {cid:122, cn:"Auto Extrication", cs:"GPSTC", cet:4},
	 {cid:123, cn:"Volunteer Firefighter", cs:"OCFR", cet:4},
	 {cid:124, cn:"Confined Space", cs:"GPSTC", cet:4},
	 {cid:125, cn:"Structural Collapse", cs:"GPSTC", cet:4},
	 {cid:126, cn:"Rescue Technician", cs:"GPSTC", cet:4},
	 {cid:127, cn:"Fire Instructor", cs:"GPSTC", cet:4}
	 	];
	 				   
	
	function editCertInputs(){
		var x = document.getElementById("cert_id").value;
		
		for(i = 0; i<certificates.length; i++){
			if(certificates[i].cid == x){
				document.getElementById("cert_name").value= certificates[i].cn;
				document.getElementById("cert_sponsor").value= certificates[i].cs;
				document.getElementById("cert_exp").value= certificates[i].cet;
			}
		}
	}
	
	function validate(){
		if(document.getElementById("cert_id").value == 0){
			   alert("You must choose another option");
			   return false;
			}
	}
</script>
</head>
<body>
	<h1>Add Certificate</h1>
	<label>Certificate ID</label>
	<form id="addCertForm" name="addCertForm" action="addCertServlet" method="post" class="form-inline" onsubmit="return validate()">
		<select id="cert_id" name="cert_id" class="form-control" onchange="editCertInputs()">
		  <option value="0">Choose an id</option>	 
		  <option value="107">107</option>
		  <option value="108">108</option>
		  <option value="109">109</option>
		  <option value="111">111</option>
		  <option value="112">112</option>
		  <option value="113">113</option>
		  <option value="114">114</option>
		  <option value="115">115</option>
		  <option value="116">116</option>
		  <option value="117">117</option>
		  <option value="118">118</option>
		  <option value="119">119</option>
		  <option value="120">120</option>
		  <option value="122">122</option>
		  <option value="123">123</option>
		  <option value="124">124</option>
		  <option value="125">125</option>
		  <option value="126">126</option>
		  <option value="127">127</option>
		</select>
		<br>
		<label>Certificate Name</label>
		<input type=text id="cert_name" name="cert_name" value="" class="form-control" readonly >
		<br>
		<label>Certificate Sponsor</label>
		<input type=text id="cert_sponsor" name="cert_sponsor" value="" class="form-control" readonly>
		<br>
		<label>Certificate Expiration</label>
		<input type=text id="cert_exp" name="cert_exp" value="" class="form-control" readonly>
		<input type=hidden name="person_id" value="<%=person_id %>">
		<br>
		<input type="submit" value="Add Certificate" class="btn btn-default">
	</form>
</body>
</html>