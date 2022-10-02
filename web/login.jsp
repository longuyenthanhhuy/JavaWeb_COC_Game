<%-- 
   Document   : homepage
   Created on : Jun 2, 2022, 7:43:14 PM
   Author     : htlvn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="Components/HeadComponent.jsp" %>
    <body class="bg-dark text-light">
        <c:choose>
            <c:when test="${sessionScope.account!=null}">
                <%response.sendRedirect("home");%>
            </c:when>
        </c:choose>
       
        <h3 class="text-center ">Login</h3>
        <div style="width: 40%;margin: auto;border: 1px solid #ccc; padding:  1rem " class=" mt-5">
            <form action="login" method="POST">
            <div class="mb-3">
                <label for="username" class="form-label">User name</label>
                <input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp">
                <div id="emailHelp" class="form-text">We'll never share your username with anyone else.</div>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password">
            </div>
            <div class="mb-3 form-check">
                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="remember">
                <label class="form-check-label" for="exampleCheck1">Remember me</label>
            </div>
                <h3 class="text-danger">${error}</h3>
            <button type="submit" class="btn btn-primary">Login</button>
        </form>
            
            </div>
             <div class="card-footer text-center py-3">
                            <div class="small"><a href="register.jsp">Create new account?Register now</a></div>
                             <a href="home">Comeback Home</a>
                        </div>
        <!-- Footer-->
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>

    </body>
</html>

