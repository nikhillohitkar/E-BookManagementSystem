<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<%@ include file="allCSS.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/All_component/Navbar.css">

<!-- FIXED GLASS NAVBAR (TOP ALWAYS) -->
<nav class="glass-navbar navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">

        <!-- LOGO -->
        <a class="navbar-brand logo text-white fw-bold" href="index.jsp">📚 Ebooks</a>

        <!-- TOGGLER -->
        <button class="navbar-toggler glass-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- CONTENT -->
        <div class="collapse navbar-collapse" id="mainNav">

            <!-- LEFT MENU -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item"><a class="nav-link text-white" href="index.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="all_recent_book.jsp">Recent Books</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="all_new_book.jsp">New Books</a></li>
                <li class="nav-item"><a class="nav-link text-white" href="all_old_book.jsp">Old Books</a></li>
            </ul>

            <!-- SEARCH BAR -->
            <form class="d-flex search-area" action="search.jsp">
                <input class="glass-input" type="search" name="ch" placeholder="Search books...">
                <button class="glass-btn search-btn">Search</button>
            </form>

            <!-- RIGHT SIDE BUTTONS -->
            <div class="d-flex align-items-center ms-3">

                <c:if test="${empty userobj}">
                    <a href="login.jsp" class="glass-btn me-2">Login</a>
                    <a href="register.jsp" class="glass-btn">Register</a>
                </c:if>

                <c:if test="${not empty userobj}">
                    <a href="cart.jsp" class="text-white me-3">
                        <i class="fa-solid fa-cart-plus fa-2x"></i>
                    </a>

                    <a class="glass-btn me-2">${userobj.name}</a>
                    <a href="logout" class="glass-btn">Logout</a>
                </c:if>

                <a href="setting.jsp" class="glass-btn ms-2">Setting</a>
                <a href="helpline.jsp" class="glass-btn ms-2">Contact</a>

            </div>

        </div>

    </div>
</nav>

<!-- ADD THIS BELOW NAVBAR FIX -->
<div style="height: 90px;"></div>
