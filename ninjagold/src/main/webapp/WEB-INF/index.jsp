<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"> 
	<title>Ninja Gold</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
	<script src="/webjars/jquery/jquery.min.js"></script> 
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 
</head>
<body>
	<div class="container">
		<div class="header">		
			<h1>Your Gold: <c:out value="${gold}"></c:out></h1>
		</div>
		<div class="main">
			<div class="row">
				<div class="col-2">
					<h2>Farm</h2>
					<p>earns 10-20 gold</p>
					<form action="/find" method="post">
						<input type="hidden" name="farm" value="farm"/>
						<button>Find Gold!</button>
					</form>
				</div>
				<div class="col-2">
					<h2>Cave</h2>
					<p>earns 5-10 gold</p>
					<form action="/find" method="post">
						<input type="hidden" name="cave" value="cave"/>
						<button>Find Gold!</button>					
					</form>
				</div>
				<div class="col-2">
					<h2>House</h2>
					<p>earns 2-5 gold</p>
					<form action="/find" method="post">
						<input type="hidden" name="house" value="house"/>
						<button>Find Gold!</button>					
					</form>
				</div>
				<div class="col-2">
					<h2>Quest</h2>
					<p>earns/takes 0-50 gold</p>
					<form action="/find" method="post">
						<input type="hidden" name="quest" value="quest"/>
						<button>Find Gold!</button>					
					</form>
				</div>
			</div>
			<div class="row">
				<h2>Activities:</h2>
				<p><c:out value="${ninjaMoves}"></c:out></p>
			</div>
		</div>
	</div>
</body> 
</html>