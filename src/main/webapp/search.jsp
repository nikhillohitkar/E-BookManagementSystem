<%@ page
	import="java.util.*,com.DAO.BookDAOimpl,com.DB.DBConnect,com.entity.BookDrls,com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Book</title>

<%@ include file="User_all_component/allCSS.jsp"%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/Search.css">


</head>

<body>

	<%@ include file="User_all_component/navbar.jsp"%>

	<%
	user u = (user) session.getAttribute("userObj");
	%>

	<div class="container mt-5">

		<h2 class="text-center text-light mt-3">EBook Management System</h2>

		<div class="row mt-4">

			<%
			String ch = request.getParameter("ch");
			BookDAOimpl dao2 = new BookDAOimpl(DBConnect.getConn());
			List<BookDrls> list = dao2.getBookBySerch(ch);
			for (BookDrls b : list) {
			%>

			<div class="col-md-3 mb-4">
				<div class="glass-card text-center">

					<img src="book/<%=b.getPhoto()%>"
						style="width: 100px; height: 200px;" class="img-thumbnail">

					<h5 class="book-name"><%=b.getBookName()%></h5>

					<p class="author-name">
						👤
						<%=b.getAuthor()%></p>
					<p class="category-name">
						📖
						<%=b.getCategories()%></p>

					<div class="btn-box">
						<%
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
						%>

						<a href="View.jsp?id=<%=b.getBookId()%>" class="glass-btn">View</a>
					</div>

					<div class="glass-price">
						₹<%=b.getPrice()%></div>

				</div>
			</div>

			<%
			}
			%>

		</div>

	</div>

	<%@ include file="User_all_component/Footer.jsp"%>

</body>
</html>
