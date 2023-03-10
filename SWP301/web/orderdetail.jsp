<%-- 
    Document   : orderdetail.jsp
    Created on : Mar 13, 2023, 10:45:55 PM
    Author     : ADMIN
--%>

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
        <div class="body_container">
            <!-- body left -->
            <div class="body_left">
                <!-- body left top (dashboard)-->
                <div class="body_left-dashboard">
                    <div class="body_left-dashboard_title">THÔNG TIN</div>
                    <a href="./oder.html" class="body_left-dashboard_child" id="current_page">
                        <div id="hover_icon">
                            <i class="fa-solid fa-cart-shopping  dashboard_icon"></i>
                            Đơn hàng
                        </div>
                        <span>69</span>
                    </a>
                    <a href="./favorite.html" class="body_left-dashboard_child">
                        <div id="hover_icon">
                            <i class="fa-solid fa-heart  dashboard_icon"></i>
                            Yêu thích
                        </div>
                        <span>420</span>
                    </a>
                    <a href="./support.html" class="body_left-dashboard_child">
                        <div id="hover_icon">
                            <i class="fa-solid fa-headset  dashboard_icon"></i>
                            Hỗ trợ
                        </div>
                        <span>1</span>
                    </a>
                </div>
                <!-- body left bot (acc setting)-->
                <div class="body_left-setting">
                    <div class="body_left-dashboard_title">TÀI KHOẢN</div>
                    <a href="../src/profile_info.html" class="body_left-dashboard_child">
                        <div id="hover_icon">
                            <i class="fa-solid fa-user dashboard_icon"></i>
                            Trang cá nhân
                        </div>
                        <span>1</span>
                    </a>
                    <a href="../src/address.html" class="body_left-dashboard_child">
                        <div id="hover_icon">
                            <i class="fa-solid fa-location-arrow dashboard_icon"></i>
                            Địa chỉ
                        </div>
                        <span>2</span>
                    </a>
                    <a href="../src/thanh_toan.html" class="body_left-dashboard_child">
                        <div id="hover_icon">
                            <i class="fa-solid fa-credit-card dashboard_icon"></i>
                            Phương thức thanh toán
                        </div>
                        <span>3</span>
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
                            <p id="body_right-title">Chi tiết đơn hàng</p>
                        </div>
                        <a class="body_right-edit_button" href="#">
                            Đặt lại đơn hàng
                        </a>
                    </div>
                    <!-- content -->
                    <div class="body_right-order_info">
                        <div class="oders_info-child">
                            <div class="oders_info-status">
                                <div class="oders_info-status-circle statusbar_active">
                                    <div class="check_status">
                                        <i class="fa-solid fa-check"></i>
                                    </div>
                                    <div>
                                        <i class="fa-solid fa-box"></i>
                                    </div>
                                </div>
                                <div class="statusbar statusbar_active"></div>
                                <div class="oders_info-status-circle statusbar_active">
                                    <i class="fa-solid fa-truck"></i>
                                </div>
                                <div class="statusbar"></div>
                                <div class="oders_info-status-circle">
                                    <i class="fa-solid fa-truck-ramp-box"></i>
                                </div>
                            </div>
                            <div class="oders_info-estimated">
                                <div id="oders_info-estimated">
                                    Ngày giao dự kiến 
                                    <b>10/10/2022</b>
                                </div>
                            </div>
                        </div>
                        <!-- something i dont know -->
                        <div class="oders_info-child details">
                            <div>
                                <div class="oders_info-details">
                                    <div>
                                        <span>Mã vận đơn: </span>
                                        2835070
                                    </div>
                                    <div>
                                        <span>Đơn vị vận chuyển: </span>
                                        Giaohangnhanh
                                    </div>
                                    <div>
                                        <span>Ngày đặt: </span>
                                        10/6/2022
                                    </div>
                                    <div>
                                        <span>Ngày giao: </span>
                                        12/6/2022
                                    </div>
                                </div>
                                <div class="oders_info-description">
                                    <div class="oders_info-product">
                                        <div class="oders_info-product-child">
                                            <div>
                                                <img src="../assets/img/Albed2.jpg" alt="" class="product_img">
                                            </div>
                                            <div class="product-name">
                                                <span class="product-name-title">Mô hình Albedo</span>
                                                <span>$250 x 1</span>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="description">Mô tả: tỉ lệ 1:20</span>
                                        </div>
                                        <div>
                                            <span class="review">Viết nhận xét</span>
                                        </div>
                                    </div>
                                    <!--  -->
                                    <div class="oders_info-product">
                                        <div class="oders_info-product-child">
                                            <div>
                                                <img src="../assets/img/Figure DARLING IN THE FRANXX - ZERO TWO (2).jpeg" alt="Albedo" class="product_img">
                                            </div>
                                            <div class="product-name">
                                                <span class="product-name-title">Mô hình Zero Two</span>
                                                <span>$299 x 1</span>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="description">Mô tả: tỉ lệ 1:20</span>
                                        </div>
                                        <div>
                                            <span class="review">Viết nhận xét</span>
                                        </div>
                                    </div>
                                    <!--  -->
                                    <div class="oders_info-product">
                                        <div class="oders_info-product-child">
                                            <div>
                                                <img src="../assets/img/kaneki (2).jpg" alt="" class="product_img">
                                            </div>
                                            <div class="product-name">
                                                <span class="product-name-title">Mô hình Kaneki Ken</span>
                                                <span>$100 x 1</span>
                                            </div>
                                        </div>
                                        <div>
                                            <span class="description">Mô tả: tỉ lệ 1:20</span>
                                        </div>
                                        <div>
                                            <span class="review">Viết nhận xét</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- detail order(adress and billing,etc..) -->
                        <div class="biling">
                            <!-- left -->
                            <div class="biling_left">
                                <p class="biling_left-title">Địa chỉ giao hàng</p>
                                <p class="biling_left-address">326 Phạm Văn Đồng, Mai Dịch, Cầu Giấy, Hà Nội</p>
                            </div>
                            <!-- right -->
                            <div class="biling_right">
                                <div class="biling_right-1">
                                    <p class="biling_right-title">Thành tiền</p>
                                    <div class="biling_right-something">
                                        <div class="biling_right-something-oke">
                                            <p>Tạm tính:</p>
                                            <p>$649</p>
                                        </div>
                                        <div>
                                            <p>Phí vận chuyển:</p>
                                            <p>$20</p>
                                        </div>
                                        <div>
                                            <p>Giảm giá:</p>
                                            <p>-$50</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="biling_right-something">
                                    <div>
                                        <p class="total">Tổng cộng:</p>
                                        <p>$619</p>
                                    </div>
                                    <p>Trả bằng thẻ ngân hàng</p>
                                </div>
                            </div>
                        </div>
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
