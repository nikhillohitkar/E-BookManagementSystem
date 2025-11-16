<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.List,com.DAO.BookDAOimpl,com.DB.DBConnect,com.entity.BookDrls"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Books</title>
<%@include file="allCSS.jsp"%>
<%@include file="navbar.jsp"%>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Admin_all_css_file/all_books.css">
<body>

	<div class="container mt-4">
		<h2 class="text-center mb-4">All Books</h2>
		<!-- Success Message -->
		<!-- Success Message -->
		<c:if test="${not empty sessionScope.succMsg}">
			<h3 class="text-center text-success">${sessionScope.succMsg}</h3>
			<c:remove var="succMsg" scope="session" />
		</c:if>

		<!-- Error Message -->
		<c:if test="${not empty sessionScope.errorMsg}">
			<h3 class="text-center text-danger">${sessionScope.errorMsg}</h3>
			<c:remove var="errorMsg" scope="session" />
		</c:if>


		<table class="table table-striped table-bordered shadow-lg rounded">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Image</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author Name</th>
					<th scope="col">Price</th>
					<th scope="col">Book Categories</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
				List<BookDrls> list = dao.getAllBooks();
				for (BookDrls b : list) {
				%>
				<tr>
					<td><%=b.getBookId()%></td>
					<td><img src="../book/<%=b.getPhoto()%>"
						style="width: 50px; hight: 50px;"></td>

					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getCategories()%></td>
					<td><%=b.getStatus()%></td>
					<td><a href="edit_books.jsp?id=<%=b.getBookId()%>"
						class="btn
						btn-sm btn-primary">Edit <i
							class="fa-solid fa-pen-to-square"></i></a> <a
						href="../deleteBook?id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger"
						onclick="return confirm('Are you sure you want to delete this book?');"><i
							class="fa-solid fa-trash"></i>Delete</a>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<footer class="footer text-center mt-4"> Made with ❤
		glassmorphism </footer>

</body>
</html>
