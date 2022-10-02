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
        <section class="bg-dark text-white py-5">
            <div class="container" style="min-height: 1000px">
                <h3>List Games</h3>
             
                
                <c:choose>
                    <c:when test="${sessionScope.carts.size()==0 || sessionScope.carts==null}">
                    <h1>Cart is empty</h1>
                    </c:when>
                <c:otherwise>
                    <table class="table table-dark table-striped">

                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Image</th>
                            <th scope="col">Name</th>
                 
                            <th scope="col">Price</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${carts}" var="C">
                            <tr>
                                <th scope="row">${C.value.id}</th>
                                <td ><img src="${C.value.image}" width="50"/></td>
                                <td>${C.value.name}</td>      
                         
                                <td>${C.value.price}</td>
                                <td><a class="btn btn-outline-danger" href="delete-cart?productID=${C.value.id}"><i class="bi bi-trash"></i>  Delete</a></td>
                            
                                
                            </tr>
                        </c:forEach>
                  
                    </tbody>
                </table>
                      <h3>Total: ${totalmoney}</h3>
                      <form action="checkout" method="POST">
                          <button type="submit" class="btn bg-success w-25">Pay Now</button>
                      </form>
                      
                </c:otherwise>
                
                </c:choose>
                
            </div>
        </section>

        <!-- Footer-->
        <%@include file="Components/footerComponent.jsp" %>

    </body>
</html>

