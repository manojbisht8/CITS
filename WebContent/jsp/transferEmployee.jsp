<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CITS Transfer Employee</title>
<link rel="stylesheet" href="../css/application.css" type="text/css">
</link>
<script type="text/javascript">
/*Function to validate inputs.*/
function checkInput(){
	 if(document.getElementById("empId").value == ""){
		 alert("Please enter Employee Id.");		
	 }else if(document.getElementById("dept").value == ""){
		 alert("Please enter new Department Id.");
	 }else{
		 //alert("Submitting form.")
		 document.getElementById("tfrFormId").submit();
	 }
 }

</script>
</head>
<body>
<div class="header-cont">
    <div><p>Transfer Employee - CITS</p></div>
</div>
<br><br><br><br><br><br>
	<form id="tfrFormId" tag="TransferForm" action="transferEmployee.do" method="post">
		<div class="input-fields" align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;Employee Id : <input type="text" name="empId" id="empId" size="40" placeholder="Enter existing Employee Id" />
			<br>	
			<br>		
			&nbsp;&nbsp;&nbsp;&nbsp;New Department Id : <input type="text" name="dept" id="dept"  />
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;New Department Address : <input type="text" size="80" name="address" id="address"/>
			<br>
			<br>	
 
		</div>
		<div align="center">
			<br>
			<br>
			<input type="submit" class="button" value="Transfer Employee" onclick="checkInput();return false">
		</div>
	</form>
</body>
</html>