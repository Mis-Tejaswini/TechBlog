<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isErrorPage ="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry! Something went wrong... </title>

<%@include file="allLinks.jsp" %>
</head>
<body>
<div class="container text-center">
<img src="images/error.png" class="img-fluid">
<h1 class="display-3"> Sorry! Something went wrong...</h1>
<%= exception%>
<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3"> Home</a>

</div>
</body>
</html>