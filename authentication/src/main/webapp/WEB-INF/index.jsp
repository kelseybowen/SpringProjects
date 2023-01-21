<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Login & Registration</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<div class="main-header header jumbotron">
			<h1 class="display-4">Book Club</h1>
			<p class="lead">A place for friends to share thoughts on books.</p>
		</div>
		<div class="main index">
			<div class="left jumbotron">
				<form:form action="/register" method="post" modelAttribute="newUser">
					<table class="table">
						<thead>
							<tr>							
								<th colspan="2"><h2>Register</h2></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><form:label path="fName">First Name:</form:label></td>
								<td><form:input path="fName"/><form:errors path="fName" class="errors"/></td>
							</tr>
							<tr>
								<td><form:label path="lName">Last Name:</form:label></td>
								<td><form:input path="lName"/><form:errors path="lName" class="errors"/></td>
							</tr>
							<tr>
								<td><form:label path="email">Email:</form:label></td>
								<td><form:input path="email"/><form:errors path="email" class="errors"/></td>
							</tr>
							<tr>
								<td><form:label path="password">Password:</form:label></td>
								<td><form:input path="password" type="password"/><form:errors path="password" class="errors"/></td>
							</tr>
							<tr>
								<td><form:label path="confirm">Confirm Password:</form:label></td>
								<td><form:input path="confirm" type="password"/><form:errors path="confirm" class="errors"/></td>
							</tr>
						</tbody>		
					</table>
					<div class="button-container">
						<button class="btn btn-dark" type="submit">Submit</button>
					</div>
				</form:form>
			</div>
			<div class="right jumbotron">
				<form:form action="/login" method="get" modelAttribute="loginUser">
					<table class="table">
						<thead>
							<tr>
								<th colspan="2"><h2>Login</h2></th>
							</tr>
						</thead>
						<tbody>
							<tr>					
								<td><form:label path="email">Email:</form:label></td>
								<td><form:input path="email"/><form:errors path="email" class="errors"/></td>
							</tr>
							<tr>					
								<td><form:label path="password">Password:</form:label></td>
								<td><form:input path="password" type="password"/><form:errors path="password" class="errors"/></td>
							</tr>
						</tbody>
					</table>
					<div class="button-container">
						<button class="btn btn-dark" type="submit">Submit</button>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body> 
</html>