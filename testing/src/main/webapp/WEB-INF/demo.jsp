<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Testing...</h1>
	
	<% for (int i=0; i<5; i++) { %>
		<h1><%= i %></h1>
	<% } %>
	
	<h3>The time is: <%= new Date() %></h3>
	
	<h2><c:out value="${2+2}"/></h2>
	
	<h1>Fruit of the day:</h1>
	<h2><c:out value="${fruit}"></c:out></h2> <!-- then dynamically provide fruit name thru controller -->
	
</body>
</html>