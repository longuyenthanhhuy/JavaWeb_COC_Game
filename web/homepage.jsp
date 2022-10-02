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
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">COC GAME</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Welcome to game world</p>
                </div>
            </div>
        </header>
        <!-- Section-->
        <section class="bg-dark text-white py-5 ">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row">
                    <div class="col-md-1" >
                        <div class="store" style="max-width: 100%">
                            <a  class="btn btn-outline-light" style="padding-right:23px" href="home">Store</a>
                        </div>
                        <c:if test="${sessionScope.account!=null}">
                             <div class="library mt-2" style="max-width: 100%">
                            <a class="btn btn-outline-light" href="library">Library</a>
                           
                        </div>
                        
                            <c:if test="${sessionScope.account.role==admRole}">
                                <div class="library mt-2" style="max-width: 100%">
                            <a class="btn btn-outline-light" href="admin/dashboard">admin</a>
                        </div>
                            </c:if>
                         
                        </c:if>
                       
                    </div>
                    <div class="col-md-9">
                        <h3>Products</h3>
                        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-3 justify-content-center">
                            <c:forEach items="${requestScope.listProduct}" var="P">
                                <div class="col mb-5">

                                    <div class="card h-100">

                                        <!-- Sale badge-->
                                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                                        <a href="detail?productID=${P.id}">
                                            <!-- Product image-->
                                            <img class="card-img-top" src="${P.image}" alt="...""/>
                                        </a>
                                        <!-- Product details-->
                                        <div class="bg-secondary text-white card-body p-4">
                                            <div class="text-center">
                                                <!-- Product name-->
                                                <h5 class="fw-bolder">${P.name}</h5>
                                                <!-- Product reviews-->
                                                <div class="d-flex justify-content-center small text-warning mb-2">
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                    <div class="bi-star-fill"></div>
                                                </div>
                                                <!-- Product price-->
<!--                                                <span class="text-muted text-decoration-line-through text-white-50">$20.00</span>-->
                                                $${P.price}
                                            </div>
                                        </div>

                                        <!-- Product actions-->
                                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" onclick="addToCartAsync(${P.id})">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <h3>Categories</h3>
                        <ul class="list-group">
                            <c:forEach items="${sessionScope.listCategories}" var="C">
                                <li class="list-group-item"><a class="btn btn-group-dark" href="filter-category?categoryID=${C.id}">${C.name}</a></li>
                                <!--tạo đường dẫn filter-category để xử lí lọc product theo category-->
                            </c:forEach>
                            <!--thay các thể loại ở đây-->

                        </ul>
                    </div>
                    <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                        <ul class="pagination">

                            <c:choose>

                                <c:when test="${pages.totalItem==0 }">
                                    Not found.
                                </c:when>

                                <c:when test="${pages.totalItem < pages.sizePage}">

                                </c:when>

                                <c:otherwise>

                                    <c:if test="${pages.page!=1}">
                                        <li class="page-item"><a class="page-link" href="home?page=1">Home</a></li>
                                        <li class="page-item"><a class="page-link" href="home?page=${pages.page-1}">Previous</a></li>

                                    </c:if>

                                    <c:forEach begin="${pages.pageStart}" end="${pages.pageEnd}" var="i"> 
                                        <li class="page-item ${i==pages.page?"active":""}"><a class="page-link" href="home?page=${i}">${i}</a></li>
                                        </c:forEach>

                                    <c:if test="${pages.page!=pages.totalPage}">
                                        <li class="page-item"><a class="page-link" href="home?page=${pages.page+1}">Next</a></li>
                                        <li class="page-item"><a class="page-link" href="home?page=${pages.totalPage}">End</a></li>
                                        </c:if>

                                </c:otherwise>
                            </c:choose>


                        </ul>
                    </nav>
                </div>

            </div>
        </section>
        <!-- Footer-->
        <%@include file="Components/footerComponent.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
        <script>
                                                function addToCartAsync(productID) {

                                                    axios.get('add-to-cart-async', {
                                                        params: {
                                                            productID: productID
                                                        }
                                                    }).then((response) => {
                                                        document.getElementById("cart_number").innerHTML = response.data;
                                                    })



                                                }
        </script>
    </body>
</html>

