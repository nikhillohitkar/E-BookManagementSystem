<%@page import="java.util.List"%>
<%@page import="com.entity.Book_Order"%>
<%@page import="com.entity.user"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/userorder.css">
</head>
<body>
	<%@ include file="User_all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<%
	user u = (user) session.getAttribute("userobj");
	if (u == null) {
		response.sendRedirect("login.jsp");
		return;
	}

	BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
	List<Book_Order> blist = dao.getBook(u.getEmail());
	%>

	<div class="glass-container">
		<h2 class="glass-title">My Orders</h2>

		<table class="glass-table">
			<thead>
				<tr>
					<th>Order ID</th>
					<th>Name</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Price</th>
					<th>Payment Type</th>
				</tr>
			</thead>

			<tbody>
				<%
				for (Book_Order b : blist) {
				%>
				<tr>
					<td><%=b.getOrderId()%></td>
					<td><%=b.getUserName()%></td>
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td>₹<%=b.getPrice()%></td>
					<td><%=b.getPaymentType()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>

	<%@ include file="User_all_component/Footer.jsp"%>

</body>
</html>
