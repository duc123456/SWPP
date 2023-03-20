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
        
        
    <!--####################### About US Starts Here ###################-->
    <div class="container-fluid big-padding about-cover">
        <div class="container">
            <div class="row">
                <div class="col-md-10 mx-auto">
                    <table class="table bg-white shadow-md" >
                                <tr>
                                    <th>#</th>
                                    <th>Ảnh</th>
                                    <th>Tên sản phẩm</th>
                                    <th style="width: 20%">Số lượng</th>
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
                                <td ><button><a href="process?num=-1&id=${c.getProduct().getpId()}">-</a></button>
                                   
                                    <input type="text" value=" ${c.getQuantity()}" readonly style="width: 17%">
                                    <button><a href="process?num=1&id=${c.getProduct().getpId()}">+</a></button>
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
        
    <footer>
        <div class="inner">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 foot-about">
                        <h4>About US</h4>

                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit libero pellentesque libero interdum, id mattis felis dictum. Praesent eget lacus tempor justo efficitur malesuada. Cras ut suscipit nisi.</p>

                        <ul>
                            <li>23 Rose Stren Melbourn</li>
                            <li>sales@smarteyeapps.com</li>
                            <li>+91 876 766 554</li>
                        </ul>
                    </div>

                    <div class="col-md-3 foot-post">
                        <h4>Latest Posts</h4>

                        <div class="post-row">
                            <div class="image">
                                <img src="assets/images/blog/blog_01.jpg" alt="">
                            </div>
                            <div class="detail">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit </p>
                            </div>
                        </div>

                        <div class="post-row">
                            <div class="image">
                                <img src="assets/images/blog/blog_02.jpg" alt="">
                            </div>
                            <div class="detail">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit </p>
                            </div>
                        </div>

                        <div class="post-row">
                            <div class="image">
                                <img src="assets/images/blog/blog_03.jpg" alt="">
                            </div>
                            <div class="detail">
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-3 foot-services">
                        <h4>Top Category</h4>

                        <ul>
                            <li><a href="">Target Statergy</a></li>
                            <li><a href="">Web Analytics</a></li>
                            <li><a href="">Page Monitering</a></li>
                            <li><a href="">Page Optimization</a></li>
                            <li><a href="">Target Statergy</a></li>
                            <li><a href="">Email Marketing</a></li>
                        </ul>
                    </div>

                    <div class="col-md-3 foot-news">
                        <h4>News Letter</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam justo neque, vehicula eget eros. </p>

                        <div class="input-group mb-3">
                            <input type="text" class="form-control mb-0" placeholder="Recipient's username" aria-label="Recipient's username" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <span class="input-group-text bg-danger" id="basic-addon2"><i class="bi text-white bi-send"></i></span>
                            </div>
                        </div>

                        <ul>
                            <li><i class="bi bi-facebook"></i></li>
                            <li><i class="bi bi-twitter"></i></li>
                            <li><i class="bi bi-instagram"></i></li>
                            <li><i class="bi bi-linkedin"></i></li>
                            <li><i class="bi bi-pinterest"></i></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    
    </footer>
    <div class="copy">
        <div class="container">
            <a href="https://www.smarteyeapps.com/">2022 &copy; All Rights Reserved | Designed and Developed by Smarteyeapps.com</a>

            <span>
                <a href=""><i class="fab fa-github"></i></a>
                <a href=""><i class="fab fa-google-plus-g"></i></a>
                <a href="https://in.pinterest.com/prabnr/pins/"><i class="fab fa-pinterest-p"></i></a>
                <a href="https://twitter.com/prabinraja89"><i class="fab fa-twitter"></i></a>
                <a href="https://www.facebook.com/freewebtemplatesbysmarteye"><i class="fab fa-facebook-f"></i></a>
            </span>
        </div>
    </div>
        
    </bod>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>

</html>