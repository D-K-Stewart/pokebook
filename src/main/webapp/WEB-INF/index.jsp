<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
	<h1 style="margin-top:40px; margin-left:100px">PokeBook</h1>
	<div>	
		<div style="text-align:center; width:75%; margin-top:10px;margin-left:100px;border:solid"class="cantainer mt-4">
			
			<table class="table table-striped">
				<thead>
					<tr>
						<td>Expense</td>
						<td>Vendor</td>
						<td>Amount</td>
						<td>Actions</td>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="expense" items="${expenses}">
					<tr>
						<%-- <td>${expense.id}</td> --%>
						<td><a href="/expenses/${expense.id}/show">${expense.name}</a></td>
						<td>${expense.vendor}</td>
						<td>${expense.amount}</td>
						<td style="display:flex;">
                            <form action="/expenses/${expense.id}/edit"><button type="submit" class="btndash">Edit</button></form>
                            <form action="/expenses/${expense.id}" method="post"><input type="hidden" name="_method" value="delete" class="btndash"/><input type="submit" value="Delete"/></form>
                        </td>
					</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div style="margin-top:40px; margin-left:400px">	
		<h1>Track an expense:</h1>
		<form:form action="/expenses" method="post" modelAttribute="expense">
		    <p>
		        <form:errors style="color:red" path="name"/>
		        <br/>
		        <form:label path="name">Expense Name:</form:label> 
		        <form:input path="name"/>
		    </p>
		    <p>
		        <form:errors style="color:red" path="vendor"/>
		        <br/>
		        <form:label path="vendor">Vendor:</form:label>
		        <form:textarea path="vendor"/>
		        
		    </p>
		    <p>
		        <form:errors style="color:red" path="amount"/>
		        <br/>
		        <form:label path="amount">Amount:</form:label>
		        <form:input type="number" min="0.01" step="0.01"  path="amount"/>
		    </p>
		    <p>
		        <form:errors style="color:red" path="description"/> 
		        <br/>
		        <form:label path="description">Description:</form:label>    
		        <form:input path="description"/>
		    </p>    
		    <input class="button" type="submit" value="Submit"/>
		</form:form>
	</div>		
</body>
</html>