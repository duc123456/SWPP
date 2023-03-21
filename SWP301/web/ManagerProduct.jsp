<%-- 
    Document   : ManagerProduct
    Created on : Feb 21, 2023, 3:22:59 PM
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

        <link rel="shortcut icon" type="image/x-icon" href="assetsEM/img/logotivi.png">

        <link rel="stylesheet" href="assetsEM/css/bootstrap.min.css">

        <link rel="stylesheet" href="assetsEM/css/font-awesome.min.css">

        <link rel="stylesheet" href="assetsEM/css/feathericon.min.css">

        <link rel="stylesheet" href="assetsEM/plugins/morris/morris.css">

        <link rel="stylesheet" href="assetsEM/css/style.css">
    </head>

    <jsp:include page="MenuManagerProduct.jsp"></jsp:include>
        <body>
 <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>



            <div class="main-wrapper">

                <div class="page-wrapper">
                    <div class="content container-fluid">
                        <div class="row">
                            <div class="col-xl-4 col-sm-4 col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dash-widget-header">
                                            <span class="dash-widget-icon bg-primary">
                                                <i class="fe fe-desktop"></i>
                                            </span>
                                            <div class="dash-count">
                                                <a href="#" class="count-title">Số Lượng Sản Phẩm</a>
                                                <a href="#" class="count">${numberOfProducts}</a>
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
                                            <i class="fe fe-wallet"></i>
                                        </span>
                                        <div class="dash-count">
                                            <a href="#" class="count-title">
                                                Sản phẩm bảo hành trên 12 tháng
                                            </a>
                                            <a href="#" class="count">${ProductInsurance}</a>
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
                                            <i class="fe fe-star"></i>
                                        </span>
                                        <div class="dash-count">
                                            <a href="#" class="count-title">Tổng số sản phẩm</a>
                                            <a href="#" class="count"> ${ProductSum}</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="page-header">
                        <div class="row align-items-center">
                            <div class="col">
                                <h3 class="page-title">Sản phẩm</h3>
                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="listproduct">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Quản lý Sản phẩm</li>
                                </ul>


                            </div>

                        </div>
                    </div>




                    <div class="row">
                        <div class="col-md-12 d-flex">

                            <div class="card card-table flex-fill">
                                <div class="card-body">
                                    <div class="table-responsive" >

                                        <table class="table table-hover table-center mb-0">
                                            <thead>
                                                <tr>
                                                    <th >  Tên

                                                    </th>


                                                    <th>Giá Nhập</th>
                                                    <th>Giá Bán</th>
                                                    <th>Màu sắc</th>
                                                    <th>Độ phân giải</th>
                                                    <th>Bảo hành(Tháng)</th>
                                                    <th>Ngày tạo sản phẩm</th>

                                                    <th>Loại tivi</th>
                                                    <th>Hãng tivi</th>
                                                    <th>Kích thước</th>
                                                    <th>Số lượng</th>
                                                    <th>Giảm giá</th>

                                                    <th class="text-end">Hành động</th>
                                                </tr>
                                            </thead>
                                            <tbody id="data-container">

                                                <c:forEach items="${listP}" var="o">
                                                    <c:if test="${listP.size() == 0}">
                                                        <tr><td colspan="3">HẾT SẢN PHẨM</td></tr>
                                                    </c:if>
                                                    <tr>
                                                        <td>

                                                            <h2 class="table-avatar">

                                                                <a href="detail?pid=${o.pId}" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="ProductImage/${d.getProductByID(o.pId).imageDf}"></a>
                                                                <a href="detail?pid=${o.pId}">${o.name} <span>${o.pId}</span></a>
                                                            </h2>
                                                        </td>

                                                        <td>${o.priceIn}</td>
                                                        <td>${o.priceOut}</td>


                                                        <td>${o.color}</td>
                                                        <td>${o.resolution}</td>
                                                        <td>${o.insurance}</td>
                                                        <td>${o.cDate.substring(0,10)}</td>
                                                        <td>${o.getType().tName}</td>
                                                        <td>${o.getCat().cName}</td>
                                                        <td>${o.size}</td>

                                                        <td>${o.quantity}</td>
                                                        <td>${o.discount}</td>

                                                        <td class="text-end">
                                                            <div class="actions">
                                                                <a href="loadProduct?pId=${o.pId}"  title="Sửa sản phẩm" class="btn btn-sm bg-success-light me-2">
                                                                    <i class="fe fe-pencil"></i>
                                                                </a>
                                                                <a href="deleteproduct?PID=${o.pId}" title="Xóa sản phẩm" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')" class="btn btn-sm bg-danger-light">
                                                                    <i class="fe fe-trash"></i>
                                                                </a>
                                                                <a href="loadProduct?pId=${o.pId}&&xd=1" title="Thêm số lượng"  class="btn btn-sm bg-danger-light">
                                                                    <i class="fe fe-plus"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </c:forEach>
                                                </tr>
                                                <c:if test="${empty listP}">
                                                    <tr>
                                                        <td colspan="6" style="text-align: center; font-size: 24px; padding: 50px 0;">KHÔNG CÓ SẢN PHẨM NÀO</td>
                                                    </tr>
                                                </c:if>

                                            </tbody>


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


        <script src="assetsEM/js/jquery-3.6.0.min.js"></script>

        <script src="assetsEM/js/bootstrap.bundle.min.js"></script>

        <script src="assetsEM/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assetsEM/js/script.js"></script>
    </body>

    <script>
                                                                    const productTitles = document.querySelectorAll('.name-Product');

                                                                    productTitles.forEach(title => {
                                                                        const titleText = title.textContent;

                                                                        if (titleText.length > 24) {
                                                                            const shortenedText = titleText.slice(0, 21) + '...';
                                                                            title.textContent = shortenedText;
                                                                        }
                                                                    });
    </script>


    <script>
        function confirmDelete(userId) {
            if (confirm("Bạn có chắc chắn muốn xóa người dùng này?")) {
                window.location.href = `delete?id=` + userId;
            }
        }
    </script>
</html>