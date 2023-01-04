<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>Burger Tracker</title> 
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="/webjars/jquery/jquery.min.js"></script> 
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>

<body>
	<div class="container">
		<div class="header">
			<h1>Burger Tracker</h1>
		</div>
		
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Burger Name</th>
					<th>Restaurant Name</th>
					<th>Rating</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="burger" items="${burgers}">
					<tr>
						<td>${burger.name}</td>
						<td>${burger.restaurant}</td>
						<td>${burger.rating}</td>
						<td><a href="/burger/${burger.id}/edit"><button>Edit</button></a> <a href="/burger/${burger.id}/delete"><button>Delete</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="new-burger">
			<h3>Add a Burger:</h3>
			<form:form action="/burger/create" method="post" modelAttribute="burger">	
				<table>
					<tbody>
						<tr>
							<td><form:label path="name">Burger Name:</form:label></td>
							<td><form:input path="name"></form:input></td>
							<td><form:errors path="name" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="restaurant">Restaurant Name:</form:label></td>
							<td><form:input path="restaurant"></form:input></td>
							<td><form:errors path="restaurant" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="rating">Rating:</form:label></td>
							<td><form:input type="number" path="rating"></form:input></td>
							<td><form:errors path="rating" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="notes">Notes:</form:label></td>
							<td><form:textarea path="notes"></form:textarea></td>
							<td><form:errors path="notes" style="color:red"></form:errors></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="Submit"/>
			</form:form>
		</div>
	</div>
</body> 
</html>

