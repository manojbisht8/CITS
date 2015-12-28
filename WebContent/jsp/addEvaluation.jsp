<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CITS Add Employee</title>
<link rel="stylesheet" href="../css/application.css" type="text/css">
</link>
</head>
<body>
<div class="header-cont">
    <div><p>Add Evaluation - CITS</p></div>
</div>
<br><br><br><br><br><br>
	<form tag="AddForm" action="addEvaluation" method="post">
		<div class="input-fields" align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;Employee Id : <input type="text" name="empId" />
			<br>	
			<br>		
			&nbsp;&nbsp;&nbsp;&nbsp;Manager ID : <input type="text"	size="50" name="managerId" id="managerId"/>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Proactiveness : <input type="text" name="proactiveness" id="proactiveness"/>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Communication : <input type="text" name="communication" id="communication"  />
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Team Work : <input type="text" name="teamwork" id="teamwork"  /> 
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Leadership Skills : <input type="text" name="leadership"  id="leadership" />
            <br>
            <br>
		<!-- <input type="button" class="button" value="Add Employee" onclick="addEmployeeDetails()"/> -->
		</div>
		<div align="center">
			<br>
			<br>
			<input type="submit" class="button" value="Evaluate Employee">
		</div>
	</form>
</body>
</html>