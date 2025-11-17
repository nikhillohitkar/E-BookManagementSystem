<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/Setting.css">

</head>
<body>
	<%@ include file="User_all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container py-5">
		<div class="glass-container mx-auto p-4">
			<c:if test="${not empty userobj}">
				<h3 class="text-center text-light mb-4">Hello, ${userobj.name}</h3>
			</c:if>

			<div class="row justify-content-center g-4">
				<!-- Sell Old Book -->
				<div class="col-md-4">
					<a href="sell_book.jsp" class="text-decoration-none">
						<div class="glass-card text-center">
							<i class="fa-solid fa-book fa-3x text-info mb-3"></i>
							<h4>Sell Old Book</h4>
						</div>
					</a>
				</div>

				<!-- Old Book Remove -->
				<div class="col-md-4">
					<a href="old_book_remove.jsp" class="text-decoration-none">
						<div class="glass-card text-center">
							<i class="fa-solid fa-trash fa-3x text-danger mb-3"></i>
							<h4>Old Book Remove</h4>
						</div>
					</a>
				</div>

				<!-- Edit Profile -->
				<div class="col-md-4">
					<a href="EditProfile.jsp" class="text-decoration-none">
						<div class="glass-card text-center">
							<i class="fa-solid fa-pen-to-square fa-3x text-warning mb-3"></i>
							<h4>Edit Profile</h4>
							<p>Login & Security</p>
						</div>
					</a>
				</div>

				<!-- Address -->
				<div class="col-md-4">
					<a href="address.jsp" class="text-decoration-none">
						<div class="glass-card text-center">
							<i class="fa-solid fa-location-dot fa-3x text-success mb-3"></i>
							<h4>Your Address</h4>
							<p>Edit Address</p>
						</div>
					</a>
				</div>

				<!-- My Order -->
				<div class="col-md-4">
					<a href="user_order.jsp" class="text-decoration-none">
						<div class="glass-card text-center">
							<i class="fa-solid fa-truck-fast fa-3x text-primary mb-3"></i>
							<h4>My Orders</h4>
							<p>Track your orders</p>
						</div>
					</a>
				</div>

				<!-- Help Center -->
				<div class="col-md-4">
					<a href="helpline.jsp" class="text-decoration-none">
						<div class="glass-card text-center">
							<i class="fa-solid fa-headset fa-3x text-light mb-3"></i>
							<h4>Help Center</h4>
							<p>24×7 Service</p>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="User_all_component/Footer.jsp" %></div>
</body>
</html>
