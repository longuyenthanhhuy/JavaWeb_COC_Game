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
    <body>
        <!-- Navigation-->
        <%@include file="Components/navbarComponent.jsp" %>
        <!-- Product section-->
        <div class="alert alert-success text-center" role="alert">
            Order succesfully,Thank you for use Coc Game......
            <div class="text-center mt-2">
                <a href="home" class="btn btn-outline-primary">Comeback to home page</a>
            </div>
            
        </div>
          <h3>${orderID}</h3>

        <!-- Footer-->
        <%@include file="Components/footerComponent.jsp" %>

    </body>
</html>

