<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Book: Register</title>

<%@include file="User_all_component/allCSS.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/Registration.css">



</head>
<body>

	<%@ include file="User_all_component/navbar.jsp"%>

	<div class="glass-container">
		<div class="glass-card">

			<h3 class="text-center text-white mb-4">Create Your Account</h3>

			<c:if test="${not empty succMsg}">
				<p class="text-center text-success">${succMsg}</p>
				<c:remove var="succMsg" scope="session" />
			</c:if>

			<form action="register" method="post">

				<div class="mb-4">
					<label class="form-label text-white">Full Name</label> <input
						type="text" class="form-control glass-input" name="name" required>
				</div>

				<div class="mb-3">
					<label class="form-label text-white">Phone Number</label> <input
						type="tel" class="form-control glass-input" name="phone" required>
				</div>

				<div class="mb-3">
					<label class="form-label text-white">Email address</label> <input
						type="email" class="form-control glass-input" name="email"
						required>
				</div>

				<div class="mb-3">
					<label class="form-label text-white">Password</label> <input
						type="password" class="form-control glass-input" name="password"
						required>
				</div>

				<div class="mb-3 form-check">
					<input type="checkbox" class="form-check-input" name="check"
						required> <label class="form-check-label text-light">I
						agree to the terms</label>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-primary px-4">Register</button>
				</div>

			</form>

		</div>
	</div>

	<%@ include file="User_all_component/Footer.jsp"%>

</body>
</html>
