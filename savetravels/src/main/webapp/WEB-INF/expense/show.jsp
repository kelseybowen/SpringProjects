<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Show Expense</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/main.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<h1>Expense Details</h1>
		<a href="/expenses">Go Back</a>
		
		<table>
			<tr>
				<td>Expense Name:</td>
				<td>${expense.name}</td>
			</tr>
			<tr>
				<td>Description:</td>
				<td>${expense.description}</td>
			</tr>
			<tr>
				<td>Vendor:</td>
				<td>${expense.vendor}</td>
			</tr>
			<tr>
				<td>Amount Spent:</td>
				<td>${expense.amount}</td>
			</tr>
		</table>
	</div>
</body> 
</html>