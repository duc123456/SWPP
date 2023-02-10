<%-- 
    Document   : index.jsp
    Created on : Jan 12, 2023, 9:23:58 PM
    Author     : nhant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Gift Shoping Website Template  | Smarteyeapps.com</title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    <body>

        <jsp:include page="menu.jsp"></jsp:include>
            <div class="slider">
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="assets/images/slider/s1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="assets/images/slider/s2.jpg" class="d-block w-100" alt="...">
                        </div>

                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>


            <div class="latest-products pt-5 pb-0">
                <div class="container-xl">
                    <div class="section-tile row">
                        <div class="col-md-10 text-center mx-auto">
                            <h2>Featured Products</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet est sit amet sem malesuada bibendum. Nulla eget mauris at dolor fermentum blandit. Maecenas</p>
                        </div>
                    </div>

                    <div class="row mt-5">

                        <div class="col md-2">
                            <h2>Tivi</h2>
                        <c:forEach items="${requestScope.cate}" var="ca">
                            <p><a href="">${ca.getcName()}</a></p>  
                            </c:forEach>

                        <h2> KHOẢNG GIÁ(VNĐ)</h2> 
                        <li>3 triệu - 5 triệu</li>
                        <li>5 triệu - 8 triệu</li>
                        <li>8 triệu - 10 triệu</li>
                        <li>15 triệu - 20 triệu </li>
                        <li>20 triệu - 25 triệu </li>


                        <h2>Inch</h2>
                        <input href="#" name="" type="checkbox"/>32 inch -  43 inch<br/>
                        <input  href="#" name="" type="checkbox"  />45 inch -  50 inch<br/>
                        <input  href="#" name="" type="checkbox"  />55 inch -  60 inch <br/>
                        <input  href="#" name="" type="checkbox" /> 70<br/>
                        <input  href="#" name="" type="checkbox"  />Khác<br/>

                    </div>


                    <div class="col-md-10">
                        <div class="row">
                            <c:forEach items="${product}" var="p">

                                <div class="col-lg-3 col-md-3 mb-4">
                                    <div class="bg-white p-2 shadow-md">
                                        <div class="text-center">

                                            <img  src="Image/${p.imageDf}" alt="">
                                        </div>
                                        <div class="detail p-2">
                                            <h4 class="mb-1 fs-5 fw-bold">${p.name}</h4>
                                            <b class="fs-4 text-danger">${p.price}</b>
                                            <s class="fs-5 ps-3">60.00</s>

                                            <ul class="mt-0 vgth">
                                                <li class="fs-8">
                                                    <i class="bi text-warning bi-star-fill"></i>
                                                    <i class="bi text-warning bi-star-fill"></i>
                                                    <i class="bi text-warning bi-star-fill"></i>
                                                    <i class="bi text-warning bi-star-fill"></i>
                                                    <i class="bi bi-star-fill"></i>
                                                </li>
                                                <li class="float-end gvi">
                                                    <i class="bi text-danger bi-heart-fill"></i>
                                                </li>
                                            </ul>
                                            <div class="row pt-2">
                                                <div class="col-md-6">
                                                    <button class="btn mb-2 fw-bold w-100 btn-danger">Mua</button>
                                                </div>
                                                <div class="col-md-6">
                                                    <button class="btn fw-bold w-100 btn-outline-danger">Thêm vào giỏ hàng</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div class="ad-cover container-fluid pb-4">
            <div class="container-lg">
                <div class="row">
                    <div class="col-md-4">
                        <img class="bg-white shadow-md p-2" src="assets/images/ads/1.webp" alt="">
                    </div>
                    <div class="col-md-4">
                        <img class="bg-white shadow-md p-2" src="assets/images/ads/a2.webp" alt="">
                    </div>
                    <div class="col-md-4">
                        <img class="bg-white shadow-md p-2" src="assets/images/ads/a3.webp" alt="">
                    </div>
                </div>
            </div>
        </div>

        <div class="popular-brands big-padding bg-white container-fluid">
            <div class="container">
                <div class="section-tile row">
                    <div class="col-md-10 text-center mx-auto">
                        <h2>Popular Brands</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet est sit amet sem malesuada bibendum. Nulla eget mauris at dolor fermentum blandit. Maecenas</p>
                    </div>
                </div>
                <div class="row pt-5">
                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/1.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-02.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-03.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-04.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-05.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-06.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-04.jpeg" alt="">
                        </div>
                    </div>


                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-03.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-05.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/1.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-02.jpeg" alt="">
                        </div>
                    </div>

                    <div class="col-lg-2 col-md-4 col-6 mb-4">
                        <div class="brand-cover">
                            <img src="assets/images/brand/client-02.jpeg" alt="">
                        </div>
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
                                    <img src="assets/images/blog/1.jpg" alt="">
                                </div>
                                <div class="detail ps-2">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit </p>
                                </div>
                            </div>

                            <div class="post-row">
                                <div class="image">
                                    <img src="assets/images/blog/7.jpg" alt="">
                                </div>
                                <div class="detail p-2">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras hendrerit </p>
                                </div>
                            </div>

                            <div class="post-row">
                                <div class="image">
                                    <img src="assets/images/blog/6.jpg" alt="">
                                </div>
                                <div class="detail ps-2">
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

    </body>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>

</html>