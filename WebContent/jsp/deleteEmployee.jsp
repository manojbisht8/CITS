<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CITS Delete Employee</title>
<link rel="stylesheet" href="../css/application.css" type="text/css">
<script type="text/javascript">

/*Function to validate inputs.*/
function checkInput(){
	 if(document.getElementById("empId").value == ""){
		 alert("Please enter Employee Id.");		
	 }else{
		 //alert("Submitting form.")
		 document.getElementById("deleteForm").submit();
	 }
 }
</script>
</head>
<body>
<div class="header-cont">
    <div><p>Delete Employee - CITS</p></div>
</div>
<br><br><br><br><br><br>
	<form tag="DeleteForm" id="deleteForm" action="deleteEmployee.do" method="post">
		<div class="input-fields" align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;Employee Id : <input type="text" name="empId" id="empId" size="40" placeholder="Enter existing Employee Id" />
			<br>	
			<br>				
 
		</div>
		<div align="center">
			<br>
			<br>
			<input type="submit" class="button" value="Delete Employee" onclick="checkInput();return false">
		</div>
	</form>
</body>
</html>