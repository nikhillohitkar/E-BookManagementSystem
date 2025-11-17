<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Help Line</title>
<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/Helpline.css">

</head>
<body>
	<%@ include file="User_all_component/navbar.jsp"%>

	<div class="container d-flex justify-content-center align-items-center">
		<div class="glass-card text-center p-5">
			<div class="icon mb-4">
				<i class="fa-solid fa-phone-volume fa 4-x" style="color: #00db25;"></i>
			</div>
			<h3 class="title">24×7 Service</h3>
			<h4 class="subtitle">Help Line Number</h4>
			<h5 class="number">+91 6263472475</h5>
			<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		</div>
	</div>

	
</body>
</html>
