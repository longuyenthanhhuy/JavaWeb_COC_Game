<%-- 
    Document   : updateProduct
    Created on : Jul 5, 2022, 10:48:30 AM
    Author     : htlvn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="update-product" method="POST">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">ID</label>
                <input type="hidden" class="form-control" id="name" name="id" value="${product.id}" >

            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" value="${product.name}" >

            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Price</label>
                <input type="text" class="form-control" id="price" name="price" value="${product.price}" >

            </div>
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Description</label>
                <input type="text" class="form-control" id="description" name="description" value="${product.description}" >

            </div>

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Image</label>
                <input type="text" class="form-control" id="image" name="image" value="${product.image}">

            </div>

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Create Date</label>
                <input type="date" class="form-control" id="date" name="date" value="${product.createDate}" >

            </div>

            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Category</label>
                <select name="category"class="form-select" aria-label="Default select example">
                    <c:forEach items="${sessionScope.listCategories}" var="C">
                        <option  <c:if test="${product.categoryID==C.id}"> selected="selected"</c:if> value="${C.id}">${C.name}</option>
                    </c:forEach>

                </select>


            </div>





            <button type="submit" class="btn btn-primary">Submit</button>  
        </form>
    </body>
</html>
