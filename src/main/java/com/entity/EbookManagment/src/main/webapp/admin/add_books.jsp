<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<%@ page
	import="com.DAO.BookDAOimpl,com.DB.DBConnect,com.entity.BookDrls"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Book</title>

<%@ include file="allCSS.jsp"%>

<!-- Use JSTL-friendly path -->
<link rel="stylesheet" href="<c:url value='/Admin_all_css_file/Add_books.css'/>">

</head>

<body>

	<%@ include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<section class="edit-section">
		<div class="glass-form">

			<!-- Success Message -->
			<c:if test="${not empty succMsg}">
				<p class="msg-success">${succMsg}</p>
			</c:if>

			<!-- Error Message -->
			<c:if test="${not empty errorMsg}">
				<p class="msg-error">${errorMsg}</p>
			</c:if>

			<h2 class="form-title">Add Book</h2>

			<form action="../add_books" method="post"
				enctype="multipart/form-data">

				<div class="form-group">
					<label>Book Name</label> <input type="text" name="bookname"
						required>
				</div>

				<div class="form-group">
					<label>Author Name</label> <input type="text" name="author"
						required>
				</div>

				<div class="form-group">
					<label>Price</label> <input type="number" step="0.01" name="price"
						required>
				</div>

				<div class="form-group">
					<label>Categories</label> <select name="categories" required>
						<option value="">-- Select Category --</option>
						<option value="New">New</option>
						<option value="Old">Old</option>
						<option value="Programming">Programming</option>
						<option value="Novel">Novel</option>
						<option value="History">History</option>
					</select>
				</div>

				<div class="form-group">
					<label>Status</label> <select name="status" required>
						<option value="">-- Select Status --</option>
						<option value="Active">Active</option>
						<option value="Inactive">Inactive</option>
					</select>
				</div>

				<div class="form-group">
					<label>Upload Book Photo</label> <input type="file" name="photo"
						required>
				</div>

				<div class="btn-container">
					<button type="submit" class="glass-btn">Submit</button>
				</div>

			</form>
		</div>
	</section>

</body>
</html>
