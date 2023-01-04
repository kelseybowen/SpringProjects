<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Omikuji Form</title> 
	<link rel="stylesheet"
	href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<h1>Here's Your Omikuji!</h1>
	
	<div class="show-omikuji" class="row">
		<div class="col-sm"></div>
			<div class="col-sm"><h2>In <c:out value="${numSelect}"></c:out> years, you will live in <c:out value="${city}"></c:out> with <c:out value="${person}"></c:out> as your roommate, <c:out value="${hobby}"></c:out> for a living. The next time you see a <c:out value="${living}"></c:out>, you will have good luck. Also, <c:out value="${nice}"></c:out></h2></div>
		<div class="col-sm"></div>
		
	</div>
	<div class="row">
		<div class="col-sm"></div>
		<div class="col-sm"><a href="/omikuji" class="btn btn-outline-primary"class="col-sm">Go Back</a></div>
		<div class="col-sm"></div>
	</div>
	</div>
</body>
</html>