<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,com.DAO.BookDAOimpl,com.DB.DBConnect,com.entity.BookDrls,com.entity.user"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Old Books</title>
<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/Oldbookremove.css">


</head>
<body>

	<%@ include file="User_all_component/navbar.jsp"%>

	<!-- Success Message -->
	<c:if test="${ not empty succMsg}">
		<div class="alert alert-success text-center mt-3">${succMsg}</div>
	</c:if>

	<!-- 🌟 Glass Container -->
	<div class="glass-container">

		<h2 class="text-center text-primary mb-4"> Old Books Removes</h2>

		<table class="glass-table">
			<thead>
				<tr>
					<th>Book Name</th>
					<th>Author</th>
					<th>Price</th>
					<th>Category</th>
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<%
				user u = (user) session.getAttribute("userobj");

				if (u != null) {
					String email = u.getEmail();
					BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
					List<BookDrls> list = dao.getBookByOld(email, "Old");

					for (BookDrls b : list) {
				%>
				<tr>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td>₹<%=b.getPrice()%></td>
					<td><%=b.getCategories()%></td>

					<td><a
						href="delete_old_book?em=<%=u.getEmail()%>&id=<%=b.getBookId()%>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				} else {
				response.sendRedirect("login.jsp");
				}
				%>
			</tbody>
		</table>

	</div>

	<!-- Footer -->
	<%@ include file="User_all_component/Footer.jsp"%>

</body>
</html>