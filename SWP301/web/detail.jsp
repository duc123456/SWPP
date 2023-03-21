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
        <title>Chi tiết sản phẩm</title>
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

            input[type="radio"] {
                margin-right: 5px;
            }
            input[type="submit"] {
                background-color: #4caf50;
                color: #fff;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
            }
            input[type="submit"]:hover {
                background-color: #3e8e41;
            }

            .minus{
                background-color: white;
            }
            .plus{
                background-color: white;
            }

        </style>



    </head>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>
        <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>

            <!--  ************************* Page Title Starts Here ************************** -->
            <div class="page-nav no-margin row">
                <div class="container">
                    <div class="row">
                        <h2 class="text-start">${product.name}</h2>
                    <ul>
                        <li> <a href="#"><i class="bi bi-house-door"></i>Trang chủ</a></li>
                        <li><i class="bi bi-chevron-double-right pe-2"></i>Sản phẩm</li>
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
                        <img src="ProductImage/${d.getProductByID(product.pId).imageDf}" alt="">
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

                                 
                                </div>
                            </div>
                               </form>

                    </div>
                </div>

                <div class="row product-detail">
                    <h4>Thông tin sản phẩm</h4>

                    <p class="mb-3 multiline">${product.description}</p>

                </div>
                <jsp:useBean id="a" class="dal.DAO" scope="request"></jsp:useBean>
                    <div class="row review">
                        <div class="col-md-8">

                            <h4>Đánh giá sản phẩm</h4>

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
                        <form action="feedback" method="post">
                            <c:if test="${xn == 1}">                       
                                <input type="hidden" name="productfeebid" value="${product.pId}">

                                <input type="hidden" name="pid" value="${product.pId}">
                                <input type="hidden" name="userbe" value="${sessionScope.acc.uId}">
                                <input type="hidden" name="xn" value="${product.pId}">
                                <input type="hidden" name="xd" value="${product.pId}">

                                <div class="form-group">
                                    <label for="rating">Đánh giá:</label>
                                    <div>
                                        <input type="radio" id="star1" name="vote" value="1" />
                                        <label for="star1">  <i class="bi bi-star-fill"></i></label>
                                        <input type="radio" id="star2" name="vote" value="2" />
                                        <label for="star2"> <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i></label>
                                        <input type="radio" id="star3" name="vote" value="3" />
                                        <label for="star3"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i></label>
                                        <input type="radio" id="star4" name="vote" value="4" />
                                        <label for="star4"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i></label>
                                        <input type="radio" id="star5" name="vote" value="5" />
                                        <label for="star5"><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i></label>


                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="comment">Nhận xét:</label>
                                    <textarea id="comment" name="comment" rows="5" cols="5" class="form-control"></textarea>
                                </div>
                                <div class="form-group">
                                    <input type="submit" value="Gửi đánh giá" />
                                </div>
                            </c:if>
                        </form>




                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid big-padding relatrd">
            <div class="container">
                <div class="section-tile row">
                    <div class="col-md-10 mb-4 text-center mx-auto">
                        <h2>Sản phẩm liên quan</h2>
                    </div>
                </div>
                <div class="row">

                    <c:forEach items="${list4}" var="l">

                        <div class="col-lg-3 col-md-4 mb-4">
                            <div class="bg-white p-2 shadow-md">
                                <div class="text-center">
                                    <a href="detail?pid=${l.pId}">
                                        <img src="ProductImage/${d.getProductByID(l.pId).imageDf}" alt="">
                                    </a>
                                </div>
                                <div class="detail p-2">
                                    <h4 class="mb-1 fs-5 fw-bold">${l.name}</h4>
                                    <b class="fs-4 text-danger">${l.priceOut}</b>

                                   
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
        <jsp:include page="footer.jsp"></jsp:include>

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