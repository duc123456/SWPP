<%-- 
    Document   : MenuManagerOrder
    Created on : Mar 11, 2023, 4:11:25 PM
    Author     : nhant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu</title>
    </head>
    <body>
        <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>
        <div class="header">

            <div class="header-left">
                <a href="listproduct" class="logo">
                    <img src="assetsEM/img/logotivi.png" alt="Logo  ">
                </a>
                <a href="index.html" class="logo logo-small">
                    <img src="assetsEM/img/logotivi.png" alt="Logo" width="30" height="30">
                </a>
            </div>

            <a href="javascript:void(0);" id="toggle_btn">
                <i class="fe fe-text-align-left"></i>
            </a>


            <a class="mobile_btn" id="mobile_btn">
                <i class="fa fa-bars"></i>
            </a>

            <ul class="nav user-menu">



                <li class="nav-item dropdown has-arrow">
                    <a href="Profile.jsp" class="dropdown-toggle nav-link" data-bs-toggle="dropdown">
                        <span class="user-img"><img src="uploadDir/${d.login(sessionScope.acc.username,sessionScope.acc.pass).image}" class="img-radius" style="border-radius: 100%;max-height: 150px;min-height: 50px;max-width: 150px"></span>
                    </a>
                    <div class="dropdown-menu">
                        <div class="user-header">
                            <div class="avatar avatar-sm">
                                <img src="uploadDir/${d.login(sessionScope.acc.username,sessionScope.acc.pass).image}" class="img-radius" style="border-radius: 100%;max-height: 150px;min-height: 50px;max-width: 150px">
                            </div>
                            <div class="user-text">
                                <h6>${sessionScope.acc.fName} ${sessionScope.acc.lName}</h6>
                            
                                <p class="text-muted mb-0">${sessionScope.acc.username}</p>
                            </div>
                        </div>
                        <a class="dropdown-item" href="Profile.jsp">Trang cá nhân</a>

                        <a class="dropdown-item" href="login.jsp">Đăng xuất</a>
                    </div>
                </li>

            </ul>

            <div class="sidebar" id="sidebar">
                <div class="sidebar-inner slimscroll">
                    <div id="sidebar-menu" class="sidebar-menu">
                        <ul>
                            <li class="menu-title">
                            </li>
                            <li>
                                <a href="listproduct"><i class="fe fe-home"></i> <span>Trang Home</span></a>
                            </li>
                            <li class="submenu">
                                <a href="listProduct"><i class="fe fe-users"></i> <span> Hành động</span> <span class="menu-arrow"></span></a>
                                <ul style="display: none;">
                                    <li><a href="managerorder" class="active">Đơn hàng</a></li>



                                </ul>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

