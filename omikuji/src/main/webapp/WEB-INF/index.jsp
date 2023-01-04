<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> <!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Omikuji Form</title> 
	<link rel="stylesheet"
	href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<h1>Send an Omikuji!</h1>
		<div class="main-content">
			<form action="/submitform" method="post">
				<label for="numSelect">Pick any number from 5 to 25</label>
				<div></div>
				<select name="numSelect" required>
					<option value="select">Select</option>
					<c:forEach var="num" items="${numberSelect}">
						<option value="${num}"><c:out value="${num}"></c:out></option>
					</c:forEach>
				</select>
				<div></div>
				<label for="city">Enter the name of a city</label>
				<div></div>
				<input type="text" name="city" required/>
				<div></div>
				<label for="person">Enter the name of any real person</label>
				<div></div>
				<input type="text" name="person" required/>
				<div></div>
				<label for="hobby">Enter professional endeavor or hobby</label>
				<div></div>
				<input type="text" name="hobby" required/>
				<div></div>
				<label for="living">Enter any type of living thing</label>
				<div></div>
				<input type="text" name="living" required/>
				<div></div>
				<label for="nice">Say something nice to someone</label>
				<div></div>
				<textarea name="nice" cols="30" rows="5" required></textarea>
				<div></div>
				<p>Send and show a friend</p>
				<div></div>
				<input type="submit" value="Send" class="btn btn-outline-primary"/>
			</form>
		</div>
	</div>
</body> 
</html>