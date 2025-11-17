<%@ page
	import="java.util.*,com.DAO.BookDAOimpl,com.DB.DBConnect,com.entity.BookDrls,com.entity.user"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Recent Books</title>
<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/index.css">
</head>

<body>
	<%@ include file="User_all_component/navbar.jsp"%>
	<%
	user u = (user) session.getAttribute("userObj");
	%>

<di class="main-content">
		<div>
			<h2 class="text-center text-danger mt-3">EBook Management System</h2>
		</div>
		<!-- ⭐ Old Books (Row 3) -->
		<h3 class="section-title text-center mt-5">Old Books</h3>
		<div class="row mt-3">

			<%
			BookDAOimpl daoOld = new BookDAOimpl(DBConnect.getConn());
			List<BookDrls> listOld = daoOld.getOldBook();
			for (BookDrls b : listOld) {
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
	
	<%@ include file="User_all_component/Footer.jsp" %>
</body>
</html>
