<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.entity.user"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>

<!-- CSS Includes -->
<%@ include file="User_all_component/allCSS.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/User_all_component/Login.css">

</head>

<body>

    <!-- Navbar -->
    <%@ include file="User_all_component/navbar.jsp" %>

    <!-- Glass Login Container -->
    <div class="d-flex justify-content-center align-items-center vh-100">
        <div class="glass-login-card p-4">

            <h3 class="text-center mb-3">Login</h3>

            <!-- Login Messages -->
            <c:if test="${not empty failedMsg}">
                <h6 class="text-center text-danger">${failedMsg}</h6>
                <c:remove var="failedMsg" scope="session" />
            </c:if>

            <c:if test="${not empty succMsg}">
                <h6 class="text-center text-success">${succMsg}</h6>
                <c:remove var="succMsg" scope="session" />
            </c:if>

            <!-- Login Form -->
            <form action="login" method="post">
                <div class="mb-3 text-start">
                    <label>Email address</label>
                    <input type="email" class="form-control" name="email"
                           placeholder="Enter email" required>
                </div>

                <div class="mb-3 text-start">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password"
                           placeholder="Enter password" required>
                </div>

                <div class="form-check text-start mb-3">
                    <input class="form-check-input" type="checkbox" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember me</label>
                </div>

                <button type="submit" class="btn btn-primary w-100">Login</button>

                <div class="text-center mt-3">
                    <a href="register.jsp" class="text-decoration-none">Create Account</a>
                </div>
            </form>
        </div>
    </div>
<%@ include file="User_all_component/Footer.jsp"%>
</body>
</html>
