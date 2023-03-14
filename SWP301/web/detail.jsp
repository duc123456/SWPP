<%-- 
    Document   : detail
    Created on : Jan 12, 2023, 10:33:40 PM
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
        <style>
            .vietnamese-currency:before {
                content: "\20AB"; /* Unicode character for the Vietnamese dong symbol */
            }

            .vietnamese-currency:after {
                content: " đ";
            }

            .vietnamese-currency {
                display: inline-block;
                text-align: right;
            }

            .vietnamese-currency::before {
                padding-left: 0.2em;
            }

            .vietnamese-currency::after {
                padding-left: 0.1em;
            }
            .multiline::before {
                content: "-";
            }
            .multiline {
                white-space: pre-line;
            }
            .small-tag {
                max-width: 11ch;
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }


        </style>
    </head>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>

            <!--  ************************* Page Title Starts Here ************************** -->
            <div class="page-nav no-margin row">
                <div class="container">
                    <div class="row">
                        <h2 class="text-start">${product.name}</h2>
                    <ul>
                        <li> <a href="#"><i class="bi bi-house-door"></i> Home</a></li>
                        <li><i class="bi bi-chevron-double-right pe-2"></i> Products</li>
                        <li><i class="bi bi-chevron-double-right pe-2"></i>${product.name}</li>
                    </ul>
                </div>
            </div>
        </div>


        <!--####################### Product Detail Starts Here ###################-->

        <div class="container-fluid big-padding bg-white about-cover">
            <div class="container">
                <div class="row about-row">
                    <div class="col-md-5 text-center">
                        <img src="Image/${product.imageDf}" alt="">
                    </div>
                    <div class="col-md-7">
                        <h2>${product.name}-${type1}</h2>

                        <ul class="mt-0 mt-2 mb-3 vgth">

                            <c:forEach items="${sizes}" var="s">
                                <i class="chooseSize" >${s.size} </i>
                                <input type="radio" name="size" id="size-radio">



                            </c:forEach>
                        </ul>
                        <b class="fs-3 py-4 text-danger vietnamese-currency">${product.priceOut}</b>

                        <ul class="mt-0 mt-2 mb-3 vgth">
                            <li class="fs-8">
                                <c:forEach begin="1" end="${star}" var="pa">
                                    <i class="bi text-warning bi-star-fill"></i>  
                                </c:forEach>
                                <c:forEach begin="1" end="${5-star}" var="pa">
                                    <i class="bi bi-star-fill"></i> 
                                </c:forEach>

                                <span>${star}</span>
                                <i class="bi text-danger bi-heart-fill"></i>
                            </li>

                        </ul>
                        <c:set var="c" value="addcart"/>
                       



                        <form action="${c}" method="post">
                            <input type="hidden" name="product" value="${product.pId}">
                            <div class="quantity">
                                <input type="button" value="-" class="minus" style="width: 25px;">
                                <input type="number" name="quantity" min="1" max="${product.getQuantity() - sessionScope.cart.getItemById(product.pId).getQuantity()}" value="1" class="quantity-input" style="width: 40px;">
                                <input type="button" value="+" class="plus" style="width: 25px;">
                            </div>
                            <input type="hidden" name="price" value="${product.priceOut}">
                           
                            <div class="row pt-2">

                                <div class="col-md-2">


                                    <button class="btn fw-bold w-100 btn-outline-danger" type="submit" >Chọn Mua</button>
                                    
                                    </form>
                                </div>
                            </div>

                    </div>
                </div>

                <div class="row product-detail">
                    <h4>Product Detail</h4>

                    <p class="mb-3 multiline">${product.description}</p>

                </div>
                <jsp:useBean id="a" class="dal.DAO" scope="request"></jsp:useBean>
                    <div class="row review">
                        <div class="col-md-8">
                            <h4>Product Review</h4>
                        <c:forEach items="${feedbacks}" var="fb">
                            <div class="row m-0 reviewrow p-3 px-0 border-bottom">

                                <div class="col-md-12 align-items-center col-9 rcolm"> 
                                    <div class="review">
                                        <li class="col-8 ratfac">
                                            <c:forEach begin="1" end="${fb.vote}" var="pa">
                                                <i class="bi text-warning bi-star-fill"></i>
                                            </c:forEach>
                                            <c:forEach begin="1" end="${5-fb.vote}" var="pa">
                                                <i class="bi bi-star-fill"></i>
                                            </c:forEach>    


                                        </li>              
                                    </div>
                                    <h3 class="fs-6 fw-semi mt-2">${a.getName(fb.getUID())}

                                        <small class="float-end fw-normal small-tag">${fb.getDate()}</small>
                                    </h3>

                                    <div class="review-text">
                                        ${fb.description}
                                    </div>
                                </div>

                                <div class="col-md-2">

                                </div>
                            </div>
                        </c:forEach>   



                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid big-padding relatrd">
            <div class="container">
                <div class="section-tile row">
                    <div class="col-md-10 mb-4 text-center mx-auto">
                        <h2>Related Products</h2>
                    </div>
                </div>
                <div class="row">

                    <c:forEach items="${list4}" var="l">

                        <div class="col-lg-3 col-md-4 mb-4">
                            <div class="bg-white p-2 shadow-md">
                                <div class="text-center">
                                    <a href="detail?pid=${l.pId}">
                                        <img src="Image/${l.imageDf}" alt="">
                                    </a>
                                </div>
                                <div class="detail p-2">
                                    <h4 class="mb-1 fs-5 fw-bold">${l.imageDf}</h4>
                                    <b class="fs-4 text-danger">${l.priceOut}</b>

                                    <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>
                                        <ul class="mt-0 vgth">
                                            <li class="fs-8">
                                            <c:forEach begin="1" end="${d.getStar(l.pId)}" var="pa">
                                                <i class="bi text-warning bi-star-fill"></i>
                                            </c:forEach>
                                            <c:forEach begin="1" end="${5-d.getStar(l.pId)}" var="pa">
                                                <i class="bi bi-star-fill"></i>
                                            </c:forEach> 
                                        </li>
                                        <li class="float-end gvi">
                                            <i class="bi text-danger bi-heart-fill"></i>
                                        </li>
                                    </ul>
                                    <div class="row pt-2">
                                        <a href="detail?pid=${l.pId}">
                                            <div class="btn fw-bold w-100 btn-outline-danger" >Xem Sản Phẩm</div>
                                        </a>

                                        <!--                                        <div class="col-md-6">
                                        <c:set var="c" value="addcart"/>
                                        <c:if test="${sessionScope.acc != null}">
                                            <c:set var="c" value="addcartcookie"/>
                                        </c:if>
                                        <form action="${c}" method="post">
                                            <input type="hidden" name="product" value="${l.pId}">
                                            <input type="hidden" name="quantity" value="1">
                                            <input type="hidden" name="price" value="${l.priceOut}">
                                            <input type="hidden" name="det" value="1">
                                            <button class="btn fw-bold w-100 btn-outline-danger" type="submit">Giỏ hàng</button>
                                        </form>
                                    </div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        const minusBtn = document.querySelector(".minus");
        const plusBtn = document.querySelector(".plus");
        const quantityInput = document.querySelector(".quantity-input");

        minusBtn.addEventListener("click", () => {
            if (quantityInput.value > 1) {
                quantityInput.value--;
            }
        });

        plusBtn.addEventListener("click", () => {
            if (quantityInput.value < ${product.getQuantity()- sessionScope.cart.getItemById(product.pId).getQuantity()}) {
                quantityInput.value++;
            }
        });
    </script>




</html>