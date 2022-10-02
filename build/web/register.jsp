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
      
        <!-- Product section-->
        <section class="bg-dark  py-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Create Account</h3></div>
                            <div class="card-body">
                                <form action="register" method="POST">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <input  pattern="^[a-zA-Z0-9]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$" class="form-control" id="username" name="username" type="text" placeholder="Enter your Username" />
                                                <label for="username">Username</label>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <input  class="form-control" id="inputLastName" name="displayname"type="text" placeholder="Enter your last name" />
                                                <label for="inputLastName">Display name</label>
                                            </div>
                                        </div>
                                    </div>
                            </div>

                            <div class="form-floating mb-3">
                                <input class="form-control" id="inputEmail" type="email" name="email" placeholder="name@example.com" />
                                <label for="inputEmail">Email address</label>
                            </div>
                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" class="form-control" id="inputPassword" name="password" type="password" placeholder="Create a password" />
                                        <label for="inputPassword">Password</label>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-floating mb-3 mb-md-0">
                                        <input pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" class="form-control" id="inputPasswordConfirm" type="password" name="repassword" placeholder="Confirm password" />
                                        <label for="inputPasswordConfirm">Confirm Password</label>
                                    </div>
                                </div>

                            </div>
                            <h3 class="text-danger">${error}</h3>
                             <h3 class="text-danger">${error1}</h3>
                            <button type="submit" class=" btn btn-primary btn-block" style="padding-bottom: 5px" >Create account</button>


                            </form>
                        </div>
                        <div class="card-footer text-center py-3">
                            <div class="small"><a href="login.jsp">Have an account? Go to login</a></div>
                              <a href="home">Comeback Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer-->
    <%@include file="Components/footerComponent.jsp" %>

</body>
</html>

