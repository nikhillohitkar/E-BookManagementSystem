<%@ page
	import="java.util.*,com.DAO.BookDAOimpl,com.DB.DBConnect,com.entity.BookDrls,com.entity.user"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Books</title>
<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/index.css">
</head>

<body>
	<%@ include file="User_all_component/navbar.jsp"%>

<c:if test="${not empty succMsg}">
		<div class="alert alert-success glass-alert text-center">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<%
	user u = (user) session.getAttribute("userobj");
	%>



	<!-- ⭐ New Books (Row 2) -->
	<div class="container mt-5">
		<div>
			<h2 class="text-center text-danger mt-3">EBook Management System</h2>
		</div>
		<h3 class="section-title text-center mt-5">New Books</h3>
		<div class="row mt-3">

			<%
			BookDAOimpl dao = new BookDAOimpl(DBConnect.getConn());
			List<BookDrls> list = dao.getAllNewBook();

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
						<a
							href="${pageContext.request.contextPath}/cart?bid=<%=b.getBookId()%>&uid=<%=u.getId()%>"
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
