<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<div class="header show-header">
			<div class="left-header">
				<h1><c:out value="${book.title}"></c:out></h1>			
			</div>
			<div class="right-header">
				<a href="/books/dashboard"><button class="btn btn-dark">Back to Shelves</button></a>
			</div>
		</div>
		<div class="show-main jumbotron">
			<h3><c:out value="${book.user.fName}"></c:out> read <c:out value="${book.title}"></c:out> by <c:out value="${book.author}"></c:out></h3>
			<h5>Here are <c:out value="${book.user.fName}"></c:out>'s thoughts:</h5>
			
			<div class="review">
				<hr />
				<p><c:out value="${book.thoughts}"></c:out></p>
			</div>
			<div class="actions">
				<a href="/books/${book.id}/edit"><button class="btn btn-dark">Edit</button></a>
				<form action="/books/${book.id}/delete" method="post">
					<input type="hidden" name="_method" value="delete"/>
					<button class="btn btn-dark">Delete</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>