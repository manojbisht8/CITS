<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CITS Search Employees</title>
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
$(document).ready(function() {
 $("#tablediv").hide();
     $("#showTable").click(function(event){
    	 //alert("clicked button");
    	 //alert(document.getElementById("empId").value);
    	 //var empIdTmp = document.getElementById("empId").value;
    	 //document.getElementById("empIdHdn").value = "Test";
    	  //alert(empId);
    	 // alert($("#empId").val()); 
    	  var empIdTemp = $("#empId").val();
    	  var empNameTemp = $("#empName").val();
    	  var dobTemp = $("#dob").val();
    	  var deptTemp = $("#dept").val();
    	  var desigTemp = $("#designation").val();
    	  var dojTemp = $("#dateOfJoin").val();
    	  //alert(empTemp2);
    	  //alert(empIdTemp+":"+empNameTemp+":"+dobTemp+":"+deptTemp+":"+desigTemp+":"+dojTemp);
           $.get('PopulateSearchTable?empId='+empIdTemp+'&empName='+empNameTemp+'&dob='+dobTemp+'&dept='+deptTemp+'&desig='+desigTemp+'&doj='+dojTemp,function(responseJson) {
        	//   alert("responseJson is: "+responseJson);
            if(responseJson!=null){
                $("#employeetable").find("tr:gt(0)").remove();
                var table1 = $("#employeetable");
                $.each(responseJson, function(key,value) {
                     var rowNew = $("<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td></tr>");
                     //alert("value is: "+value['name']);
                        rowNew.children().eq(0).text(value['employeeId']);
                        rowNew.children().eq(1).text(value['name']);
                        rowNew.children().eq(2).text(value['dob']);
                        rowNew.children().eq(3).text(value['deptName']);
                        rowNew.children().eq(4).text(value['designation']);
                        rowNew.children().eq(5).text(value['dateOfJoin']);
                        rowNew.children().eq(6).text(value['phoneNum']);
                        rowNew.children().eq(7).text(value['emailId']);
                        rowNew.children().eq(8).text(value['address']);
                        rowNew.children().eq(9).text(value['managerName']);
                        rowNew.appendTo(table1);
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
				<p>Employee Search - CITS</p>
			</div>
		</div>
		<br> <br> <br> <br> <br> <br>
		<div id="inputLabel" class="search-fields" align="center">
			Employee Id : <input type="text" name="empId" id="empId" />
			&nbsp;&nbsp;&nbsp;&nbsp;
			Employee Name : <input type="text"		name="empName" id="empName"/> &nbsp;&nbsp;&nbsp;&nbsp;
			Date of Birth : <input type="text" name="dob" id="dob"/>
			<br>
			<br>			
			Department Id: <input type="text" name="dept" id="dept"  />
			&nbsp;&nbsp;&nbsp;&nbsp; 
			Designation : <input type="text" name="designation" id="designation"  /> &nbsp;&nbsp;&nbsp;&nbsp; 
			Date of Joining : <input type="text" name="dateOfJoin"  id="dateOfJoin" />

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
					<th scope="col">Name</th>
					<th scope="col">DoB</th>
					<th scope="col">Department</th>
					<th scope="col">Designation</th>
					<th scope="col">Date of Joining</th>
					<th scope="col">Phone#</th>
					<th scope="col">Email Id</th>
					<th scope="col">Address</th>
					<th scope="col">Manager</th>
				</tr>
			</table>
		</div>
		<input type="hidden" id="empIdHdn" name="empIdHdn">
	</form>
</body>
</html>
