<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Edit Expense</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/main.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<h1>Edit Expense</h1>
		<form:form action="/expenses/${expense.id}" method="post" modelAttribute="expense">	
			<input type="hidden" name="_method" value="put"/>
			<table>
				<tbody>
					<tr>
						<td><form:label path="name">Expense Name:</form:label></td>
						<td><form:input path="name" value="${expense.name}"></form:input></td>
						<td><form:errors path="name" style="color:red"></form:errors></td>
					</tr>
					<tr>
						<td><form:label path="vendor">Vendor:</form:label></td>
						<td><form:input path="vendor" value="${expense.vendor}"></form:input></td>
						<td><form:errors path="vendor" style="color:red"></form:errors></td>
					</tr>
					<tr>
						<td><form:label path="amount">Amount:</form:label></td>
						<td><form:input type="number" path="amount" value="${expense.amount}"></form:input></td>
						<td><form:errors path="amount" style="color:red"></form:errors></td>
					</tr>
					<tr>
						<td><form:label path="description">Description:</form:label></td>
						<td><form:textarea path="description" value="${expense.description}"></form:textarea></td>
						<td><form:errors path="description" style="color:red"></form:errors></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" value="Update"/>
		</form:form>
	</div>
</body> 
</html>