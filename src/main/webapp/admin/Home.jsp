<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>


<%@include file="allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Admin_all_css_file/Home.css">
</head>

<body>

	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<section class="admin-section">
		<h1 class="dashboard-title">Admin Dashboard</h1>

		<div class="card-container">

			<a href="add_books.jsp" class="glass-card"> <i
				class="fa-solid fa-circle-plus"></i>
				<h4>Add Books</h4>
			</a> <a href="all_books.jsp" class="glass-card"> <i
				class="fa-solid fa-book-medical"></i>
				<h4>All Books</h4>
			</a> <a href="orders.jsp" class="glass-card"> <i
				class="fa-solid fa-box-open"></i>
				<h4>Orders</h4>
			</a> <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"
				class="glass-card"> <i class="fa-solid fa-right-from-bracket"></i>
				<h4>Logout</h4>
			</a>
		</div>
	</section>

	<!-- Logout Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<h4>Do you want to logout?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="../logout" type="button" class="btn btn-primary">Logout</a>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
