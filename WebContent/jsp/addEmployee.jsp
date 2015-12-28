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
    <div><p>Add Employee - CITS</p></div>
</div>
<br><br><br><br><br><br>
	<form tag="AddForm" action="addEmployee.do" method="post">
		<div class="input-fields" align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;Employee Id : <input type="text" name="empId" />
			<br>	
			<br>		
			&nbsp;&nbsp;&nbsp;&nbsp;Employee Name : <input type="text"	size="50" name="empName" id="empName"/>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Date of Birth : <input type="text" name="dob" id="dob"/>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Department Id : <input type="text" name="dept" id="dept"  />
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Designation : <input type="text" name="desig" id="desig"  /> 
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Date of Joining : <input type="text" name="dateOfJoin"  id="dateOfJoin" />
            <br>
            <br>
			&nbsp;&nbsp;&nbsp;&nbsp;Email : <input type="text" size="50" name="email" id="email"/>
 			<br>
 			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Phone #: <input type="text" name="phoneNum" id="phoneNum"/>
 			<br>
 			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Address : <input type="text" size="80" name="address" id="address"/>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Manager Id : <input type="text" name="managerId" id="managerId"/>
 
		</div>
		<div align="center">
			<br>
			<br>
			<input type="submit" class="button" value="Add Employee">
		</div>
	</form>
</body>
</html>