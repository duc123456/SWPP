<%-- 
    Document   : menu
    Created on : Jan 31, 2023, 11:40:38 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
    .logo{
        height: 60px;
        width: 120px;
        padding-bottom: 0;


    }
</style>


<html>


    <header class="container-fluid bg-white">
        <c:if test="${sessionScope.acc ==null}">
            <div class="header-top bg-gray  border-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <ul class="d-inline-flex pt-0 pt-md-2 fs-6">
                                <li class="p-2 "><i class="bi bi-envelope"></i> Truongan@gmail.com </li>
                                <li class="p-2 d-none d-md-block"><i class="bi bi-headphones"></i> 0986868686 </li>
                            </ul>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <ul class="ms-auto d-inline-flex">
                                <li class="p-2"><a  href="login.jsp"><button class="btn px-4 btn-danger">Đăng Nhập</button></a></li>
                                <li class="p-2"><a  href="signup.jsp"><button class="btn px-4 btn-outline-danger">Đăng Ký</button></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
        <c:if test="${sessionScope.acc !=null}">
            <div class="header-top bg-gray  border-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <ul class="d-inline-flex pt-0 pt-md-2 fs-6">
                                <li class="p-2 "><i class="bi bi-envelope"></i> Truongan@gmail.com</li>
                                <li class="p-2 d-none d-md-block"><i class="bi bi-headphones"></i> 0986868686</li>
                            </ul>
                        </div>
                        <div class="col-md-4 d-flex align-items-end">
                            <ul class="ms-auto d-inline-flex">
                                <jsp:useBean id="d" class="dal.DAO"></jsp:useBean>  
                                <li class="p-2"><a  href="profilee.jsp"><img src="uploadDir/${d.getUserImage(sessionScope.acc.uId)}" class="img-radius"  style="max-width: 50px;max-height: 50px; border-radius: 100%" title="${sessionScope.acc.fName}"></a></li>
                                <li class="p-2" style="margin-top: 6px"><a  href="logout"><button class="btn px-4 btn-danger">Đăng Xuất</button></a></li>


                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>








        <div class="logo-contaienr p-2">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-9 pt-1 pb-2">
                        <a href="listproduct">


                            <img style="border-radius:  100%"class="logo" src="Image/logo2.png" alt="">


                        </a> 
                    </div>
                    <!-- thanh tim kiem -->       


                    <div class="col-md-6 d-none d-md-block pt-2">
                        <form action="listproduct" class="input-group pt-1 mb-0">
                            <input type="text"  name="find" class="form-control border-end-0 mb-0" placeholder="Search Apps" aria-label="Recipient's username" aria-describedby="basic-addon2">
                            <span class="input-group-text sit border-start-0" id="basic-addon2"><i class="bi bi-search"></i></span>
                        </form>
                    </div>


                    <div class="col-md-3 col-3 pt-1 text-end">
                        <a href="cartsession">
                            <button type="button" class="btn btn-light shadow-md border position-relative" title="Giỏ Hàng">
                                <i class="bi fs-4 bi-basket"></i>
                                <span class="position-absolute fs-6 top-0 start-100 translate-middle badge rounded-pill bg-danger">

                                    <c:if test="${sessionScope.acc != null}">
                                        <c:if test="${sessionScope.cart != null}">
                                            ${sessionScope.size}
                                        </c:if>
                                        <c:if test="${sessionScope.cart == null}">
                                            0
                                        </c:if>

                                    </c:if>
                                    <c:if test="${sessionScope.acc == null}">
                                        <c:if test="${sessionScope.cart != null}">
                                            ${sessionScope.size}
                                        </c:if>
                                        <c:if test="${sessionScope.cart == null}">
                                            0
                                        </c:if>

                                    </c:if>







                                </span>
                            </button>
                        </a>

                        <button type="button" class="btn d-none d-md-inline-block ms-3 btn-light shadow-md border position-relative" title="Yêu Thích">
                            <i class="bi fs-4 bi-heart"></i>
                            <span class="position-absolute fs-6 top-0 start-100 translate-middle badge rounded-pill bg-warning">
                                2

                            </span>
                        </button>

                    </div>
                </div>
            </div>   
        </div>
        <div class="menu-bar bg-danger container-fluid border-top">
            <div class="container">
                <h6 class="d-md-none text-white p-3 mb-0 fw-bold">Menu 
                    <a class="text-white" data-bs-target="#menu" data-bs-toggle="collapse" aria-expanded="false" aria-controls="menu"><i class="bi cp bi-list float-end fs-1 dmji"></i></a> 
                </h6>
                <ul id="menu" class=" navcol fw-bold d-none d-md-inline-flex">
                    <li class="p-21 px-4"><a class="text-white" href="listproduct">Trang chủ</a></li>
                    <li class="p-21 px-4"><a class="text-white" href="">Thương hiệu<i class="bi pt-2 bi-chevron-down"></i></a> 
                        <div class="inner-div">
                            <ul class="">
                                <c:forEach items="${requestScope.cate}" var="ca">
                                    <li><a href="listproduct?cat1=${ca.cid}">${ca.getcName()}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </li>

                    <li class="p-21 px-4"><a class="text-white" href="">Loại TV<i class="bi pt-2 bi-chevron-down"></i></a> 

                        <div class="inner-div">
                            <ul class="">
                                <c:forEach items="${requestScope.type}" var="ty">
                                    <li><a href="listproduct?type=${ty.tId}">${ty.gettName()}</a></li>
                                    </c:forEach>


                            </ul>
                        </div>
                    </li>
                    <li class="p-21 px-4"><a class="text-white" href="searchproduct?most=1">Sản phẩm bán chạy</a> 
                        <!--                            <div class="inner-div">
                                                        <ul class="">
                                                            <li><a href="index.jsp">Home</a></li>
                                                            <li><a href="about.jsp">About US</a></li>
                                                            <li><a href="contact.jsp">Contact US</a></li>
                                                            <li><a href="product.jsp">Product Listing</a></li>
                                                            <li><a href="detail.jsp">Product Detail</a></li>
                                                            <li><a href="login.jsp">login</a></li>
                                                            <li><a href="signup.jsp">Sing Up</a></li>
                                                            <li><a href="cart.jsp">Cart</a></li>
                                                        </ul>
                                                    </div>-->
                    </li>
                    <!--                        <li class="p-21 px-4"><a class="text-white" href=""> <i class="bi pt-2 bi-chevron-down"></i></a></li>-->
                    <li class="p-21 px-4"><a class="text-white" href="">Giảm giá sâu</a></li>
                    <li class="p-21 px-4"><a class="text-white" href="">Quà tặng</a></li>
                    <li class="p-21 px-4"><a class="text-white" href="">Liên hệ</a></li>
                    <li class="p-21 px-4"><a class="text-white" href=""> </a></li>


                </ul>

            </div>
        </div>
    </header>

</html>
