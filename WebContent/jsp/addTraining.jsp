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
    <div><p>Add Training - CITS</p></div>
</div>
<br><br><br><br><br><br>
	<form tag="AddForm" action="addTraining" method="post">
		<div class="input-fields" align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;Employee Id : <input type="text" name="empId" />
			<br>	
			<br>		
			&nbsp;&nbsp;&nbsp;&nbsp;Training ID : <input type="text"	size="50" name="trainingId" id="trainingId"/>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Training conducted : <input type="text" name="trainingConducted" id="trainingConducted"/>
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Training conducted date : <input type="text" name="trainingConductedDate" id="trainingConductedDate"  />
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Training Received : <input type="text" name="trainingRecieved" id="trainingRecieved"  /> 
			<br>
			<br>
			&nbsp;&nbsp;&nbsp;&nbsp;Training Received date : <input type="text" name="trainingRecievedDate"  id="trainingRecievedDate" />
            <br>
            <br>
		</div>
		<div align="center">
			<br>
			<br>
			<input type="submit" class="button" value="Add Training">
		</div>
	</form>
</body>
</html>