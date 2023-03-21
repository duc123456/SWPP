<%-- 
    Document   : cart
    Created on : Jan 12, 2023, 10:18:34 PM
    Author     : nhant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Giỏ hàng</title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    <style>
        .btn-among
        {
            background-color: white;
      
        }
    </style>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>

            <!--  ************************* Page Title Starts Here ************************** -->
            <div class="page-nav no-margin row">
                <div class="container">
                    <div class="row">
                        <h2 class="text-start">Giỏ hàng</h2>
                        <ul>
                            <li> <a href="#"><i class="bi bi-house-door"></i>Trang</a></li>
                            <li><i class="bi bi-chevron-double-right pe-2"></i>Giỏ hàng</li>
                        </ul>
                    </div>
                </div>
            </div>

        </div>
        
        
    <!--####################### About US Starts Here ###################-->
    <div class="container-fluid big-padding about-cover">
        <div class="container">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <h1>${thongBao}</h1>
                    <table class="table bg-white shadow-md" >

                                <tr>
                                    <th>#</th>
                                    <th>Ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th style="width: 20%">    Số lượng</th>
                                    <th>Giá tiền</th>

                                    <th>Hành động</th>
                                </tr>
                            <c:set var="i" value="1"></c:set>
                            <c:forEach items="${sessionScope.cart.getItems()}" var="c">
                                <tr class="align-middle">
                                    <td>${i}</td>
                                    <c:set var="i" value="${i+1}"></c:set>
                                    <td><a href="detail?pid=${c.getProduct().getpId()}"><img src="Image/${c.getProduct().getImageDf()}" class="max-100"></a></td><!-- comment -->
                                    <td><a href="detail?pid=${c.getProduct().getpId()}">${c.getProduct().getName()}</a></td>
                                    <td ><button class="btn-among about-cover" style="width: 20%"><a href="process?num=-1&id=${c.getProduct().getpId()}">-</a></button>

                                        <input type="text" value=" ${c.getQuantity()}" readonly style="width: 15%">
                                        
                                        <button class="btn-among about-cover" style="width: 20%"><a href="process?num=1&id=${c.getProduct().getpId()}">+</a></button>
                                    </td>

                                    <td><fmt:formatNumber value="${c.getPrice() * c.getQuantity()}" pattern="#,##0 'VND'" /></td>

                                    <td>
                                        <a href="deleteitem?id=${c.getProduct().getpId()}" title="Xóa">
                                            <button class="btn btn-xs pt-2 btn-danger"><i class="bi bi-trash"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>



                        </table>
                        <c:if test="${sessionScope.cart != null && sessionScope.cart.getItems().size() != 0 }">

                            <p  class="btn btn-danger float-end fw-bolder px-4"><fmt:formatNumber value="${sessionScope.cart.totalPrice()}" pattern="#,##0 'VND'" /></p>
                            <br/>
                            <br/>

                            <button class="btn btn-danger float-end fw-bolder px-4" id="show-form-btn" ><a href="information.jsp">Mua hàng</a></button>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>

    </bod>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>

</html>