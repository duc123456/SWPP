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
                            <a href="hisorder?xn=1" class="body_left-dashboard_child">
                                <div id="hover_icon">
                                    
                                    Đơn hàng
                                </div>
                                <span>${orderByUId.size()}</span>
                        </a>
                        <a href="sanphamdaxem" class="body_left-dashboard_child">
                            <div id="hover_icon">
                               
                                Sản phẩm đã xem
                            </div>
                            <span>${soSanPhamDaXem}</span>
                        </a>
                        <a href="thongbao" class="body_left-dashboard_child">
                            <div id="hover_icon">
                               
                                Thông báo
                            </div>
                            <span style="color: red">${thongBao}</span>
                        </a>
                    </div>
                    <!-- body left bot (acc setting)-->
                    <div class="body_left-setting">
                        <div class="body_left-dashboard_title">TÀI KHOẢN</div>
                        <a href="orderofuser" class="body_left-dashboard_child" id="current_page">
                            <div id="hover_icon">
                                
                                Trang cá nhân
                            </div>
                            
                        </a>
                        <a href="../src/address.html" class="body_left-dashboard_child">
                            <div id="hover_icon">
                                
                                Địa chỉ
                            </div>
                            
                        </a>
                        <a href="../src/thanh_toan.html" class="body_left-dashboard_child">
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
                                <img src="https://img.icons8.com/ios/50/null/appointment-reminders--v1.png"/>
                                <p id="body_right-title">Thông báo</p>
                            </div>
                        </div>
                        <!-- content -->
                        <div class="body_right-oders">                    <!-- content -->
                            <div>
                                 <c:forEach items="${xemThongBao}" var="c">
                                     <c:if test="${c.statusId == 1}">
                                         <c:set var="s" value="da dat thanh cong"></c:set>
                                     </c:if>
                                     <c:if test="${c.statusId == 2}">
                                         <c:set var="s" value="da xac nhan thanh cong"></c:set>
                                     </c:if>
                                     <c:if test="${c.statusId == 3}">
                                         <c:set var="s" value="da nhan"></c:set>
                                     </c:if>
                                     <c:if test="${c.statusId == 4}">
                                         <c:set var="s" value="da huy thanh cong"></c:set>
                                     </c:if>
                                <div class="body_right-oders_child" style="min-height: 60px">
                                   
                                        
                                    <div><a href="orderdetail?oId=${c.order.oId}">Ðon hang ${c.order.oId}  ${s} vao ngay ${c.date} </a> </div> 
                                        <button data-id="" class="read-btn"><a href="thongbao?logId=${c.logID}">Đã đọc</a></button>
                                  
                                    
                                </div>
                                  </c:forEach>
     
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
