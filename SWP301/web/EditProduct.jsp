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
                    <a href="index.html" class="logo">
                        <img src="assetsEM/img/logo.png" alt="Logo">
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
                                <a href="index.html"><i class="fe fe-home"></i> <span>Dashboard</span></a>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fe fe-users"></i> <span> Users</span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="users.html">Users</a></li>
                                    <li><a href="blocked-users.html">Blocked User</a></li>
                                    <li><a href="report-users.html">Report User</a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fe fe-sync"></i> <span> History </span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="call-history.html"> Call History </a></li>
                                    <li><a href="group-history.html"> Group History </a></li>
                                </ul>
                            </li>


                            <li class="submenu">
                                <a href="#"><i class="fe fe-layout"></i> <span> Forms <span class="menu-arrow"></span></span></a>
                                <ul style="display: none;">
                                    <li><a href="form-basic-inputs.html" class="active">Basic Inputs</a></li>
                                    <li><a href="form-input-groups.html">Input Groups</a></li>
                                    <li><a href="form-horizontal.html">Horizontal Form</a></li>
                                    <li><a href="form-vertical.html">Vertical Form </a></li>
                                    <li><a href="form-mask.html">Form Mask</a></li>
                                    <li><a href="form-validation.html">Form Validation </a></li>
                                </ul>
                            </li>
                            <li class="submenu">
                                <a href="#"><i class="fe fe-table"></i> <span> Tables <span class="menu-arrow"></span></span></a>
                                <ul style="display: none;">
                                    <li><a href="tables-basic.html">Basic Tables </a></li>
                                    <li><a href="data-tables.html">Data Table </a></li>
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
                                <h3 class="page-title">Edit Product</h3>
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
                                <div class="card-header">
                                    <h4 class="card-title">Edit Product</h4>
                                </div>
                                <form action="edit" >
                                    <div class="card-body">

                                        <label>ID</label>
                                        <input value="${detail.pId}" name="pId" type="text" class="form-control" readonly required>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Name</label>
                                            <div class="col-md-10">
                                                <input type="text" name="name" value="${detail.name}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Price</label>
                                            <div class="col-md-10">
                                                <input type="text" name="name" value="${detail.price}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Color</label>
                                            <div class="col-md-10">
                                                <input type="text" name="color" value="${detail.color}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Insurance</label>
                                           <div class="col-md-10">
                                                <input type="text" name="insurance" value="${detail.isnurance}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Size</label>
                                            <div class="col-md-10">
                                                <input type="text" name="size" value="${detail.size}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Quantity</label>
                                             <div class="col-md-10">
                                                <input type="text" name="quantity" value="${detail.quantity}" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Discount</label>
                                            <div class="col-md-10">
                                                <input type="text" name="discount" value="${detail.discount}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">TID</label>
                                            <div class="col-md-10">
                                                <select class="form-control form-select">
                                                    <c:forEach items="${typec}" var="ty">
                                                        <option  value="${ty.tId}">${ty.tName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">File Input</label>
                                            <div class="col-md-10">
                                                <input class="form-control" type="file">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">TID</label>
                                            <div class="col-md-10">
                                                <select class="form-control form-select">
                                                    <c:forEach items="${listCC}" var="o">
                                                        <option  value="${o.cid}">${o.cName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Resolution</label>
                                            <div class="col-md-10">
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="radio"> Option 1
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="radio"> Option 2
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
                                            <label class="col-form-label col-md-2">Description</label>
                                            <div class="col-md-10">
                                                <textarea rows="5" cols="5" value="${detail.description}"  name="description"  class="form-control" placeholder="Enter text here"></textarea>
                                            </div>
                                        </div>


                                        <button class="btn btn-primary" type="submit">Button</button>
                                    </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>


    <script src="assetsEM/js/jquery-3.6.0.min.js"></script>

    <script src="assetsEM/js/bootstrap.bundle.min.js"></script>

    <script src="assetsEM/plugins/slimscroll/jquery.slimscroll.min.js"></script>

    <script src="assetsEM/js/script.js"></script>
</body>
</html>


