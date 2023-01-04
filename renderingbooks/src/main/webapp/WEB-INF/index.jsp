<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Books</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<h1>Books</h1>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>ID</th>
					<th>Title</th>
					<th>Language</th>
					<th># of Pages</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="oneBook" items="${books}">
				<tr>
					<td><c:out value="${oneBook.id}"></c:out></td>
					<td><a href="/books/${oneBook.id}"><c:out value="${oneBook.title}"></c:out></a></td>
					<td><c:out value="${oneBook.language}"></c:out></td>
					<td><c:out value="${oneBook.numberOfPages}"></c:out></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body> 
</html>