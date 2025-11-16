<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.entity.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@ include file="User_all_component/allCSS.jsp"%>


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/EditProfile.css">

</head>
<body>

	<%@ include file="User_all_component/navbar.jsp"%>

	<div class="main-container">
		<div class="glass-card">
			<h3 class="text-center glass-title">Edit Profile</h3>

			<form action="update_profile" method="post">
				<input type="hidden" value="${userobj.id}" name="id">

				<div class="mb-3">
					<label class="glass-label">Enter Name</label> <input type="text"
						class="glass-input" name="name" value="${userobj.name}">
				</div>

				<div class="mb-3">
					<label class="glass-label">Enter Number</label> <input type="tel"
						class="glass-input" name="phone" value="${userobj.number}">
				</div>

				<div class="mb-3">
					<label class="glass-label">Email Address</label> <input
						type="email" class="glass-input" name="email"
						value="${userobj.email}">
				</div>

				<div class="mb-4">
					<label class="glass-label">Password</label> <input type="password"
						class="glass-input" name="password" required>
				</div>

				<div class="text-center">
					<button type="submit" class="glass-btn">Update Profile</button>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="User_all_component/Footer.jsp"%>
</body>
</html>
