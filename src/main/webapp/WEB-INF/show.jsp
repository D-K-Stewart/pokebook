<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Title</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
	<link rel="stylesheet" href="/css/style.css"/>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
		<div style="display:flex;margin-top:40px">
				<h1 style="margin-left:400px; margin-right:40px;justify-content:center">Edit Expense</h1>		
				<p><a href="/expenses">Go Back</a></p>
			</div>
		<div style="margin-top:10px; margin-left:400px">
			<p>Name:         ${expense.name}</p>
			<p>Description:  ${expense.vendor}</p>
			<p>Vendor:       ${expense.amount}</p>
			<p>Amount Spent: ${expense.description}</p>
		</div>
</body>
</html>