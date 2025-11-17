<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Address</title>
<%@ include file="User_all_component/allCSS.jsp"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/User_all_component/address.css">
</head>

<body>

	<%@ include file="User_all_component/navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp" />
	</c:if>

	<div class="main-content">

		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="glass-card">
					<h3 class="text-center mb-3">Add Address</h3>

					<form>

						<div class="row mb-3">
							<div class="col">
								<label>Address</label> <input type="text" class="form-control"
									placeholder="Address">
							</div>

							<div class="col">
								<label>Landmark</label> <input type="text" class="form-control"
									placeholder="Landmark">
							</div>
						</div>

						<div class="row mb-3">
							<div class="col">
								<label>State</label> <input type="text" class="form-control"
									placeholder="State">
							</div>

							<div class="col">
								<label>City</label> <input type="text" class="form-control"
									placeholder="City">
							</div>
						</div>

						<div class="row mb-4">
							<div class="col">
								<label>Zip Code</label> <input type="text" class="form-control"
									placeholder="Zip Code">
							</div>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-warning px-4">Add
								Address</button>
						</div>

					</form>
				</div>

			</div>
		</div>

	</div>

	<%@ include file="User_all_component/Footer.jsp"%>

</body>
</html>
