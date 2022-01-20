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
	<div style="margin-top:40px; margin-left:400px">
		<div style="display:flex;">
			<h1 style="margin-right:40px">Edit Expense</h1>		
			<p><a href="/expenses">Go Back</a></p>
		</div>
		
		<form:form action="/expenses/${expense.id}/edit" method="post" modelAttribute="expense">
		    <input type="hidden" name="_method" value="put">
		    <p>
		        <form:errors style="color:red" path="name"/>
		        <form:label path="name">Expense Name:</form:label>
		        <form:input path="name"/>
		    </p>
		    <br/>
		    <p>
		        <form:errors style="color:red" path="vendor"/>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:textarea path="vendor"/>
		    </p>
		    <br/>
		    <p>
		        <form:errors style="color:red" path="amount"/>
		        <form:label path="amount">Amount:</form:label>
		        <form:input type="number" min="0.01" step="0.01" path="amount"/>
		    </p>
		    <br/>
		    <p>
		        <form:errors style="color:red" path="description"/>
		        <form:label path="description">Pages</form:label>     
		        <form:input path="description"/>
		    </p>    
		    <input type="submit" value="Submit"/>
		</form:form>
	</div>
</body>
</html>