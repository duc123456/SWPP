<%-- 
    Document   : profilee.jsp
    Created on : Mar 13, 2023, 10:23:52 PM
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
    <script type="text/javascript" language="javascript" src="../main.js"></script>
    <link rel="stylesheet" href="../assets/font/fontawesome-free-6.1.1/css/all.min.css">
    <link rel="icon" href="/assets/img/small_logo1.png">
    <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
    
    
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
                    <a href="./oder.html" class="body_left-dashboard_child">
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
                    <a href="../src/profile_info.html" class="body_left-dashboard_child" id="current_page">
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
                            <i class="fa-solid fa-user body_right-title_icon"></i>
                            <p id="body_right-title">Trang Cá Nhân</p>
                        </div>
                        <a class="body_right-edit_button" href="#">
                            Sửa thông tin cá nhân
                        </a>
                    </div>
                    <!-- tên và trang thái -->
                    <div class="body_right-status">
                        <!-- avatar -->
                        <div class="body_right-status_avatar">
                            <img src="../assets/img/frog (7).png" alt="con ech" id="body_right-status_avatar">
                        </div>
                        <!-- name and crown -->
                        <div class="body_right-status_right">
                            <!-- name -->
                            <div class="body_right-status_name">
                                <div id="body_right-status_name">Đỗ Long</div>
                                <div class="body_right-status_name-money">
                                    Đã chi tiêu:
                                    <span id="body_right-status_name-money">69420$</span>
                                </div>
                                <div class="body_right-status_name-level">
                                    Thành viên Vàng
                                </div>
                            </div>
                            <!-- crown -->
                            <div class="body_right-status_crown">
                                <div class="body_right-status_crown-child">
                                    <p id="body_right-status_crown-child">
                                        Hãy mua thêm 200$ để lên thành viên kim cương
                                    </p>
                                    <div id="progressBar">
                                        <div id="barStatus"></div>
                                    </div>
                                </div>
                                <i class="fa-solid fa-crown" id="body_right-status_crown"></i>
                            </div>
                        </div>
                    </div>
                    <!-- lịch sử các đơn hàng -->
                    <div class="body_right-history">
                        <div class="body_right-history_child">
                            <span class="body_right-history_child-number">267</span>
                            <p>Đơn hàng đã mua</p>
                        </div>
                        <div class="body_right-history_child">
                            <span class="body_right-history_child-number">6</span>
                            <p>Đơn hàng đợi thanh toán</p>
                        </div>
                        <div class="body_right-history_child">
                            <span class="body_right-history_child-number">2</span>
                            <p>Đơn hàng đã huỷ</p>
                        </div>
                        <div class="body_right-history_child">
                            <span class="body_right-history_child-number">10</span>
                            <p>Đơn hàng đang giao</p>
                        </div>
                    </div>
                    <!-- thông tin cá nhân -->
                    <div class="body_right-info">
                        <div class="body_right-info_child">
                            <div class="body_right-info_child-title">
                                Họ
                            </div>
                            <div class="body_right-info_child-text">
                                Đỗ
                            </div>
                        </div>
                        <div class="body_right-info_child">
                            <div class="body_right-info_child-title">
                                Tên
                            </div>
                            <div class="body_right-info_child-text">
                                Long
                            </div>
                        </div>
                        <div class="body_right-info_child">
                            <div class="body_right-info_child-title">
                                Email
                            </div>
                            <div class="body_right-info_child-text">
                                LongLinh@gmail.com
                            </div>
                        </div>
                        <div class="body_right-info_child">
                            <div class="body_right-info_child-title">
                                Điện thoại
                            </div>
                            <div class="body_right-info_child-text">
                                +84 912345678
                            </div>
                        </div>
                        <div class="body_right-info_child">
                            <div class="body_right-info_child-title">
                                Ngày sinh
                            </div>
                            <div class="body_right-info_child-text">
                                29/12/2001
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
