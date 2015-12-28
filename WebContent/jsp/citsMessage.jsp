<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CITS Status Message</title>
<link rel="stylesheet" href="../css/application.css" type="text/css">
</link>
</head>
<body>
<div class="header-cont">
    <div><p>Status Message - CITS</p></div>
</div>
<br><br><br><br><br><br>
<div class="message">
<p align="center" style="font-size: 1.5em;font-weight: bold;"><%= request.getAttribute("message") %> </p>
</div>

</body>
</html>