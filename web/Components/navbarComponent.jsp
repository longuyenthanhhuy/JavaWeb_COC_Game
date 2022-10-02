<%-- 
    Document   : navbarComponent
    Created on : Jun 6, 2022, 4:01:25 PM
    Author     : htlvn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Navigation-->
<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #2a2a2a;" >
    <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="home">CoC Game</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- collapse sẽ reponsive khi thu nhỏ màn hình, các thuộc tính cũng sẽ xuất hiện trong thanh đóng mở : dấu 3 gạch -->
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" aria-current="page" href="home">Home</a></li>
                <li class="nav-item"><a class="nav-link active" href="#!">About</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Shop</a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">All Products</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Popular Items</a></li>
                        <li><a class="dropdown-item" href="#!">New Arrivals</a></li>
                    </ul>
                </li>
            </ul>
            <form action="search" class="d-flex mx-auto">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
                <button class="btn btn-outline-light" type="submit" >Search</button>
            </form>
            <!-- thêm thanh search vào -->

            <a class="d-flex my-2">
                <a class="btn btn-outline-light" href="show-carts">
                    <i class="bi-cart-fill me-1"></i>
                    Cart
                    <span id="cart_number" class="badge bg-dark text-white ms-1 rounded-pill">${sessionScope.carts.size()}</span>
                </a>
            </a>
            <c:choose>
                <c:when test="${sessionScope.account != null}">
                    <button class="btn btn-outline-light ms-lg-2">${sessionScope.account.displayName}</button>
                                    <a href="logout" class="btn btn-outline-light ms-lg-2">Logout</a>

                </c:when>
                <c:otherwise>
                    <a href="login" class="btn btn-outline-light ms-lg-2">Login</a>

                </c:otherwise>
            </c:choose>

            <!-- tạo button và dùng ms-lg (ms là margin left) để cách với card -->
        </div>
    </div>
</nav>