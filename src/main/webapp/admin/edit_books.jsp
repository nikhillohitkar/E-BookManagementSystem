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
<title>Edit Book</title>

<%@include file="allCSS.jsp"%>

<!-- Correct CSS Path -->
<link rel="stylesheet"
	href="<c:url value='/Admin_all_css_file/edit_books.css'/>">

</head>

<body>

	<%@include file="navbar.jsp"%>

	<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
	BookDrls b = dao.getBookById(id);
	%>

	<section class="edit-section">
		<div class="glass-form">

			<h2 class="form-title">Edit Book</h2>

			<form action="../edit_books" method="post"
				enctype="multipart/form-data">

				<input type="hidden" name="id" value="<%=b.getBookId()%>">

				<div class="form-group">
					<label>Book Name</label> <input type="text" name="bookname"
						value="<%=b.getBookName()%>" required>
				</div>

				<div class="form-group">
					<label>Author Name</label> <input type="text" name="author"
						value="<%=b.getAuthor()%>" required>
				</div>

				<div class="form-group">
					<label>Price</label> <input type="number" step="0.01" name="price"
						value="<%=b.getPrice()%>" required>
				</div>

				<div class="form-group">
					<label>Categories</label> <input type="text" name="category"
						value="<%=b.getCategories()%>" required>
				</div>

				<div class="form-group">
					<label>Status</label> <select name="status">
						<option value="Active"
							<%="Active".equals(b.getStatus()) ? "selected" : ""%>>Active</option>
						<option value="Inactive"
							<%="Inactive".equals(b.getStatus()) ? "selected" : ""%>>Inactive</option>
					</select>
				</div>

				<div class="btn-container">
					<button type="submit" class="glass-btn">Update</button>
				</div>

			</form>
		</div>
	</section>

</body>
</html>
