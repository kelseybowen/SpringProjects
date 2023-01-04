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
<title>Edit</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="header">
			<h1>Edit</h1>
		</div>
		<div class="body">
			<form:form action="/languages/${language.id}" method="post"
				modelAttribute="language">
				<input type="hidden" name="_method" value="put"/>
				<table>
					<tbody>
						<tr>
							<td><form:label path="name">Name:</form:label></td>
							<td><form:input path="name" value="${language.name}"></form:input></td>
							<td><form:errors path="name" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="creator">Creator:</form:label></td>
							<td><form:input path="creator" value="${language.creator}"></form:input></td>
							<td><form:errors path="creator" style="color:red"></form:errors></td>
						</tr>
						<tr>
							<td><form:label path="currentVersion">Version:</form:label></td>
							<td><form:input path="currentVersion"
									value="${language.currentVersion}"></form:input></td>
							<td><form:errors path="currentVersion" style="color:red"></form:errors></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" value="Update" />
			</form:form>
		</div>
	</div>
</body>
</html>