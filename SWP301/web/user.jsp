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
    <title>Users | Graindashboard UI Kit</title>

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
                                <a href="#">Users</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">All Users</li>
                        </ol>
                    </nav>
                    <!-- End Breadcrumb -->

                    <div class="mb-3 mb-md-4 d-flex justify-content-between">
                        <div class="h3 mb-0">Users</div>
                    </div>


                    <!-- Users -->
                    <div class="table-responsive-xl">
                        <table class="table text-nowrap mb-0">
                            <thead>
                            <tr>
                                <th class="font-weight-semi-bold border-top-0 py-2">Stt</th>
                                <th class="font-weight-semi-bold border-top-0 py-2">Tên</th>
                                <th class="font-weight-semi-bold border-top-0 py-2">Sdt</th>
                                <th class="font-weight-semi-bold border-top-0 py-2">Đăng kí ngày</th>
                                <th class="font-weight-semi-bold border-top-0 py-2">Role</th>
                                <th class="font-weight-semi-bold border-top-0 py-2">Actions</th>
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
                                    <span class="badge badge-pill badge-success">Customer</span>
                                    </c:if>
                                    <c:if test="${u.roleId ==2}">
                                    <span class="badge badge-pill badge-warning">Staff</span>
                                    </c:if>
                                </td>
                                <td class="py-3">
                                    <div class="position-relative">
                                        <a class="link-dark d-inline-block" href="detailUser?id=${u.uId}">
                                            <i class="gd-pencil icon-text"></i>
                                        </a>
                                        <a class="link-dark d-inline-block" href="delete?id=${u.getuId()}">
                                            <i class="gd-trash icon-text"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                             
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="card-footer d-block d-md-flex align-items-center d-print-none">
                            <div class="d-flex mb-2 mb-md-0">Showing 1 to 8 of 24 Entries</div>

                            <nav class="d-flex ml-md-auto d-print-none" aria-label="Pagination"><ul class="pagination justify-content-end font-weight-semi-bold mb-0">				<li class="page-item">				<a id="datatablePaginationPrev" class="page-link" href="#!" aria-label="Previous"><i class="gd-angle-left icon-text icon-text-xs d-inline-block"></i></a>				</li><li class="page-item d-none d-md-block"><a id="datatablePaginationPage0" class="page-link active" href="#!" data-dt-page-to="0">1</a></li><li class="page-item d-none d-md-block"><a id="datatablePagination1" class="page-link" href="#!" data-dt-page-to="1">2</a></li><li class="page-item d-none d-md-block"><a id="datatablePagination2" class="page-link" href="#!" data-dt-page-to="2">3</a></li><li class="page-item">				<a id="datatablePaginationNext" class="page-link" href="#!" aria-label="Next"><i class="gd-angle-right icon-text icon-text-xs d-inline-block"></i></a>				</li>				</ul></nav>
                        </div>
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

</body>
</html>
