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

            <div class="main-wrapper">



                <div class="page-wrapper">
                    <div class="content container-fluid">
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
                                        <div class="table-responsive">
                                            <table class="table table-hover table-center mb-0">
                                                <thead>
                                                    <tr>
                                                        <th> Tên
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
                                                <tbody>                                           
                                                <c:forEach items="${listPO}" var="o">

                                                    <tr>
                                                        <td>

                                                            <h2 class="table-avatar">
                                                                <a href="detail?pid=${o.pId}" class="avatar avatar-sm me-2"><img class="avatar-img rounded-circle" src="Image/${o.imageDf}"></a>
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
                                                                <a href="loadProduct?pId=${o.pId}"  class="btn btn-sm bg-success-light me-2">
                                                                    <i class="fe fe-pencil"></i>
                                                                </a>
                                                                <a href="deleteproduct?PID=${o.pId}" class="btn btn-sm bg-danger-light">
                                                                    <i class="fe fe-trash"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </c:forEach>

                                                </tr>




                                            </tbody>
                                            <c:if test="${empty listPO}">
                                                <tr>
                                                    <td colspan="6" style="text-align: center; font-size: 24px; padding: 50px 0;">KHÔNG CÓ SẢN PHẨM NÀO</td>
                                                </tr>
                                            </c:if>
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
</html>