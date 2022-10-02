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
    <body id="container">
        <!-- Navigation-->
        <%@include file="Components/navbarComponent.jsp" %>
        <!-- Product section-->
        <h3>Input active code</h3>
        <div style="width: 40%;margin: auto;border: 1px solid #ccc; padding:  1rem " class="mt-5">
            <form action="active" method="POST">
                <div class="mb-3">
                    <label for="username" class="form-label">Input active code here</label>
                    <input type="text" class="form-control" id="username" name="activemail" aria-describedby="emailHelp">
                    <div id="emailHelp" class="form-text">Active code will be delete after 2 minutes</div>
                </div>

                <h3 class="text-danger">${error}</h3>
                <button type="submit" class="btn btn-primary">Active</button>
            </form>
        </div>

        <%@include file="Components/footerComponent.jsp" %>

        <script>
            window.onload = function(){
                setTimeout(checktime, 2000 * 60 );
            };
            function checktime() {
                var container = document.getElementById("container");
                container.innerHTML = "<div class='alert alert-warning alert-dismissible fade show' role='alert'>"+
            "<strong>Time Out!</strong> You will comeback register!"+
            "</div>"+
            "<a href = 'active?checktime=send' class = ' btn btn-outline-danger'>comeback</a>"
//                <a href="active?checktime=end"></a>
            }

        </script>
    </body>
</html>

