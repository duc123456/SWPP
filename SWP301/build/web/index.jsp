<%-- 
    Document   : index.jsp
    Created on : Jan 12, 2023, 9:23:58 PM
    Author     : nhant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Trang chủ</title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />

        <style>

            * {
                box-sizing: border-box;
            }
            form.example input[type=text] {
                padding: 10px;
                font-size: 17px;
                border: 1px solid grey;
                float: left;
                width: 80%;
                background: #f1f1f1;
            }

            /* Style the submit button */
            form.example button {
                float: left;
                width: 20%;
                padding: 10px;
                background: #2196F3;
                color: white;
                font-size: 17px;
                border: 1px solid grey;
                border-left: none; /* Prevent double borders */
                cursor: pointer;
            }

            form.example button:hover {
                background: #0b7dda;
            }

            /* Clear floats */
            form.example::after {
                content: "";
                clear: both;
            }


        </style>
    </head>
    <body>
        <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>
        <jsp:include page="menu.jsp"></jsp:include>
            <div class="row">
                <div class="col-md-1"></div>
                <div class="slider col-md-10">
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
                            <span class="visually-hidden">Pre</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>

            <div class="latest-products pt-5 pb-0">
                <div class="container-xl">
                    <div class="section-tile row">
                        <!--                        <div class="col-md-10 text-center mx-auto">
                                                    <h2>Featured Products</h2>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sit amet est sit amet sem malesuada bibendum. Nulla eget mauris at dolor fermentum blandit. Maecenas</p>
                                                </div>-->
                    </div>

                    <div class="row mt-5">


                        <div class="col md-2">
                            <form action="searchproduct" method="get">
                                <h4 class="fs-5">Lọc Theo Thương Hiệu</h4>
                                <ul class="filt">
                                <c:if test="${requestScope.xd == 1}">

                                    <c:if test="${requestScope.cat != null}">

                                        <c:forEach items="${requestScope.cate}" var="ca">
                                            <c:set var="c" value="0"/>
                                            <c:forEach items="${requestScope.cat}" var="i">

                                                <c:if test="${(i==ca.cid)}">
                                                    <li><a href=""><input class="form-check-input me-1 bg-danger border-danger" name="cat" checked="checked" type="checkbox" value="${ca.cid}" id="flexCheckDefault">${ca.cName} </a></li>   
                                                            <c:set var="c" value="${ca.cid}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${ca.cid != c}">
                                                <li><a href=""><input class="form-check-input me-1 bg-danger border-danger" name="cat"  type="checkbox" value="${ca.cid}" id="flexCheckDefault">${ca.cName} </a></li>  
                                                    </c:if>                                               
                                                </c:forEach>  
                                            </c:if> 
                                            <c:if test="${requestScope.cat == null}">
                                                <c:forEach items="${d.allCat}" var="i">
                                            <li><a href=""><input class="form-check-input me-1 bg-danger border-danger" name="cat" type="checkbox" value="${i.cid}" id="flexCheckDefault">${i.cName} </a></li>   
                                                </c:forEach>
                                            </c:if>    

                                    <c:if test="${requestScope.pri != null }">
                                        <h4 class="fs-5 mt-3">Lọc Theo Khoảng Giá</h4>
                                        <c:set value="${requestScope.spri}" var="spri"/>

                                        <ul class="filt">
                                            <c:forEach begin="0" end="${3}" var="i">
                                                <c:set var="c" value="-1"/>
                                                <c:forEach items="${requestScope.pri}" var="pri">
                                                    <c:if test="${pri==i}" >

                                                        <li> <input class="form-check-input me-1 bg-danger border-danger" checked  name="pri" type="checkbox" value="${i}"  id="flexCheckDefault">${spri[i]}</li> 
                                                            <c:set var="c" value="${i}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${i != c}">
                                                    <li> <input class="form-check-input me-1 bg-danger border-danger"   name="pri" type="checkbox" value="${i}"  id="flexCheckDefault">${spri[i]}</li> 
                                                    </c:if>

                                            </c:forEach> 
                                        </ul>            
                                    </c:if>
                                    <c:if test="${requestScope.pri == null }">
                                        <h4 class="fs-5 mt-3">Lọc Theo Khoảng Giá</h4>
                                        <ul class="filt">
                                            <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"  type="checkbox" value="0"  id="flexCheckDefault"> 3 triệu - 10 triệu  </li>
                                            <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"   type="checkbox" value="1"  id="flexCheckDefault">  10 triệu - 25 triệu   </li>
                                            <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"   type="checkbox" value="2"  id="flexCheckDefault"> 25 triệu - 80 triệu  </li>
                                            <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"   type="checkbox" value="3"  id="flexCheckDefault"> 80 triệu - 120 triệu  </li>
                                        </ul 
                                    </c:if>



                                    <c:if test="${requestScope.size != null }">

                                        <h4 class="fs-5 mt-3">Lọc Theo Inch</h4>

                                        <c:set value="${requestScope.ssize}" var="ssize"/>

                                        <ul class="filt">
                                            <c:forEach begin="0" end="${3}" var="i">
                                                <c:set var="c" value="-1"/>
                                                <c:forEach items="${requestScope.size}" var="size">
                                                    <c:if test="${size==i}" >

                                                        <li> <input class="form-check-input me-1 bg-danger border-danger" checked  name="size" type="checkbox" value="${i}"  id="flexCheckDefault">${ssize[i]}</li> 
                                                            <c:set var="c" value="${i}"/>
                                                        </c:if>
                                                    </c:forEach>
                                                    <c:if test="${i != c}">
                                                    <li> <input class="form-check-input me-1 bg-danger border-danger"   name="size" type="checkbox" value="${i}"  id="flexCheckDefault">${ssize[i]}</li> 
                                                    </c:if>

                                            </c:forEach> 
                                        </ul> 
                                    </c:if>
                                    <c:if test="${requestScope.size == null }">
                                        <h4 class="fs-5 mt-3">Lọc Theo Inch</h4>


                                        <ul class="filt">
                                            <li>  <input class="form-check-input border-danger bg-danger" type="checkbox" name="size" id="exampleRadios1" value="0"> 30 inch -  45 inch</li>
                                            <li>  <input class="form-check-input border-danger bg-danger" type="checkbox" name="size" id="exampleRadios1" value="1"> 45 inch -  60 inch </li>
                                            <li>  <input class="form-check-input border-danger bg-danger"  type="checkbox" name="size" id="exampleRadios1" value="2" > 60 inch -  75 inch</li>
                                            <li>  <input class="form-check-input border-danger bg-danger"  type="checkbox" name="size" id="exampleRadios1" value="3" > 75 inch - 90 inch</li>
                                        </ul>
                                    </c:if>         

                                </c:if>








                                <c:if test="${requestScope.xd != 1}">
                                    <c:forEach items="${requestScope.cate}" var="ca">

                                        <li><a href=""><input class="form-check-input me-1 bg-danger border-danger" name="cat" type="checkbox" value="${ca.cid}" id="flexCheckDefault">${ca.cName} </a></li>   

                                    </c:forEach>


                                    <h4 class="fs-5 mt-3">Lọc Theo Khoảng Giá</h4>
                                    <ul class="filt">
                                        <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"  type="checkbox" value="0"  id="flexCheckDefault"> 3 triệu - 10 triệu  </li>
                                        <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"   type="checkbox" value="1"  id="flexCheckDefault">  10 triệu - 25 triệu   </li>
                                        <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"   type="checkbox" value="2"  id="flexCheckDefault"> 25 triệu - 80 triệu  </li>
                                        <li> <input class="form-check-input me-1 bg-danger border-danger" name="pri"   type="checkbox" value="3"  id="flexCheckDefault"> 80 triệu - 120 triệu  </li>
                                    </ul>
                                    <h4 class="fs-5 mt-3">Lọc Theo Inch</h4>


                                    <ul class="filt">
                                        <li>  <input class="form-check-input border-danger bg-danger" type="checkbox" name="size" id="exampleRadios1" value="0"> 30 inch -  45 inch</li>
                                        <li>  <input class="form-check-input border-danger bg-danger" type="checkbox" name="size" id="exampleRadios1" value="1"> 45 inch -  60 inch </li>
                                        <li>  <input class="form-check-input border-danger bg-danger"  type="checkbox" name="size" id="exampleRadios1" value="2" > 60 inch -  75 inch</li>
                                        <li>  <input class="form-check-input border-danger bg-danger"  type="checkbox" name="size" id="exampleRadios1" value="3" > 75 inch - 90 inch</li>
                                    </ul>


                                </c:if>









                                <div class="col-md-6">
                                    <button class="btn mb-2 fw-bold w-100 btn-danger">Tìm kiếm</button>
                                </div>

                        </form>










                    </div>


                    <div class="col-md-10">
                        <div class="row">
                            <!--                            <nav aria-label="breadcrumb">
                                                            <ul class="pagination">
                           
                            

                    </ul>    
                </nav>    -->
                            <c:forEach items="${product}" var="p">

                                <div class="col-lg-3 col-md-3 mb-4" >
                                    <c:set var="x" value="detail?pid=${p.pId}">

                                    </c:set>
                                    <c:set var="x1" value="Xem Sản Phẩm"></c:set>
                                    <c:if test="${daXem != null}">

                                        
                                        <c:set var="x1" value="Xóa Sản Phẩm"></c:set>
                                    </c:if>

                                    <a href="${x}">
                                        <div class="bg-white p-2 shadow-md">
                                            <div class="text-center" style="min-height: 176px !important;">

                                                <img  src="Image/${p.imageDf}" alt="">
                                            </div>
                                            <div class="detail p-2">
                                                <h4 class="mb-1 fs-5 fw-bold name-Product">${p.name}</h4>
                                                <b class="fs-4 text-danger"><fmt:formatNumber value="${p.priceOut}" pattern="#,##0 'VND'" /></b>

                                                <s class="fs-5 ps-3"></s>

                                                <ul class="mt-0 vgth">
                                                    <li class="fs-8">

                                                        <c:forEach begin="1" end="${d.getStar(p.pId)}" var="pa">
                                                            <i class="bi text-warning bi-star-fill"></i>
                                                        </c:forEach>
                                                        <c:forEach begin="1" end="${5-d.getStar(p.pId)}" var="pa">
                                                            <i class="bi bi-star-fill"></i>
                                                        </c:forEach>        

                                                    </li>
                                                    <li class="float-end gvi">
                                                        <i class="bi text-danger bi-heart-fill"></i>
                                                    </li>
                                                </ul>
                                                <div class="row pt-2">

                                                </div>
                                            </div>
                                        </div>
                                                <c:if test="${daXem != null}">

                                      <a href="sanphamdaxem?pId=${p.pId}&&uId=${acc.uId}"> <div class="btn fw-bold w-100 btn-outline-danger" >${x1}</div></a>
                                                </c:if>
                                       <c:if test="${daXem == null}">

                                      <div class="btn fw-bold w-100 btn-outline-danger" >${x1}</div>
                                                </c:if>
                                                
                                       



                                    </a>

                                </div>

                            </c:forEach>

                            <nav aria-label="breadcrumb">
                                <ul class="pagination">



                                    <c:if test="${requestScope.xd == 1}">
                                        <c:set var="page" value="${requestScope.page}"/>
                                        <c:forEach begin="1" end="${requestScope.num}" var="i">

                                            <li class="page-item ${page == i?"active":""}"><a href="searchproduct?page=${i}${requestScope.cats}${requestScope.pris}${requestScope.sizes}${requestScope.most}" class="page-link">${i}</a></li> 

                                        </c:forEach>

                                    </c:if>

                                    <c:if test="${requestScope.xd != 1}">
                                        <c:forEach begin="1" end="${endP}" var="pa">
                                            <li class="page-item ${tagw == pa?"active":""}"><a href="listproduct?index=${pa}&find=${requestScope.find}" class="page-link">${pa}</a></li>   
                                            </c:forEach>

                                    </c:if>    

                                </ul>    
                            </nav>    

                             <c:if test="${empty product}">
                                        <tr>
                                            <td colspan="6" style="text-align: center; font-size: 24px; padding: 50px 0;">KHÔNG CÓ SẢN PHẨM NÀO</td>
                                        </tr>
                                    </c:if>
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
        <script>
            const productTitles = document.querySelectorAll('.name-Product');

            productTitles.forEach(title => {
                const titleText = title.textContent;

                if (titleText.length > 24) {
                    const shortenedText = titleText.slice(0, 21) + '...';
                    title.textContent = shortenedText;
                }
            });
        </script>
        <script>

        </script>

</html>