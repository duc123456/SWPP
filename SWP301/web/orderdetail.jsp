<%-- 
    Document   : orderdetail.jsp
    Created on : Mar 13, 2023, 10:45:55 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/header_footer.css">
        <link rel="stylesheet" href="assets/css/profile_info.css">
        <link rel="stylesheet" href="assets/css/order_info.css">
        <script type="text/javascript" language="javascript" src="main.js"></script>
        <link rel="stylesheet" href="assets/font/fontawesome-free-6.1.1/css/all.min.css">
        <link rel="icon" href="assets/img/small_logo1.png">

        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
        <title>BOT STORE</title>
    </head>
    <body>
        <!-- header -->
        <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>
        <jsp:include page="menu.jsp"></jsp:include>
            <!-- end header -->

    <!-- body -->
    <div id="body">
        <!-- container -->
        <div class="row">
            <div class="col-md-2" ></div>
        <div class="body_container col-md-10">
            <!-- body left -->
            
            <!-- body right -->
          
                      


                    <!-- body right -->
                    <div class="body_right col-md-9">
                       <div>
                    <!-- title -->
                    <div class="body_right-title">
                        <div class="body_right-title-1">
                            <img src="https://img.icons8.com/ios/50/null/details-pane.png"/>
                            <p id="body_right-title">Chi tiết đơn hàng</p>
                        </div>
                    <c:if test="${orderDetail.get(0).order.status == 4}">
                         <a class="body_right-edit_button" href="datlaidonhang?oId=${orderDetail.get(0).order.oId}">
                            Đặt lại đơn hàng
                        </a>
                            </c:if>
                         <c:if test="${orderDetail.get(0).order.status == 3}">
                         <a class="body_right-edit_button" href="datlaidonhang?oId=${orderDetail.get(0).order.oId}">
                            Đặt lại đơn hàng
                        </a>
                            </c:if>
                    <c:if test="${orderDetail.get(0).order.status == 1}">
                        <a class="body_right-edit_button" href="huydonhang?oid=${orderDetail.get(0).order.oId}">
                            Hủy đơn hàng
                        </a>
                    </c:if>
                        
                    </div>
                            <!-- content -->
                            <div class="body_right-order_info">

                                <!-- body right -->
                                <div class="body_right">
                                    <div>
                                        <!-- content -->
                                        <div class="body_right-order_info">


                                            <!-- something i dont know -->
                                            <div class="oders_info-child details">
                                                <div>
                                                    <div class="oders_info-details">
                                                        <div>
                                                            <span>Mã đơn hàng:</span>
                                                            #FFF${orderDetail.get(0).order.oId}
                                                    </div>

                                                    <div>
                                                        <span>Ngày đặt: </span>
                                                        ${orderDetail.get(0).order.date.substring(0,10)}
                                                    </div>

                                                </div>
                                                <div class="oders_info-description">
                                                    <c:set var="oddt" value="${orderDetail}"></c:set>
                                                    <c:forEach items="${orderDetail}" var="c">
                                                        <div class="oders_info-product">
                                                            <div class="oders_info-product-child">
                                                                <div>
                                                                    <a href="detail?pid=${c.product.pId}"><img src="Image/${c.product.imageDf}" alt="" class="product_img"></a>

                                                                </div>
                                                                <div class="product-name">
                                                                    <span class="product-name-title">${c.product.name}</span>

                                                                </div>
                                                            </div>
                                                            <div>
                                                                <span class="description">${c.price * c.amount}</span>
                                                            </div>
                                                            <div>
                                                                <c:if test="${c.order.status == 3}">
                                                                    <a class="review" href="detail?pid=${c.product.pId}&&xn=1">Viết nhận xét</a>
                                                                </c:if>

                                                            </div>
                                                        </div>
                                                    </c:forEach>                                                                  
                                                </div>
                                            </div>
                                        </div>
                                        <!-- detail order(adress and billing,etc..) -->
                                        <div class="biling">
                                            <!-- left -->
                                            <div class="biling_left">
                                                <p class="biling_left-title">Địa chỉ giao hàng</p>
                                                <p class="biling_left-address">${oddt.get(0).order.address}</p>
                                            </div>
                                            <!-- right -->
                                            <div class="biling_right">
                                                <!--                                <div class="biling_right-1">
                                                                                    <p class="biling_right-title">Thành tiền: </p> 
                                                                                    <div class="biling_right-something">
                                                                                        <div class="biling_right-something-oke">
                                                                                            
                                                                                            <p></p>
                                                                                        </div>
                                                                                        
                                                                                    </div>
                                                                                </div>-->
                                                <div class="biling_right-something">
                                                    <div>
                                                        <p class="total">Tổng cộng:</p>
                                                        <p>${oddt.get(0).order.totalPrice}</p>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class=""></div>
                                        </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>

</html>
