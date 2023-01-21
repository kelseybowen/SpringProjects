<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>
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
		<div class="dashboard header">
			<div class="left-header">	
				<h1>Welcome, <c:out value="${user.fName}"></c:out></h1>
				<h4>Books from everyone's shelves:</h4>
			</div>
			<div class="right-header">
				<a href="/logout"><button class="btn btn-dark">Logout</button></a>
				<a href="/books/new"><button class="btn btn-dark">+ Add a book</button></a>
			</div>
		</div>
		<div class="dashboard-main">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Title</th>
						<th scope="col">Author</th>
						<th scope="col">Posted By</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${allBooks}">
						<tr>
							<td><c:out value="${book.id}"/></td>
							<td><a href="/books/${book.id}"><c:out value="${book.title}"/></a></td>
							<td><c:out value="${book.author}"/></td>
							<td><c:out value="${book.user.fName}"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body> 
</html>