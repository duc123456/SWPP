<%-- 
    Document   : editUser
    Created on : Feb 28, 2023, 9:20:44 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Title -->
    <title>Create User | Graindashboard UI Kit</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="public/img/favicon.ico">

    <!-- Template -->
    <link rel="stylesheet" href="public/graindashboard/css/graindashboard.css">
</head>

<body class="has-sidebar has-fixed-sidebar-and-header">
<!-- Header -->
<jsp:include page="menudash.jsp"></jsp:include>
<!-- End Header -->

<main class="main">
    <!-- Sidebar Nav -->
   <jsp:include page="sidebarDash.jsp"></jsp:include>
    <!-- End Sidebar Nav -->

    <div class="content">
        <div class="py-4 px-3 px-md-4">
            <div class="card mb-3 mb-md-4">

                <div class="card-body">
                    <!-- Breadcrumb -->
                    <nav class="d-none d-md-block" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Users</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Infomation</li>
                        </ol>
                    </nav>
                    <!-- End Breadcrumb -->

                    <div class="mb-3 mb-md-4 d-flex justify-content-between">
                        <div class="h3 mb-0">Infomation  User</div>
                    </div>


                    <!-- Form -->
                    <div>
                        <form action="editrole">
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">User Name</label>
                                    <input type="text" class="form-control" readonly value="${user.getUsername()}" id="password" name="password" placeholder="User Name">
                                <input type="text" class="form-control" hidden value="${user.getuId()}" id="id" name="id" placeholder="User Name">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Password</label>
                                    <input type="password" class="form-control" readonly value="${user.getPass()}" id="password_confirm" name="password_confirm" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-row">
                                
                                
                                <div class="form-group col-12 col-md-5">
                                    <label for="email">First Name</label>
                                    <input type="email" class="form-control" readonly value="${user.getfName()}" id="email" name="email" placeholder="User First Name">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="email">Last Name</label>
                                    <input type="email" class="form-control" readonly value="${user.getlName()}" id="email" name="email" placeholder="User Last Name">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Email</label>
                                    <input type="password" class="form-control" readonly value="${user.getEmail()}" id="password" name="password" placeholder="User Email">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Phone</label>
                                    <input type="password" class="form-control" readonly value="${user.getPhone()}" id="password_confirm" name="" placeholder="User Phone">
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Date of Birth</label>
                                    <input type="text" class="form-control" readonly value="${user.getDob().substring(0,10)}" id="password" name="password" placeholder="User Date of Birth">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Gender</label>
                                    <input type="text" class="form-control" readonly value="${user.isGender()}" id="password_confirm" name="password_confirm" placeholder="User Gender">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Address</label>
                                    <input type="text" class="form-control" readonly value="${user.getAddress()}" id="password" name="password" placeholder="User Address">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Date of Create</label>
                                    <input type="text" class="form-control" readonly value="${user.getCreateDate().substring(0,10)}" id="password_confirm" name="password_confirm" placeholder="User Date of Create">
                                </div>
                            </div>    
                             <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="role">Role</label>
                                    <select name="role" class="col-md-4">
                                        <option ${(user.getRoleId()==4)?'selected':''} value="4">Block</option>
                                        <option ${(user.getRoleId()==1)?'selected':''} value="1">Customer</option>
                                        <option ${(user.getRoleId()==2)?'selected':''} value="2">Staff</option>
                                        
                                    </select>
                                </div>
                                
                            </div>    
                                
                            

                            <button type="submit" class="btn btn-primary float-right">Create</button>
                        </form>
                    </div>
                    <!-- End Form -->
                </div>
            </div>


        </div>

        <!-- Footer -->
        <footer class="small p-3 px-md-4 mt-auto">
            <div class="row justify-content-between">
                <div class="col-lg text-center text-lg-left mb-3 mb-lg-0">
                    <ul class="list-dot list-inline mb-0">
                        <li class="list-dot-item list-dot-item-not list-inline-item mr-lg-2"><a class="link-dark" href="#">FAQ</a></li>
                        <li class="list-dot-item list-inline-item mr-lg-2"><a class="link-dark" href="#">Support</a></li>
                        <li class="list-dot-item list-inline-item mr-lg-2"><a class="link-dark" href="#">Contact us</a></li>
                    </ul>
                </div>

                <div class="col-lg text-center mb-3 mb-lg-0">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-twitter-alt"></i></a></li>
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-facebook"></i></a></li>
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-github"></i></a></li>
                    </ul>
                </div>

                <div class="col-lg text-center text-lg-right">
                    &copy; 2019 Graindashboard. All Rights Reserved.
                </div>
            </div>
        </footer>
        <!-- End Footer -->
    </div>
</main>


<script src="public/graindashboard/js/graindashboard.js"></script>
<script src="public/graindashboard/js/graindashboard.vendor.js"></script>

</body>
</html>
