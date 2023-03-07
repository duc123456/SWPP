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
        <title>Quản lý sản phẩm</title>

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
                    <a href="index.html" class="logo logo-small">
                        <img src="assetsEM/img/logo-small.png" alt="Logo" width="30" height="30">
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
                                    <h6>${sessionScope.acc.fName}</h6>
                                    <p class="text-muted mb-0">Administrator</p>
                                </div>
                            </div>
                            <a class="dropdown-item" href="Profile.jsp">My Profile</a>

                            <a class="dropdown-item" href="login.jsp">Logout</a>
                        </div>
                    </li>

                </ul>

            </div>



            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">
                                <h3 class="page-title">Sửa sản phẩm</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                    <li class="breadcrumb-item active">Basic Inputs</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <form action="editproduct" method = "post">
                                    <c:set var="details" value="${requestScope.details}"/>
                                    <div class="card-header">
                                        <h4 class="card-title">Sửa sản phẩm</h4>
                                    </div>

                                    <div class="card-body">
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">ID</label>
                                            <div class="col-md-10">
                                                <input type="text" name="pid" value="${details.pId}" class="form-control" readonly="">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Tên</label>
                                            <div class="col-md-10">
                                                <input type="text" name="pname" value="${details.name}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giá Nhập</label>
                                            <div class="col-md-10">
                                                <input type="text" name="price" value="${details.priceIn}" class="form-control">

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giá Bán</label>
                                            <div class="col-md-10">
                                                <input type="text" name="priceout" value="${details.priceOut}" class="form-control">

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Màu sắc</label>
                                            <div class="col-md-10">
                                                <input type="text" name="color" value="${details.color}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Bảo hành</label>
                                            <div class="col-md-10">
                                                <input type="text" name="insurance" value="${details.insurance}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Kích thước</label>
                                            <div class="col-md-10">
                                                <input type="text" name="size" value="${details.size}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Số lượng</label>
                                            <div class="col-md-10">
                                                <input type="text" name="quantity" value="${details.quantity}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giảm giá</label>
                                            <div class="col-md-10">
                                                <input type="text" name="discount" value="${details.discount}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Loai Tivi</label>
                                            <div class="col-md-10">
                                                <select  name="tid" class="form-control form-select">
                                                    <option value="${details.type.tId}" checked>${details.type.tName}</option>
                                                    <c:forEach items="${typec}" var="ty">

                                                        <option  value="${ty.tId}">${ty.tName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Hang Tivi</label>
                                            <div class="col-md-10">
                                                <select  name="catid" class="form-control form-select">
                                                    <option value="${details.cat.cid}" checked>${details.cat.cName}</option>
                                                    <c:forEach items="${listCC}" var="o">
                                                        <option  value="${o.cid}">${o.cName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Man Hinh</label>
                                            <div class="col-md-10">
                                                <div class="radio">
                                                    <label>
                                                        <input name="resolution" value="HD"  type="radio" checked> HD
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="resolution" value="4K" > 4K
                                                    </label>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Description</label>
                                            <div class="col-md-10">
                                                <textarea rows="5" cols="5" value=""  name="description"  class="form-control">${details.description}</textarea>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary" type="submit">Xác nhận</button>
                                    </div>

                                </form>
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