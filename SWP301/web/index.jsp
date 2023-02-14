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

                        <div class="col md-2"">
                            <div style="background-color: white">
                                <h2>Tivi</h2>
                            <c:forEach items="${requestScope.cate}" var="ca">
                                <p><a href="">${ca.getcName()}</a></p>  
                                </c:forEach>
                        </div>
                        <div style="background-color: white">
                            <h2> KHOẢNG GIÁ(VNĐ)</h2> 
                            <li>3 triệu - 5 triệu</li>
                            <li>5 triệu - 8 triệu</li>
                            <li>8 triệu - 10 triệu</li>
                            <li>15 triệu - 20 triệu </li>
                            <li>20 triệu - 25 triệu </li>
                        </div>
                        <div style="background-color: white">
                            <h2>Inch</h2>
                            <input href="#" name="" type="checkbox"/>32 inch -  43 inch<br/>
                            <input  href="#" name="" type="checkbox"  />45 inch -  50 inch<br/>
                            <input  href="#" name="" type="checkbox"  />55 inch -  60 inch <br/>
                            <input  href="#" name="" type="checkbox" /> 70<br/>
                            <input  href="#" name="" type="checkbox"  />Khác<br/>
                        </div>
                    </div>


                    <div class="col-md-10">
                        <div class="row">
                            <nav aria-label="breadcrumb">
                                <ul class="pagination">

                                    <c:forEach begin="1" end="${endP}" var="pa">
                                        <li class="page-item ${tagw == pa?"active":""}"><a href="listproduct?index=${pa}" class="page-link">${pa}</a></li>   
                                        </c:forEach>

                                </ul>    
                            </nav>    
                            <c:forEach items="${product}" var="p">

                                <div class="col-lg-3 col-md-3 mb-4">
                                    <a href="detail?pid=${p.pId}">
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
                                    </a>      
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

        <jsp:include page="footer.jsp"></jsp:include>
</html>