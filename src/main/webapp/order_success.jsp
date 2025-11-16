<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>
<body>
<%@include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/odersucces.css">
</head>

<%@include file="User_all_component/navbar.jsp"%>

<div class="success-card">
	<i class="fas fa-check-circle"></i>

	<h1 class="text-success">Thank You!</h1>
	<h3>Your Order Was Successful</h3>

	<p class="mt-2">Your product will be delivered to your address
		within 7 days.</p>

	<a href="index.jsp" class="btn btn-primary btn-custom">Home</a> <a
		href="user_order.jsp" class="btn btn-danger btn-custom">View Order</a>
</div>

<%@ include file="User_all_component/Footer.jsp"%>

</body>
</html>