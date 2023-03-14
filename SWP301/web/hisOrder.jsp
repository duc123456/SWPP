<%-- 
    Document   : hisOrder.jsp
    Created on : Mar 13, 2023, 10:31:58 PM
    Author     : ADMIN
--%>

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
           <jsp:include page="sbProfile.jsp"></jsp:include>
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
                            <div class="body_right-oders_child">
                                <div class="oders_items">
                                    <div class="oders_items-child">6223AG</div>
                                    <div class="oders_items-child ">
                                        <span class="status-gray">Đang xử lý</span>
                                    </div>
                                    <div class="oders_items-child">30 / 4 / 2022</div>
                                    <div class="oders_items-child money_margin">$999.99</div>
                                </div>
                                <div class="order_items_icon">
                                    <a href="orderdetail.jsp" class="order_items_icon-link"> 
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="body_right-oders_child">
                                <div class="oders_items">
                                    <div class="oders_items-child">DVFN63</div>
                                    <div class="oders_items-child">
                                        <span class="status-green">Đã giao thành công</span>
                                    </div>
                                    <div class="oders_items-child">03 / 12 / 2020</div>
                                    <div class="oders_items-child money_margin">$999.99</div>
                                </div>
                                <div class="order_items_icon">
                                    <a href="orderdetail.jsp" class="order_items_icon-link"> 
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="body_right-oders_child">
                                <div class="oders_items">
                                    <div class="oders_items-child">AV4223</div>
                                    <div class="oders_items-child">
                                        <span class="status-red">Đã huỷ đơn</span>
                                    </div>
                                    <div class="oders_items-child">12 / 9 / 2022</div>
                                    <div class="oders_items-child money_margin">$999.99</div>
                                </div>
                                <div class="order_items_icon">
                                    <a href="orderdetail.jsp" class="order_items_icon-link"> 
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="body_right-oders_child">
                                <div class="oders_items">
                                    <div class="oders_items-child">AV4223</div>
                                    <div class="oders_items-child">
                                        <span class="status-red">Đã huỷ đơn</span>
                                    </div>
                                    <div class="oders_items-child">12 / 9 / 2022</div>
                                    <div class="oders_items-child money_margin">$999.99</div>
                                </div>
                                <div class="order_items_icon">
                                    <a href="orderdetail.jsp" class="order_items_icon-link"> 
                                        <i class="fa-solid fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div>
                            <div>
                                <div class="body_right-oders_child">
                                    <div class="oders_items">
                                        <div class="oders_items-child">6223AG</div>
                                        <div class="oders_items-child ">
                                            <span class="status-gray">Đang đóng gói</span>
                                        </div>
                                        <div class="oders_items-child">30 / 4 / 2022</div>
                                        <div class="oders_items-child money_margin">$999.99</div>
                                    </div>
                                    <div class="order_items_icon">
                                        <a href="orderdetail.jsp" class="order_items_icon-link"> 
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="body_right-oders_child">
                                    <div class="oders_items">
                                        <div class="oders_items-child">DVFN63</div>
                                        <div class="oders_items-child">
                                            <span class="status-green">Đã giao thành công</span>
                                        </div>
                                        <div class="oders_items-child">03 / 12 / 2020</div>
                                        <div class="oders_items-child money_margin">$999.99</div>
                                    </div>
                                    <div class="order_items_icon">
                                        <a href="orderdetail.jsp" class="order_items_icon-link"> 
                                            <i class="fa-solid fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                        </div>
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
