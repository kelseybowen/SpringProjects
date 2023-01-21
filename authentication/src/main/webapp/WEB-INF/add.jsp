<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Books</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/css/style.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header add-header">
			<div class="left-header">
				
			</div>
			<div class="right-header">
				<a href="/books/dashboard"><button class="btn btn-dark">Back to Shelves</button></a>
			</div>
		</div>
		<div class="main-add jumbotron">
			<form:form action="/books/create" method="post" modelAttribute="book">
				<table class="table">
					<thead>
						<tr><th colspan="2"><h1>Add Book to Shelf</h1></th></tr>
					</thead>
					<tbody>
						<tr>
							<td><form:label path="title">Title</form:label></td>
							<td><form:input path="title"/></td>
							<td><form:errors path="title" class="errors"/></td>
						</tr>
						<tr>
							<td><form:label path="author">Author</form:label></td>
							<td><form:input path="author"/></td>
							<td><form:errors path="author" class="errors"/></td>
						</tr>
						<tr>
							<td><form:label path="thoughts">My Thoughts</form:label></td>
							<td><form:textarea path="thoughts"/></td>
							<td><form:errors path="thoughts" class="errors"/></td>
						</tr>
					</tbody>
				</table>
				<div class="button-container">
					<button class="btn btn-dark" type="submit">Submit</button>
				</div>
			</form:form>
		</div>
	</div>
</body>
</html>