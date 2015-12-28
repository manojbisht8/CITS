<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CITS Training Employees</title>
<link href='http://fonts.googleapis.com/css?family=Oxygen'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="../css/application.css" type="text/css">
</link>
<style type="text/css">
table, td, th {
	border: 1px solid gray;
	font-family: 'Oswald', sans-serif;
	font-size: 1.1em;
}

th {
	background-color: #444;
	color: white;
}
/* body
{
 text-align: center;
} */
.container {
	margin-left: auto;
	margin-right: auto;
	width: 40em;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#tablediv").hide();
						$("#showTable")
								.click(
										function(event) {
											//alert("clicked button");
											//alert(document.getElementById("empId").value);
											//var empIdTmp = document.getElementById("empId").value;
											//document.getElementById("empIdHdn").value = "Test";
											//alert(empId);
											// alert($("#empId").val()); 
											var empIdTemp = $("#empId").val();
								
											//alert(empTemp2);
											//alert(empIdTemp+":"+empNameTemp+":"+dobTemp+":"+deptTemp+":"+desigTemp+":"+dojTemp);
											$
													.get(
															'trainingEmployee?empId='
																	+ empIdTemp
																	,
															function(
																	responseJson) {
																//   alert("responseJson is: "+responseJson);
																if (responseJson != null) {
																	$(
																			"#employeetable")
																			.find(
																					"tr:gt(0)")
																			.remove();
																	var table1 = $("#employeetable");
																	$
																			.each(
																					responseJson,
																					function(
																							key,
																							value) {
																						var rowNew = $("<tr><td></td><td></td><td></td><td></td></td><td></td><td></td></tr>");
																						//alert("value is: "+value['name']);
																						rowNew
																								.children()
																								.eq(
																										0)
																								.text(
																										value['employeeId']);
																						rowNew
																								.children()
																								.eq(
																										1)
																								.text(
																										value['trainingId']);
																						rowNew
																								.children()
																								.eq(
																										2)
																								.text(
																										value['trainingConducted']);
																						rowNew
																								.children()
																								.eq(
																										3)
																								.text(
																										value['trainingConductedDate']);
																						rowNew
																								.children()
																								.eq(
																										4)
																								.text(
																										value['trainingRecieved']);
																						rowNew
																								.children()
																								.eq(
																										5)
																								.text(
																										value['trainingRecievedDate']);
																						
																						rowNew
																								.appendTo(table1);
																					});
																}
															});
											$("#tablediv").show();
										});
					});
</script>
</head>
<!-- <body class="container"> -->
<body>
	<form name="searchForm">
		<div class="header-cont">
			<div>
				<p>Training details of  Employees - CITS</p>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br>
		<div id="inputLabel" class="search-fields" align="center">
			Employee Id : <input type="text" name="empId" id="empId" />
			&nbsp;&nbsp;&nbsp;&nbsp; 

		</div>
		<div align="center">
			<br> <br> <input type="button" class="button"
				value=" Search " id="showTable" />
		</div>
		<div id="tablediv" align="center">
			<br> <br> <br> <br>
			<table cellspacing="0" id="employeetable" width="1100">
				<tr>
					<th scope="col">Employee Id</th>
					<th scope="col">TrainingId</th>
					<th scope="col">TrainingConducted</th>
					<th scope="col">TrainingConductedDate</th>
					<th scope="col">TrainingRecieved</th>
					<th scope="col">TrainingRecievedDate</th>
					


				</tr>
			</table>
		</div>
		<input type="hidden" id="empIdHdn" name="empIdHdn">
	</form>
</body>
</html>
