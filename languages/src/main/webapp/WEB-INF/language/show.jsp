<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Language</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<div class="header">
			<a href="/languages">Dashboard</a>
		</div>
		<div class="body">
			<p>${language.name}</p>
			<p>${language.creator}</p>
			<p>${language.currentVersion}</p>
			<a href="/languages/${language.id}/edit"><input type="submit" value="Edit" /></a>
			<form action="/languages/${language.id}" method="post"><input type="hidden" name="_method" value="delete"> <input type="submit" value="Delete"></form>
		</div>
	</div>
</body> 
</html>