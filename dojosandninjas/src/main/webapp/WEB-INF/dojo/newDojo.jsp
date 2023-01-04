<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Dojo</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>New Dojo</h1>
		</div>
		<div class="main">
			<form:form action="/dojos/new" method="post" modelAttribute="dojo">
				<p>
					<form:label path="name">Name:</form:label>
					<form:errors path="name"></form:errors>
					<form:input path="name"></form:input>
				</p>
				<input type="submit" value="Create" />
			</form:form>
		</div>
	</div>
</body> 
</html>