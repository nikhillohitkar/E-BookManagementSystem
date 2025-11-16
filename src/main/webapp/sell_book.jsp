<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>

<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
 href="${pageContext.request.contextPath}/User_all_component/SellBook.css?v=<%=System.currentTimeMillis()%>">
</head>

<body>

	<%@ include file="User_all_component/navbar.jsp"%>

	<!-- Redirect if user not logged in -->
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div
		class="container d-flex justify-content-center align-items-center mt-5">
		<div class="col-md-6">

			<div class="glass-card">
				<h3 class="text-center text-light mb-4">📚 Sell Your Book</h3>

				<!-- Success Message -->
				<c:if test="${not empty succMsg}">
					<p class="text-center text-success fw-bold">${succMsg}</p>
				</c:if>

				<!-- Error Message -->
				<c:if test="${not empty errorMsg}">
					<p class="text-center text-danger fw-bold">${errorMsg}</p>
				</c:if>

				<form action="add_old_book" method="post"
					enctype="multipart/form-data">

					<input type="hidden" value="${userobj.email}" name="email">

					<!-- Book Name -->
					<div class="form-group mb-4">
						<label class="text-light">Book Name</label> <input type="text"
							class="form-control glass-input" name="bookname" required>
					</div>

					<!-- Author -->
					<div class="form-group mb-4">
						<label class="text-light">Author Name</label> <input type="text"
							class="form-control glass-input" name="author" required>
					</div>

					<!-- Price -->
					<div class="form-group mb-4">
						<label class="text-light">Price (₹)</label> <input type="number"
							class="form-control glass-input" name="price" required>
					</div>

					<!-- Photo Upload -->
					<div class="form-group mb-4">
						<label class="text-light">Upload Book Photo</label> <input
							type="file" class="form-control glass-input" name="photo"
							required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn glass-btn px-5 py-2">
							Sell Now</button>
					</div>

				</form>
			</div>

		</div>
	</div>

</body>
</html>
