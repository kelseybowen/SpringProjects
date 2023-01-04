<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Save Travels</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Save Travels</h1>
		</div>
		
		<div class="main">
			<table class="table table-striped">
				<tr>
					<th>Expense</th>
					<th>Vendor</th>
					<th>Amount</th>
					<th>Actions</th>
				</tr>
				
				<c:forEach var="expense" items="${expenses}">
					<tr>
						<td><a href="/expenses/${expense.id}">${expense.name}</a></td>
						<td>${expense.vendor}</td>
						<td>$${expense.amount}</td>
						<td><a href="/expenses/${expense.id}/edit">Edit</a> | <a href="/expenses/${expense.id}/delete">Delete</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="add">
			<h2>Add an Expense:</h2>
			<form:form action="/expenses/create" method="post" modelAttribute="expense">	
				<table>
					<tbody>
						<tr>
							<td><form:label path="name">Expense Name:</form:label></td>
							<td><form:input path="name"></form:input></td>
							<td><form:errors path="name" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="vendor">Vendor:</form:label></td>
							<td><form:input path="vendor"></form:input></td>
							<td><form:errors path="vendor" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="amount">Amount:</form:label></td>
							<td><form:input type="number" path="amount"></form:input></td>
							<td><form:errors path="amount" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="description">Description:</form:label></td>
							<td><form:textarea path="description"></form:textarea></td>
							<td><form:errors path="description" style="color:red"></form:errors></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="Submit"/>
			</form:form>
		</div>
	</div>
</body>
</html>

