<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page import="com.entity.user"%>
<%@ page import="java.util.List"%>
<%@ page import="com.DAO.CartDAOImpl"%>
<%@ page import="com.entity.Cart"%>
<%@ page import="com.DB.DBConnect"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>
<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/Cart.css">
</head>
<body>

	<!-- Navbar -->
	<%@ include file="User_all_component/navbar.jsp"%>

	<!-- Redirect to login if user not logged in -->
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<!-- Success Message -->
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success glass-alert text-center">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<!-- Failure Message -->
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger glass-alert text-center">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<div class="main-content">
		<h2 class="  text-center text-white mb-3">Your Cart</h2>
		<div class="row justify-content-center">
			<!-- Left Section: Cart Items -->
			<div class="col-md-6 mb-4">
				<div class="glass-card p-5">
					<h4 class="text-center text-light mb-3">Your Selected Items</h4>
					<table class="table text-white">
						<thead>
							<tr>
								<th>No</th>
								<th>Book Name</th>
								<th>Author</th>
								<th>Price</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							user u = (user) session.getAttribute("userobj");
							CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
							List<Cart> cart = dao.getBookByUser(u.getId());
							Double totalPrice = 0.00;
							int i = 1;
							for (Cart c : cart) {
								totalPrice = c.getTotalPrice();
							%>
							<tr>
								<td><%=i++%></td>
								<td><%=c.getBookName()%></td>
								<td><%=c.getAuthor()%></td>
								<td>₹<%=c.getPrice()%></td>
								<td><a
									href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>&&cid=<%=c.getCid()%>"
									class="btn btn-danger btn-sm">Remove</a></td>
							</tr>
							<%
							}
							%>
							<tr>
								<td colspan="3" class="text-end"><strong>Total
										Price:</strong></td>
								<td colspan="2"><strong>₹<%=totalPrice%></strong></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<!-- Right Section: Form -->
			<div class="col-md-6 mb-4">
				<div class="glass-card p-4">
					<h4 class="text-center text-light mb-3">Your Details for Order</h4>
					<form action="order" method="post">
						<input type="hidden" value="${userobj.id}" name="id">

						<div class="row mb-3">
							<div class="col">
								<input type="text" class="form-control" name="name"
									placeholder="Name" value="<%=u.getName()%>" required>
							</div>
							<div class="col">
								<input type="email" class="form-control" name="email"
									value="<%=u.getEmail()%>" readonly required>
							</div>
						</div>

						<div class="row mb-3">
							<div class="col">
								<input type="text" class="form-control" name="phno"
									placeholder="Phone" value="<%=u.getNumber()%>" required>
							</div>
							<div class="col">
								<input type="text" class="form-control" name="pincode"
									placeholder="Pincode" required>
							</div>
						</div>

						<div class="row mb-3">
							<div class="col">
								<input type="text" class="form-control" name="address"
									placeholder="Address" required>
							</div>
							<div class="col">
								<input type="text" class="form-control" name="landmark"
									placeholder="Landmark">
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label text-white">Payment Mode</label> <select
								class="form-control" name="payment" required>
								<option value="noselect">--Select--</option>
								<option value="COD">Cash on Delivery</option>
							</select>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-glass">Submit Order</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="User_all_component/Footer.jsp"%>
</body>
</html>
