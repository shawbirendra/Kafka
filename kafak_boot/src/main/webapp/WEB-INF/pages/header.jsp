<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<script>
var myVar = setInterval(myTimer, 1000);

function myTimer() {
    var d = new Date();
    document.getElementById("display").innerHTML = d.toLocaleTimeString();
}
</script>
<body onload="start()">
	<center>
		<h3>Welcome!</h3>
	</center>
	<a href="home" title="home"><img src="<s:url value="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTzOT4uekAcWnhWFJ691CSzeyaw81YVHWYXTes30KLNGqqeGag_Xw"/>" height="40" width="40"></a>
	<div style="float: right;" id="display"></div>
	<hr>
</body>
</html>