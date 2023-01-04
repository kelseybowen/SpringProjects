<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Languages</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Languages</h1>
		</div>
		<div class="body">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Name</th>
						<th scope="col">Creator</th>
						<th scope="col">Version</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="language" items="${languages}">
						<tr>
							<td><a href="/languages/${language.id}">${language.name}</a></td>
							<td>${language.creator}</td>
							<td>${language.currentVersion}</td>
							<td><a href="/languages/${language.id}/edit"><input type="submit" value="Edit" /></a> | <form action="/languages/${language.id}" method="post"><input type="hidden" name="_method" value="delete"> <input type="submit" value="Delete"></form></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<form:form action="/languages/create" method="post" modelAttribute="language">
				<table>
					<tbody>
						<tr>
							<td><form:label path="name">Name:</form:label></td>
							<td><form:input path="name"></form:input></td>
							<td><form:errors path="name" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="creator">Creator:</form:label></td>
							<td><form:input path="creator"></form:input></td>
							<td><form:errors path="creator" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="currentVersion">Version:</form:label></td>
							<td><form:input path="currentVersion"></form:input></td>
							<td><form:errors path="currentVersion" style="color:red"></form:errors></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="Save"/>
			</form:form>
		</div>
	</div>
</body>
</html>