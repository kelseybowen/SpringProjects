<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>hello world</title>
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	
	<h1>Fruit Store</h1>
	<table class="table table-light">
		<thead>
			<th>Name</th>
			<th>Price</th>
		</thead>
		<tbody>
			<c:forEach var="oneFruit" items="${fruitsFromController}">
				<tr>
					<td><c:out value="${oneFruit.name}"></c:out></td>
					<td><c:out value="${oneFruit.price}"></c:out></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>

