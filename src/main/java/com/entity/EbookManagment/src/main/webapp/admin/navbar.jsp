<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
<%@include file="allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/Admin_all_css_file/Nevbar_admin.css">
</head>

<body>
	<div class="container-fluid p-3">
		<div class="row">
			<div class="col-md-3 text-center">
				<h3>Ebooks</h3>
			</div>
			<div class="col-md-6"></div>
			<div class="col-md-3 text-end">
				<c:if test="${not empty userobj}">
					<a class="btn btn-success">${userobj.name}</a>
					<a data-bs-toggle="modal" data-bs-target="#exampleModal"
						class="btn btn-danger"> <i class="fas fa-sign-out-alt"></i>
						Logout
					</a>
				</c:if>

				<c:if test="${empty userobj}">
					<a href="../login.jsp" class="btn btn-danger"><i
						class="fas fa-sign-out-alt"></i> Login</a>
					<a href="../register.jsp" class="btn btn-primary text-white"><i
						class="fas fa-user-plus"></i> Register</a>
				</c:if>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body text-center">
					<h4>Do you want to logout?</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<a href="../logout" class="btn btn-primary">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarTogglerDemo01">
				<ul class="navbar-nav me-auto mb-3 mb-lg-1">
					<li class="nav-item"><a
						class="nav-link active btn btn-secondary" href="Home.jsp">Home</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
</body>
</html>
