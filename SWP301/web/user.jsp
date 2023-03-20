<%-- 
    Document   : user
    Created on : Feb 15, 2023, 6:59:42 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Title -->
        <title>Tài khoản</title>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <!-- Favicon -->
        <link rel="shortcut icon" href="public/img/favicon.ico">

        <!-- Template -->
        <link rel="stylesheet" href="public/graindashboard/css/graindashboard.css">
        <style>
            .ten {
                max-width: 3ch;
                overflow: hidden;
                text-overflow: hidden;
                white-space: unset;
            }
            .custom-dropdown {
                position: relative;
                display: inline-block;
                vertical-align: middle;
                margin: 10px; /* demo only */
            }

            .custom-dropdown select {
                background-color: #377dff;
                color: #fff;
                font-size: inherit;
                padding: .5em;
                padding-right: 2.5em;
                border: 0;
                margin: 0;
                border-radius: 3px;
                text-indent: 0.01px;
                text-overflow: '';
                -webkit-appearance: button; /* hide default arrow in chrome OSX */
            }

            .custom-dropdown::before,
            .custom-dropdown::after {
                content: "";
                position: absolute;
                pointer-events: none;
            }

            .custom-dropdown::after { /*  Custom dropdown arrow */
                content: "\25BC";
                height: 1em;
                font-size: .625em;
                line-height: 1;
                right: 1.2em;
                top: 50%;
                margin-top: -.5em;
            }

            .custom-dropdown::before { /*  Custom dropdown arrow cover */
                width: 2em;
                right: 0;
                top: 0;
                bottom: 0;
                border-radius: 0 3px 3px 0;
            }

            .custom-dropdown select[disabled] {
                color: rgba(0,0,0,.3);
            }

            .custom-dropdown select[disabled]::after {
                color: rgba(0,0,0,.1);
            }

            .custom-dropdown::before {
                background-color: rgba(0,0,0,.15);
            }

            .custom-dropdown::after {
                color: rgba(0,0,0,.4);
            }
        </style>
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
                                            <a href="user">Tài khoản</a>
                                        </li>
                                        <li class="breadcrumb-item active" aria-current="page">Tất cả tài khoản</li>
                                    </ol>
                                </nav>
                                <!-- End Breadcrumb -->

                                <div class="mb-3 mb-md-4 d-flex justify-content-between">
                                    <div class="h3 mb-0">Tài khoản</div>
                                </div>


                                <!-- Users -->
                                <form action="user" id="role">
                                    <span class="custom-dropdown big" style="background-color: #377dff; margin: 0px">
                                        <select name="role" onchange="this.form.submit()" style="min-height: 30px">
                                            <option  value="0">--lựa chọn--</option>
                                            <option ${(requestScope.role==0)?'selected':''} value="0">Tất cả</option>
                                        <option ${(requestScope.role==1)?'selected':''} value="1">Khách hàng</option>
                                        <option ${(requestScope.role==2)?'selected':''} value="2">Nhân viên nhập hàng</option>
                                        <option ${(requestScope.role==3)?'selected':''} value="3">Nhân viên bán hàng</option>
                                        <option ${(requestScope.role==5)?'selected':''} value="5">Đã bị chặn</option>
                                        <option></option>
                                    </select></span>
                            </form>
                            <div class="table-responsive-xl">
                                <table class="table text-nowrap mb-0">
                                    <thead>
                                        <tr>
                                            <th class="font-weight-semi-bold border-top-0 py-2">Stt</th>
                                            <th class="font-weight-semi-bold border-top-0 py-2">Tên</th>
                                            <th class="font-weight-semi-bold border-top-0 py-2">Sdt</th>
                                            <th class="font-weight-semi-bold border-top-0 py-2">Đăng kí ngày</th>
                                            <th class="font-weight-semi-bold border-top-0 py-2">Vai trò</th>
                                            <th class="font-weight-semi-bold border-top-0 py-2">Tác động</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <jsp:useBean id="a" class="dal.DAO" scope="request"></jsp:useBean>

                                        <c:set var = "i" value = "${1}"/>
                                        <c:forEach items="${users}"  var="u">

                                            <tr>

                                                <td class="py-3">${i}</td>
                                                <c:set var = "i" value = "${i+1}"/>
                                                <td class="align-middle py-3">
                                                    <div class="d-flex align-items-center">
                                                        <div class="position-relative mr-2">
                                                            <span class="indicator indicator-lg indicator-bordered-reverse indicator-top-left indicator-success rounded-circle"></span>
                                                            <!--img class="avatar rounded-circle" src="#" alt="John Doe"-->

                                                            <span class="avatar-placeholder mr-md-2 ten">${u.uId}</span>
                                                        </div>
                                                        ${u.getfName()} ${u.getlName()}
                                                    </div>
                                                </td>
                                                <td class="py-3">${u.phone}</td>
                                                <td class="py-3">${u.createDate}</td>
                                                <td class="py-3">
                                                    <c:if test="${u.roleId==1}">
                                                        <span class="badge badge-pill badge-primary">Khách hàng</span>
                                                    </c:if>
                                                    <c:if test="${u.roleId ==2}">
                                                        <span class="badge badge-pill badge-warning">Nhân viên nhập hàng</span>
                                                    </c:if>
                                                    <c:if test="${u.roleId ==3}">
                                                        <span class="badge badge-pill badge-success">Nhân viên duyệt đơn</span>
                                                    </c:if>
                                                    <c:if test="${u.roleId ==5}">
                                                        <span class="badge badge-pill badge-danger">Người dùng bị chặn</span>
                                                    </c:if>
                                                </td>
                                                <td class="py-3">
                                                    <div class="position-relative">
                                                        <a class="link-dark d-inline-block" href="detailUser?id=${u.uId}">
                                                            <i class="gd-pencil icon-text"></i>
                                                        </a>                                     

                                                        <a class="link-dark d-inline-block" href="#" onclick="confirmDelete(${u.uId})"><i class="gd-trash icon-text"></i></a>



                                                    </div>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                            <!-- End Users -->

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
        <script type="text/javascript">
                                                            function change() {
                                                                document.getElementById("role").submit();

                                                            }
        </script>
        <script>
            function confirmDelete(userId) {
                if (confirm("Bạn có chắc chắn muốn xóa người dùng này?")) {
                    window.location.href = `delete?id=` + userId;
                }
            }
        </script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>

    </body>
</html>
