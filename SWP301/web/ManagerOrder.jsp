<%-- 
    Document   : ManagerOrder
    Created on : Mar 8, 2023, 9:42:12 PM
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
    <jsp:include page="MenuManagerOrder.jsp"></jsp:include>
        <body>
            <div class="main-wrapper">

                <div class="page-wrapper">
                    <div class="content container-fluid">
                        <div class="row">
                            <div class="col-xl-4 col-sm-4 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dash-widget-header">
                                            <span class="dash-widget-icon bg-primary">
                                                <i class="fe fe-users"></i>
                                            </span>
                                            <div class="dash-count">
                                                <a href="#" class="count-title">User Count</a>
                                                <a href="#" class="count"> 10,320</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-sm-4 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dash-widget-header">
                                            <span class="dash-widget-icon bg-warning">
                                                <i class="fe fe-phone"></i>
                                            </span>
                                            <div class="dash-count">
                                                <a href="#" class="count-title">Call Duration</a>
                                                <a href="#" class="count"> 14,628</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-4 col-sm-4 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dash-widget-header">
                                            <span class="dash-widget-icon bg-danger">
                                                <i class="fe fe-comments"></i>
                                            </span>
                                            <div class="dash-count">
                                                <a href="#" class="count-title">Chat Count</a>
                                                <a href="#" class="count"> 2,980</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12 d-flex">

                                <div class="card card-table flex-fill">
                                    <div class="card-header">
                                        <h4 class="card-title float-start">Danh sách đặt hàng</h4>
                                        <form id="myForm" action="findstatus">
                                            <div class="table-search float-end">
                                                <select name="statusid" class="form-control form-select" onchange="submitForm()">

                                                    <option value="0">--Lựa chọn--</option>
                                                    <option value="1">Chưa xác nhận</option>
                                                    <option value="2">Ðã xác nhận</option>
                                                </select>
                                            </div>
                                        </form>


                                    </div>
                                    <div class="card-body">
                                        <div class="table-responsive no-radius">
                                            <table class="table table-hover table-center">
                                                <thead>
                                                    <tr>
                                                        <th>Số thứ tự</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th class="text-center">Ngày đặt hàng</th>
                                                        <th class="text-center">Tổng số tiền</th>
                                                        <th class="text-end">Trạng thái</th>
                                                        <th class="text-end">Hành động</th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                <c:forEach items="${listOD}" var="o">
                                                    <tr>
                                                        <td class="text-nowrap">
                                                            <div class="font-weight-600">${o.logID}</div>

                                                        </td>
                                                        <c:if test="${empty o.order.address}">
                                                            <td class="text-nowrap">${o.confirm}</td>
                                                        </c:if>
                                                        <c:if test="${not empty o.order.address}">
                                                            <td class="text-nowrap">${o.order.oId}</td>
                                                        </c:if>

                                                        <td class="text-center">${o.date}</td>
                                                        <td class="text-center">
                                                            ${o.date}
                                                        </td>

                                                        <c:if test="${o.statusId == 1}">
                                                            <td class="text-end">
                                                                <div class="font-weight-600 text-danger">Chờ xác nhận</div>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${o.statusId == 2}">
                                                            <td class="text-end">
                                                                <div class="font-weight-600 text-success">Đã xác nhận</div>
                                                            </td>
                                                        </c:if>
                                                        <c:if test="${o.statusId == 3}">
                                                            <td class="text-end">
                                                                <div class="font-weight-600 text-success">Đã nhận</div>
                                                            </td>
                                                        </c:if>
                                                <form action="editorder" method = "post">
                                                    <input type="hidden" name="oid" value="${o.logID}" class="form-control" readonly="">
                                                    <td class="text-end">
                                                        <div class="actions">
                                                            <c:if test="${o.statusId == 1}">
                                                                <button value="2" name="status"  class="btn btn-sm bg-success-light me-2" title="Accepted">
                                                                    <i class="fe fe-check"></i>
                                                                </button>
                                                                <button value="1" name="status" class="btn btn-sm bg-danger-light" title="Declined">
                                                                    <i class="fe fe-close"></i>
                                                                </button>
                                                            </c:if>
                                                            <c:if test="${o.statusId == 2}">
                                                                <i class="fe fe-check"></i>
                                                            </c:if>
                                                        </div>
                                                    </td>
                                                    </tr>
                                                </form>
                                            </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>
        <script>
            function submitForm() {
                document.getElementById("myForm").submit();
            }
        </script>


        <script src="assetsEM/js/jquery-3.6.0.min.js"></script>

        <script src="assetsEM/js/bootstrap.bundle.min.js"></script>

        <script src="assetsEM/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assetsEM/js/script.js"></script>
    </body>
</html>