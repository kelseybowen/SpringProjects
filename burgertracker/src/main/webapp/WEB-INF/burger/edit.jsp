<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Burger</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<div class="header">
			<h3>Edit Burger</h3>
			<a href="/"><button>Go Back</button></a>
		</div>
		
		<form:form action="/burger/${burger.id}/update" method="post" modelAttribute="burger">	
			<input type="hidden" name="_method" value="put"/>
			<table>
				<tr>
					<td><form:label path="name">Burger Name:</form:label></td>
					<td><form:errors path="name"></form:errors></td>
					<td><form:input path="name" value="${burger.name}"></form:input></td>
				</tr>
				<tr>
					<td><form:label path="restaurant">Restaurant Name:</form:label></td>
					<td><form:errors path="restaurant"></form:errors></td>
					<td><form:input path="restaurant" value="${burger.restaurant}"></form:input></td>
				</tr>
				<tr>
					<td><form:label path="rating">Rating:</form:label></td>
					<td><form:errors path="rating"></form:errors></td>
					<td><form:input type="number" path="rating" value="${burger.rating}"></form:input></td>
				</tr>
				<tr>
					<td><form:label path="notes">Notes:</form:label></td>
					<td><form:errors path="notes"></form:errors></td>
					<td><form:textarea path="notes" value="${burger.notes}"></form:textarea></td>
				</tr>
			</table>
			<button type="submit">Submit</button>
		</form:form>
	</div>
</body> 
</html>