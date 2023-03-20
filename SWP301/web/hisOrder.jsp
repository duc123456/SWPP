<%-- 
    Document   : hisOrder.jsp
    Created on : Mar 13, 2023, 10:31:58 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../assets/css/header_footer.css">
        <link rel="stylesheet" href="assets/css/profile_info.css">
        <link rel="stylesheet" href="assets/css/orders.css">
        <script type="text/javascript" language="javascript" src="main.js"></script>
        <link rel="stylesheet" href="assets/font/fontawesome-free-6.1.1/css/all.min.css">
        <link rel="icon" href="assets/img/small_logo1.png">


        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    <body>
        <!-- header -->
        <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>
        <jsp:include page="menu.jsp"></jsp:include>
            <!-- end header -->


            <!-- body -->
            <div id="body">
                <!-- container -->
                <div class="body_container">
                    <!-- body left -->
                    <div class="body_left">
                        <!-- body left top (dashboard)-->
                        <div class="body_left-dashboard">
                            <div class="body_left-dashboard_title">THÔNG TIN</div>
                            <a href="hisOrder.jsp" class="body_left-dashboard_child" id="current_page">
                                <div id="hover_icon">

                                    Đơn hàng
                                </div>
                                <span>${d.getAllOrderByUID(acc.uId).size()}</span>
                        </a>
                        <a href="sanphamdaxem" class="body_left-dashboard_child">
                            <div id="hover_icon">

                                San pham da xem
                            </div>
                            <span>${soSanPhamDaXem}</span>
                        </a>
                        <a href="thongbao" class="body_left-dashboard_child">
                            <div id="hover_icon">

                                Thong bao cua toi
                            </div>
                            <span style="color: red">${thongBao}</span>
                        </a>

                    </div>
                    <!-- body left bot (acc setting)-->
                    <div class="body_left-setting">
                        <div class="body_left-dashboard_title">TÀI KHOẢN</div>
                        <a href="orderofuser" class="body_left-dashboard_child">
                            <div id="hover_icon">
                                
                                Trang cá nhân
                            </div>
                            
                        </a>
                        <a href="#" class="body_left-dashboard_child">
                            <div id="hover_icon">
                               
                                Địa chỉ
                            </div>
                            
                        </a>
                        <a href="#" class="body_left-dashboard_child">
                            <div id="hover_icon">
                               
                                Phương thức thanh toán
                            </div>
                           
                        </a>
                    </div>
                </div>
                <!-- body right -->
                <div class="body_right">
                    <div>
                        <!-- title -->
                        <div class="body_right-title">
                            <div class="body_right-title-1">
                                <i class="fa-solid fa-cart-shopping  body_right-title_icon"></i>
                                <p id="body_right-title">Đơn hàng</p>
                            </div>
                        </div>
                        <!-- content -->
                        <div class="body_right-oders">
                            <!-- title -->
                            <div class="body_right-oders-title">
                                <div class="oders-title-child">Đơn hàng</div>
                                <div class="oders-title-child">Trạng thái</div>
                                <div class="oders-title-child">Ngày thanh toán</div>
                                <div class="oders-title-child">Tổng tiền</div>
                            </div>
                            <!-- content -->
                            <div>
                                <c:set var="c" value="${d.getAllOrderByUID(acc.uId)}"></c:set>
                                <c:if test="${list3 != null }">

                                    <c:set var="c" value="${list3}"></c:set>
                                </c:if>
                                <c:if test="${total != null }">

                                    <c:set var="c" value="${d.getAllOrderByUID(acc.uId)}"></c:set>
                                </c:if>

                                <c:forEach items="${c}" var="list" >
                                    <div class="body_right-oders_child">
                                        <div class="oders_items">
                                            <div class="oders_items-child">#${list.oId}</div>
                                            <div class="oders_items-child ">
                                                <c:if test="${list.status == 1}">
                                                    <c:set var="c" value="Đang xử lý">
                                                    </c:set>
                                                    <span class="status-gray">${c}</span>
                                                </c:if>
                                                <c:if test="${list.status == 2}">
                                                    <c:set var="c" value="Đã xác nhận">
                                                    </c:set>
                                                    <span class="status-gray">${c}</span>
                                                </c:if>
                                                <c:if test="${list.status == 3}">
                                                    <c:set var="c" value="Đã nhận">
                                                    </c:set>
                                                    <span class="status-green">${c}</span>
                                                </c:if>
                                                <c:if test="${list.status == 4}">
                                                    <c:set var="c" value="Đã hủy">
                                                    </c:set>
                                                    <span class="status-red">${c}</span>
                                                </c:if>


                                            </div>
                                            <div class="oders_items-child">${list.date.substring(0,10)}</div>
                                            <div class="oders_items-child money_margin"> <fmt:formatNumber value="${list.totalPrice}" pattern="#,##0 'VND'" /></div>
                                        </div>
                                        <div class="order_items_icon">
                                            <a href="orderdetail?oId=${list.oId}" class="order_items_icon-link"> 
                                                <i class="fa-solid fa-arrow-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </c:forEach>
                                <!-- page button -->

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- end body -->

            <!-- footer -->
            <jsp:include page="footer.jsp"></jsp:include>
            <!-- end footer -->
    </body>
</html>
