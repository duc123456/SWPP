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
    <title>Tao tai khoan</title>

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
                        <div class="h3 mb-0">Thông tin người dùng</div>
                    </div>


                    <!-- Form -->
                    <c:if test="${ user.getRoleId() == 5 || user.getRoleId() == 1}">
                    <div>
                        <form action="editrole" id="myForm">
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Tài khoản</label>
                                    <input type="text" class="form-control" readonly value="${user.getUsername()}" id="password" name="username" placeholder="Tài khoản">
                                <input type="text" class="form-control" hidden value="${user.getuId()}" id="id" name="id" placeholder="Tài khoản">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Mật khẩu</label>
                                    <input type="password" class="form-control" readonly value="${user.getPass()}" id="password_confirm" name="password" placeholder="Mật khẩu">
                                </div>
                            </div>
                            <div class="form-row">   
                                <div class="form-group col-12 col-md-5">
                                    <label for="email">Tên</label>
                                    <input type="email" class="form-control" readonly value="${user.getfName()}" id="email" name="fname" placeholder="Tên">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="email">Họ</label>
                                    <input type="email" class="form-control" readonly value="${user.getlName()}" id="email" name="lname" placeholder="Họ">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Email</label>
                                    <input type="text" class="form-control" readonly value="${user.getEmail()}" id="password" name="email" placeholder="Email">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Số điện thoại</label>
                                    <input type="text" class="form-control" readonly value="${user.getPhone()}" id="password_confirm" name="phone" placeholder="Số điện thoại">
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Ngày sinh</label>
                                    <input type="text" class="form-control" readonly value="${user.getDob().substring(0,10)}" id="password" name="dob" placeholder="Ngày sinh">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Giới tính</label>
                                    <input type="text" class="form-control" readonly value="${user.isGender()}" id="password" name="gender" placeholder="Giới tính">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Địa chỉ</label>
                                    <input type="text" class="form-control" readonly value="${user.getAddress()}" id="password" name="address" placeholder="Địa chỉ">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Ngày tạo tài khoản</label>
                                    <input type="text" class="form-control" readonly value="${user.getCreateDate().substring(0,10)}" id="password_confirm" name="createDate" placeholder="Ngày tạo tài khoản">
                                </div>
                            </div>    
                             <div class="form-row">
                                    
                                            
                                        <div class="custom-control custom-switch mb-2" style="padding-left: 0px">
                                            
                                            <input type="text"  name="role" value="${(user.getRoleId() == 5)?'1':'5'}"class="custom-control-input" >
                                            <div class="col-md-4" style="padding-left: 5px"><button type="submit" id="myButton" class="btn btn-danger" style="background-color: #FFF; color: #377dff;border-color: #377dff;border-radius: 5px;min-width:90px">${(user.getRoleId()==5)?'Bỏ chặn':'Chặn'}</button></div>
                                        </div>
                                                
                            </div>    
                            </form>                    
                    </div>
                                        </c:if>
                    <!-- End Form -->
                    <!-- Form -->
                    <c:if test="${ user.getRoleId() == 2 || user.getRoleId() == 3}">
                    <div>
                        <form action="editrole" id="myForm">
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Tài khoản</label>
                                    <input type="text" class="form-control"  value="${user.getUsername()}" id="password" name="username" placeholder="Tài khoản">
                                <input type="text" class="form-control" hidden value="${user.getuId()}" id="id" name="id" placeholder="Tài khoản">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Mật khẩu</label>
                                    <input type="password" class="form-control"  value="${user.getPass()}" id="password_confirm" name="password" placeholder="Mật khẩu">
                                </div>
                            </div>
                            <div class="form-row">   
                                <div class="form-group col-12 col-md-5">
                                    <label for="email">Tên</label>
                                    <input type="text" class="form-control"  value="${user.getfName()}" id="name" name="fname" placeholder="Tên">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="email">Họ</label>
                                    <input type="text" class="form-control"  value="${user.getlName()}"  name="lname" placeholder="Họ">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Email</label>
                                    <input type="email" class="form-control"  value="${user.getEmail()}" id="password" name="email" placeholder="Email">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Số điện thoại</label>
                                    <input type="text" class="form-control" value="${user.getPhone()}" id="password_confirm" name="phone" placeholder="Số điện thoại">
                                </div>
                            </div>
                            
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Ngày sinh</label>
                                    <input type="text" class="form-control"  value="${user.getDob().substring(0,10)}" id="password" name="dob" placeholder="Ngày sinh">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Giới tính</label>
                                    <input type="text" class="form-control"  value="${user.isGender()}" id="password" name="gender" placeholder="Giới tính">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-12 col-md-5">
                                    <label for="password">Địa chỉ</label>
                                    <input type="text" class="form-control"  value="${user.getAddress()}" id="password" name="address" placeholder="Địa chỉ">
                                </div>
                                <div class="form-group col-12 col-md-5">
                                    <label for="password_confirm">Ngày tạo tài khoản</label>
                                    <input type="text" class="form-control"  value="${user.getCreateDate().substring(0,10)}" id="password_confirm" name="createDate" placeholder="Ngày tạo tài khoản">
                                </div>
                            </div>    
                             <div class="form-row">
                                    
                                            
                                 <div class="custom-control custom-switch mb-2" style="padding-left: 0px">
                                            
                                            <input type="text"  name="role" value="${(user.getRoleId() == 2)?'3':'2'}"class="custom-control-input" >
                                            <div class="col-md-4" style="padding-left: 5px"><button type="submit" id="myButton" class="btn btn-danger" style="background-color: #FFF; color: #377dff;border-color: #377dff;border-radius: 5px;min-width:180px">${(user.getRoleId()==2)?'Chuyển nhân viên nhập hàng':' Chuyển nhân viên thanh toán'}</button></div>
                                        </div>
                                                
                            </div>    
                            </form>                    
                    </div>
                                        </c:if>
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
<script>
  var checkbox = document.getElementById('randomPassword');
  checkbox.addEventListener('change', function() {
    document.getElementById('myForm').submit();
  });
</script>

    

</body>
</html>
