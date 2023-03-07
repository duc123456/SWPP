<%-- 
    Document   : EditProduct
    Created on : Feb 21, 2023, 4:01:42 PM
    Author     : nhant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Thêm sản phẩm</title>

        <link rel="shortcut icon" type="image/x-icon" href="assetsEM/img/favicon.png">

        <link rel="stylesheet" href="assetsEM/css/bootstrap.min.css">

        <link rel="stylesheet" href="assetsEM/css/font-awesome.min.css">

        <link rel="stylesheet" href="assetsEM/css/feathericon.min.css">

        <link rel="stylesheet" href="assetsEM/plugins/morris/morris.css">

        <link rel="stylesheet" href="assetsEM/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">

            <div class="header">

                <div class="header-left">
                    <a href="listproduct" class="logo">
                        <img src="assetsEM/img/logotivi.png" alt="Logo">
                    </a>
                  
                </div>

                <a href="javascript:void(0);" id="toggle_btn">
                    <i class="fe fe-text-align-left"></i>
                </a>


                <a class="mobile_btn" id="mobile_btn">
                    <i class="fa fa-bars"></i>
                </a>


                <ul class="nav user-menu">

                    <li class="nav-item dropdown noti-dropdown">
                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                            <i class="fa fa-bell"></i> <span class="badge badge-pill">3</span>
                        </a>
                        <div class="dropdown-menu notifications">
                            <div class="topnav-dropdown-header">
                                <span class="notification-title">Notifications</span>
                                <a href="javascript:void(0)" class="clear-noti"> Clear All </a>
                            </div>
                            <div class="noti-content">
                                <ul class="notification-list">
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assetsEM/img/profiles/avatar-02.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Carlson Tech</span> has approved <span class="noti-title">your estimate</span></p>
                                                    <p class="noti-time"><span class="notification-time">4 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assetsEM/img/profiles/avatar-11.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">International Software Inc</span> has sent you a invoice in the amount of <span class="noti-title">$218</span></p>
                                                    <p class="noti-time"><span class="notification-time">6 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assetsEM/img/profiles/avatar-17.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">John Hendry</span> sent a cancellation request <span class="noti-title">Apple iPhone XR</span></p>
                                                    <p class="noti-time"><span class="notification-time">8 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li class="notification-message">
                                        <a href="#">
                                            <div class="media d-flex">
                                                <span class="avatar avatar-sm flex-shrink-0">
                                                    <img class="avatar-img rounded-circle" alt="User Image" src="assetsEM/img/profiles/avatar-13.jpg">
                                                </span>
                                                <div class="media-body flex-grow-1">
                                                    <p class="noti-details"><span class="noti-title">Mercury Software Inc</span> added a new product <span class="noti-title">Apple MacBook Pro</span></p>
                                                    <p class="noti-time"><span class="notification-time">12 mins ago</span></p>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="topnav-dropdown-footer">
                                <a href="#">View all Notifications</a>
                            </div>
                        </div>
                    </li>


                    <li class="nav-item dropdown has-arrow">
                        <a href="#" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                            <span class="user-img"><img class="rounded-circle" src="assetsEM/img/profiles/avatar-01.jpg" width="31" alt="Seema Sisty"></span>
                        </a>
                        <div class="dropdown-menu">
                            <div class="user-header">
                                <div class="avatar avatar-sm">
                                    <img src="assetsEM/img/profiles/avatar-01.jpg" alt="User Image" class="avatar-img rounded-circle">
                                </div>
                                <div class="user-text">
                                    <h6>Seema Sisty</h6>
                                    <p class="text-muted mb-0">Administrator</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="Profile.jsp">My Profile</a>

                            <a class="dropdown-item" href="login.jsp">Logout</a>
                        </div>
                    </li>

                </ul>

            </div>


            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">
                            </li>
                            <li>
                                <a href="index.html"><i class="fe fe-home"></i> <span>Trang chủ</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fe fe-users"></i> <span> Hành động</span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="loadProduct" class="active">Sản phẩm</a></li>
                                    <li><a href="AddProduct.jsp">Thêm sản phẩm</a></li>

                                </ul>
                            </li>


                           

                        </ul>
                    </div>
                </div>
            </div>


            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">

                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="listProduct">Home</a></li>
                                    <li class="breadcrumb-item active">Thêm sản phẩm</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Thêm sản phẩm</h4>
                                </div>

                                <div class="card-body">
                                    <form action="addproduct">

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Tên</label>
                                            <div class="col-md-10">
                                                <input name="name" type="text" class="form-control" required="">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giá Nhap</label>
                                            <div class="col-md-10">
                                                <input name="price" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giá Ban</label>
                                            <div class="col-md-10">
                                                <input name="priceout" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Màu sắc</label>
                                            <div class="col-md-10">
                                                <select name="color" class="form-control form-select">
                                                    <option  value="Ðen">Màu đen</option>
                                                    <option  value="Ðỏ">Màu đỏ</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Năm bảo hành</label>
                                            <div class="col-md-10">
                                                <input name="insurance" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Kích thước</label>
                                            <div class="col-md-10">
                                                <input name="size" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Số lượng</label>
                                            <div class="col-md-10">
                                                <input name="quantity" type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giảm giá</label>
                                            <div class="col-md-10">
                                                <input name="discount"  type="text" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Loại Tivi</label>
                                            <div class="col-md-10">
                                                <select name="tid" class="form-control form-select">
                                                    <option  value="1">Smart TV</option>
                                                    <option  value="2">LED</option>
                                                    <option  value="3">QLED</option>
                                                    <option  value="4">QLED</option>
                                                    <option  value="5">Android TV</option>
                                                    <option  value="6">Nano Cell</option>
                                                    <option  value="7">TV man hinh cong</option>
                                                    <option  value="8">Tivi Khung Tranh</option>
                                                    <option  value="9">QNED</option>

                                                </select>
                                            </div>
                                        </div>

                                       
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Hang Tivi</label>
                                            <div class="col-md-10">
                                                <select name="catid" class="form-control form-select">

                                                    <option  value="1">Samsung</option>
                                                    <option  value="2">Sharp</option>
                                                    <option  value="3">Casper</option>
                                                    <option  value="4">TCL</option>
                                                    <option  value="5">LG</option>
                                                    <option  value="6">Xiaomi</option>
                                                    <option  value="7">Sony</option>
                                                    <option  value="8">Coocaa</option>
                                                    <option  value="9">FFalcon</option>
                                                    <option  value="10">Coex</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Resolution</label>
                                            <div class="col-md-10">
                                                <div class="radio">
                                                    <label>
                                                        <input name="resolution" value="HD"  type="radio"> HD
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="resolution" value="4K" > 4K
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="radio"> Option 3
                                                    </label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Mô tả</label>
                                            <div class="col-md-10">
                                                <textarea name="description" rows="5" cols="5" class="form-control" placeholder="Enter text here"></textarea>
                                            </div>
                                        </div>

                                        <button class="btn btn-primary" type="submit">Xác nhận</button>
                                    </form>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>


        <script src="assetsEM/js/jquery-3.6.0.min.js"></script>

        <script src="assetsEM/js/bootstrap.bundle.min.js"></script>

        <script src="assetsEM/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assetsEM/js/script.js"></script>
    </body>
</html>