<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*,com.DAO.BookDAOimpl,com.DB.DBConnect,com.entity.BookDrls,com.entity.user"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Book Detail</title>

<%@ include file="User_all_component/allCSS.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/View.css">

</head>
<body>
	<%@ include file="User_all_component/navbar.jsp"%>

	<%
	user u = (user) session.getAttribute("userobj");
	String sid = request.getParameter("id");
	int id = 0;
	if (sid != null) {
		id = Integer.parseInt(sid);
	} else {
		out.println("<h3 style='color:red;'>Book ID not provided!</h3>");
		return;
	}

	BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
	BookDrls b = dao.getBookById(id);
	%>

	<!-- MAIN WRAPPER -->
	<div class="container d-flex justify-content-center mt-5">
		<div class="glass-card book-details-card p-100">

			<!-- IMAGE + INFO -->
			<div class="row">

				<!-- LEFT SIDE -->
				<div class="col-md-6 text-center">
					<img src="book/<%=b.getPhoto()%>"
						style="width: 100px; height: 200px;" class="img-thumbnail">

					<h3 class="mt-4 text-white"><%=b.getBookName()%></h3>
					<p class="book-meta">
						👤 Author:
						<%=b.getAuthor()%></p>
					<p class="book-meta">
						📦 Category:
						<%=b.getCategories()%></p>

					<p class="book-meta">
						🏷️ Type: <span
							class="<%=b.getCategories().equalsIgnoreCase("Old") ? "text-danger" : "text-success"%> fw-bold">
							<%=b.getCategories()%>
						</span>
					</p>
				</div>

				<!-- RIGHT SIDE -->
				<div class="col-md-6 text-center mt-4">

					<div class="row mb-4">

						<div class="col-md-4 glass-mini-box text-success">
							<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
							<p>Cash on Delivery</p>
						</div>

						<div class="col-md-4 glass-mini-box text-danger">
							<i class="fa-solid fa-rotate-left fa-2x"></i>
							<p>Return</p>
						</div>

						<div class="col-md-4 glass-mini-box text-primary">
							<i class="fa-solid fa-truck fa-2x"></i>
							<p>Free Delivery</p>
						</div>

					</div>

					<h5 class="text-white mt-5">
						📧 Email:
						<%=b.getEmail()%></h5>

					<div class="mt-4">

						<%
						if (!b.getCategories().equalsIgnoreCase("Old")) { // Only new books
							if (u == null) {
						%>
						<a href="login.jsp" class="glass-btn">Add to Cart</a>
						<%
						} else {
						%>
						<a href="cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
							class="glass-btn">Add to Cart</a>
						<%
						}
						}
						%>
					</div>

					<div class="glass-price">
						₹<%=b.getPrice()%></div>
				</div>
			</div>
		</div>

	</div>
	
	
	<%@ include file="User_all_component/Footer.jsp" %>
</body>
</html>
