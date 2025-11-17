<%@page import="java.util.List"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Orders</title>

<%@include file="allCSS.jsp"%>

<!-- Glassmorphism CSS -->
<link rel="stylesheet"
	href="<c:url value='/Admin_all_css_file/admin_order.css'/>">

</head>
<body>

	<%@include file="navbar.jsp"%>

	<section class="order-section">
		<h2 class="title">All Orders</h2>

		<div class="glass-table">
			<table>
				<thead>
					<tr>
						<th>Order ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Address</th>
						<th>Phone</th>
						<th>Book Name</th>
						<th>Author</th>
						<th>Price</th>
						<th>Payment Type</th>
					</tr>
				</thead>

				<tbody>
					<%
					BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
					List<Book_Order> blist = dao.getAllOrder();
					for (Book_Order b : blist) {
					%>
					<tr>
						<td><%=b.getOrderId()%></td>
						<td><%=b.getUserName()%></td>
						<td><%=b.getEmail()%></td>
						<td><%=b.getFulladd()%></td>
						<td><%=b.getPhno()%></td>
						<td><%=b.getBookName()%></td>
						<td><%=b.getAuthor()%></td>
						<td><%=b.getPrice()%></td>
						<td><%=b.getPaymentType()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</section>

	<footer class="footer">Made with ❤️ Glassmorphism</footer>

</body>
</html>
