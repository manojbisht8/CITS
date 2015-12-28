<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CITS Home</title>
<link rel="stylesheet" href="../css/application.css" type="text/css">
</link>
<script language="javascript">
function win(add,w,h)
{

window.open(add,"","width="+w+",height="+h+",location=0,directories=0,titlebar=0,menubar=0,toolbar=0,status=0,scrollbars=1,resizable=1,top=5,left=5");
window.location.reload();
}

</script>
</head>
<body>

  <!-- <header class="Header" id="header1" style="color: #0C259B"><img src="../images/header_cits.png" width="1197" height="89" alt=""/></header>-->
  <!-- <header class="Header" id="header1" style="color: #0C259B"><img src="../images/header_cits.png" width="100%" height="100%" alt=""/></header>-->

<div class="header-cont">
    <div><h1>Company Information Tracking System - CITS</h1></div>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div class="nav" align="left">
      <ul>
        <li class="home"><a href="#">Home</a></li>
        <!--  <li class="search"><a href="searchEmployees.jsp" target="_blank">Search Employees</a></li>-->
        <li class="search"><a href="javascript:void(0);"
 name="Search Employees"  title="Search Employees"
 onClick=window.open("employeeSearch.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>Search Employees</a></li>
        <li class="add"><a href="javascript:void(0);"
 name="Search Employees"  title="Search Employees"
 onClick=window.open("addEmployee.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>Add Employees</a></li>        
 <li class="add_evaluation"><a href="javascript:void(0);"
 name="addEvaluation"  title="Add Evaluation"
 onClick=window.open("addEvaluation.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>Add Evaluation</a></li>
 <li class="evaluate"><a href="javascript:void(0);"
 name="Evaluate_Employees"  title="Get Evaluation"
 onClick=window.open("evaluateEmployee.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>View Evaluation</a></li>
 <li class="add_training"><a href="javascript:void(0);"
 name="addTraining"  title="Add Training"
 onClick=window.open("addTraining.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>Add Training</a></li>
 <br>
           <li class="training"><a href="javascript:void(0);"
 name="Training_Details_Of_Employees"  title="Training Employees"
 onClick=window.open("employeeTraining.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>View Training</a></li>
 <li class="training"><a href="javascript:void(0);"
 name="Transfer_Employee"  title="Transfer Employee"
 onClick=window.open("transferEmployee.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>Transfer Employee</a></li>
 <li class="training"><a href="javascript:void(0);"
 name="Delete_Employee"  title="Delete Employee"
 onClick=window.open("deleteEmployee.jsp","Ratting","width=1200,height=900,0,status=0,titlebar=0,menubar=0,toolbar=0")>Delete Employee</a></li>
       <li class="contact"><a href="#">Contact Us</a></li>
      </ul>
    </div>
    <div class="image">
    <img src="../images/company_background.png" width="1200" height="600"  align="middle" alt=""/>
    </div>
</body>
</html>