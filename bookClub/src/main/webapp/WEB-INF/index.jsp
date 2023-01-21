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
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Welcome!</h1>
			<p>Join our growing community.</p>
		</div>
		<div class="main-index">
			<div class="left">
				<form:form action="/register" method="post" modelAttribute="newUser">
					<table>
						<thead>
							<td><h2>Register</h2></td>
						</thead>
						<tbody>
							<tr>
								<td><form:label path="fName">First Name:</form:label></td>
								<td><form:input path="fName"/><form:errors path="fName"/></td>
							</tr>
							<tr>
								<td><form:label path="lName">Last Name:</form:label></td>
								<td><form:input path="lName"/><form:errors path="lName"/></td>
							</tr>
							<tr>
								<td><form:label path="email">Email:</form:label></td>
								<td><form:input path="email"/><form:errors path="email"/></td>
							</tr>
							<tr>
								<td><form:label path="password">Password:</form:label></td>
								<td><form:input path="password" type="password"/><form:errors path="password"/></td>
							</tr>
							<tr>
								<td><form:label path="confirm">Confirm Password:</form:label></td>
								<td><form:input path="confirm" type="password"/><form:errors path="confirm"/></td>
							</tr>
							<tr>
								<td></td>
								<td><button type="submit">Submit</button></td>
							</tr>
						</tbody>
					</table>
				</form:form>
			</div>
			<div class="right">
				<table>
					<thead>
						<h2>Login</h2>			
					</thead>
					<tbody>
						
						<form:form action="/login" method="post" modelAttribute="loginUser">
							<tr>					
								<td><form:label path="email">Email:</form:label></td>
								<td><form:input path="email"/><form:errors path="email"/></td>
							</tr>
							<tr>					
								<td><form:label path="password">Password:</form:label></td>
								<td><form:input path="password" type="password"/><form:errors path="password"/></td>
							</tr>
							<tr>
								<td></td>					
								<td><button type="submit">Submit</button></td>
							</tr>
						</form:form>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body> 
</html>