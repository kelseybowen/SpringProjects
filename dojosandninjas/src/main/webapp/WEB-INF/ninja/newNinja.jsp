<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Ninja</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>New Ninja</h1>
		</div>
		<div class="main">
			<form:form action="/ninjas/new" method="post" modelAttribute="ninja">
				<p>
					<form:label path="dojo">Dojo:</form:label>
					<form:select path="dojo">
						<c:forEach var="dojo" items="${dojos}">
							<option value="${dojo.id}">${dojo.name}</option>
						</c:forEach>
					</form:select>
				</p>
				<p>
					<form:label path="firstName">First Name:</form:label>
					<form:errors path="firstName"></form:errors>
					<form:input path="firstName"></form:input>
				</p>
				<p>
					<form:label path="lastName">Last Name:</form:label>
					<form:errors path="lastName"></form:errors>
					<form:input path="lastName"></form:input>
				</p>
				<p>
					<form:label path="age">Age:</form:label>
					<form:errors path="age"></form:errors>
					<form:input path="age"></form:input>
				</p>
				<input type="submit" value="Create" />
			</form:form>
		</div>
	</div>
</body> 
</html>