<%-- 
    Document   : dashboard
    Created on : Jun 23, 2022, 2:06:09 PM
    Author     : htlvn
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="../css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <script src="../js/notify.js" ></script>
        <script src="../js/scripts.js" ></script>
        <link href="../css/notify.css" rel="stylesheet " ></link>
    </head>
    <style>
        .modal {
            position: fixed;
                left: 0;
                top: 0;
                display: block;
                background: rgba(0, 0, 0, 0.5);
                height: 100%;
                width: 100%;
                transform: scale(0);
                transition-duration: 0s;
            z-index: 5;
        }


        #edit-product-modal{
            top: 0%;
            left: 20%;
            width: 60%;
            /*height: 25vh;*/
            position: absolute;
            padding: 15px 35px 15px 35px;
            background: #fff;
            transform: scale(0);
            transition-duration: 0.4s;
            z-index: 10;
            border-radius: 5px;
            box-shadow: 0px 0px 1px 1px #ccc;
        }


    </style>

    <body class="sb-nav-fixed">

        <div id="layoutSidenav">

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Dashboard</h1>
                        <ol class="breadcrumb mb-4">
                            <a href="http://localhost:9999/PRJ_Final/home" class="breadcrumb-item active">Comeback home</a>
                        </ol>
                        <div class="row">
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-primary text-white mb-4">
                                    <div class="card-body">Total money</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <p class="small text-white stretched-link" >${tolMoney}$</p>
                                        <div class="small text-white"><i class="fas "></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-warning text-white mb-4">
                                    <div class="card-body">Total user</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <p class="small text-white stretched-link" >${tolAccount} users</p>
                                        <div class="small text-white"><i class="fas"></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-success text-white mb-4">
                                    <div class="card-body">Total product</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <p class="small text-white stretched-link" >${tolProduct} products</p>
                                        <div class="small text-white"><i class="fas "></i></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card bg-danger text-white mb-4">
                                    <div class="card-body">Total order</div>
                                    <div class="card-footer d-flex align-items-center justify-content-between">
                                        <p class="small text-white stretched-link" >${tolOrder} orders</p>
                                        <div class="small text-white"><i class="fas "></i></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area me-1"></i>
                                        Area Chart 
                                    </div>
                                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        Bar Chart 
                                    </div>
                                    <div class="card-body"><canvas id="myBarChart" width="100%" height="40"></canvas></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Product
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Description</th>
                                            <th>Image</th>
                                            <th>Create date</th>
                                            <th>Category</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Description</th>
                                            <th>Image</th>
                                            <th>Create date</th>
                                            <th>Category</th>
                                            <th>Update</th>
                                            <th>Delete</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach items="${productAD}" var="P">
                                            <tr>
                                                <td>${P.id}</td>
                                                <td>${P.name}</td>
                                                <td>${P.price}</td>
                                                <td>${P.description}</td>
                                                <td>${P.image}</td>
                                                <td>${P.createDate}</td>
                                                <td>${P.category}</td>
                                                <th><a onclick="editProduct(event, '${P.id}')" class="btn btn-outline-success">Update</a></th>
                                                <th><a href="delete-product?productID=${P.id}" class="btn btn-outline-danger">Delete</a></th>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <div class="modal">
                    <div id="edit-product-modal" >
                        <form id="edit-product-form" action="update-product" method="POST" >
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label edit-product"></label>
                                <input type="hidden" class="form-control  edit-product" id="name" name="id"  >

                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Name</label>
                                <input type="text" class="form-control  edit-product" id="name" name="name" >

                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Price</label>
                                <input type="text" class="form-control  edit-product" id="price" name="price"  >

                            </div>
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Description</label>
                                <input type="text" class="form-control  edit-product" id="description" name="description" >

                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Image</label>
                                <input type="text" class="form-control  edit-product" id="image" name="image" >

                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Create Date</label>
                                <input type="date" class="form-control  edit-product" id="date" name="date" >

                            </div>

                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Category</label>
                                <select name="category"class="form-select  edit-product" aria-label="Default select example">

                                    <c:forEach items="${sessionScope.listCategories}" var="C">
                                        <option class="options" value="${C.id}">${C.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <button onclick="submitForm('${P.id}')" type="button" class="btn btn-primary">Submit</button>  
                        </form>
                    </div>
                </div>

            </div>
        </div>
        <script>
            function modal(id, position, transform) {
                var box = document.getElementById(id);
                var modal = document.getElementsByClassName('modal');
                modal[position].style.transform = transform;
                box.style.transform = transform;
            }

            function submitForm(id) {
                var url = "delete-product?productID=" + id;
                var form = document.getElementById("edit-product-form");

                var flag = true;

                // check
                var reg = /^-?\d+\.?\d*$/;
                var price = document.getElementById("price");
                if (!reg.test(price.value)) {
                    flag = false;
                    createNotify("warning", "Warning", "Price must contains only number", true);

                }


                if (flag) {
                    form.submit();
                }

            }

            function editProduct(event, id) {
                var button = event.target;
//                button.preventDefault();

                var url = "update-product?productID=" + id;

                fetch(url).then(reponse => reponse.json())
                        .then(result => {
                            var product = result.product;
                            var editFields = document.getElementsByClassName("edit-product");

                            editFields[0].innerHTML = product.id;
                            editFields[1].value = product.id;
                            editFields[2].value = product.name;
                            editFields[3].value = product.price;
                            editFields[4].value = product.description;
                            editFields[5].value = product.image;
                            editFields[6].value = product.createDate;

                            var options = document.getElementsByClassName("options");
                            for (var i = 0; i < options.length; i++) {
                                var option = parseInt(options[i].value);
                                if (option === product.categoryID) {
                                   
                                    options[i].selected = "selected";
                                }
                            }
                        });

                modal('edit-product-modal', 0, 'scale(1)');

            }

            function createNotify(status, title, text, autoClose) {
                new Notify({
                    status: status,
                    title: title,
                    text: text,
                    effect: 'slide',
                    speed: 300,
                    customClass: '',
                    customIcon: '',
                    showIcon: true,
                    showCloseButton: true,
                    autoclose: autoClose,
                    autotimeout: 5000,
                    gap: 10,
                    distance: 20,
                    type: 1,
                    position: 'right bottom',
                    customWrapper: ''
                })
            }


        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/scripts_1.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../assets/chart-area-demo.js"></script>
        <script src="../assets/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
    </body>
</html>

