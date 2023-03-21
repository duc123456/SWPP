<%-- 
    Document   : information
    Created on : Feb 28, 2023, 3:14:54 PM
    Author     : Dell
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
        <style>
        body {
            background-color: #f9f9fa
        }

        .padding {
            padding: 3rem !important
        }

        .user-card-full {
            overflow: hidden;
        }

        .card {
            border-radius: 5px;
            -webkit-box-shadow: 0 1px 20px 0 rgba(69,90,100,0.08);
            box-shadow: 0 1px 20px 0 rgba(69,90,100,0.08);
            border: none;
            margin-bottom: 30px;
        }

        .m-r-0 {
            margin-right: 0px;
        }

        .m-l-0 {
            margin-left: 0px;
        }

        .user-card-full .user-profile {
            border-radius: 5px 0 0 5px;
        }

        .bg-c-lite-green {
            background: -webkit-gradient(linear, left top, right top, from(#f29263), to(#ee5a6f));
            background: #dc3545;
        }

        .user-profile {
            padding: 20px 0;
        }

        .card-block {
            padding: 1.25rem;
        }

        .m-b-25 {
            margin-bottom: 25px;
        }

        .img-radius {
            border-radius: 5px;
        }



        h6 {
            font-size: 14px;
        }

        .card .card-block p {
            line-height: 25px;
        }

        @media only screen and (min-width: 1400px){
            p {
                font-size: 14px;
            }
        }

        .card-block {
            padding: 1.25rem;
        }

        .b-b-default {
            border-bottom: 1px solid #e0e0e0;
        }

        .m-b-20 {
            margin-bottom: 20px;
        }

        .p-b-5 {
            padding-bottom: 5px !important;
        }

        .card .card-block p {
            line-height: 25px;
        }

        .m-b-10 {
            margin-bottom: 10px;
        }

        .text-muted {
            color: #919aa3 !important;
        }

        .b-b-default {
            border-bottom: 1px solid #e0e0e0;
        }

        .f-w-600 {
            font-weight: 600;
        }

        .m-b-20 {
            margin-bottom: 20px;
        }

        .m-t-40 {
            margin-top: 20px;
        }

        .p-b-5 {
            padding-bottom: 5px !important;
        }

        .m-b-10 {
            margin-bottom: 10px;
        }

        .m-t-40 {
            margin-top: 20px;
        }

        .user-card-full .social-link li {
            display: inline-block;
        }

        .user-card-full .social-link li a {
            font-size: 20px;
            margin: 0 10px 0 0;
            -webkit-transition: all 0.3s ease-in-out;
            transition: all 0.3s ease-in-out;
        }



    </style>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> PROFILE</title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <c:if test="${acc != null}">
            <form action="pay" method="post" onsubmit="return validateForm()" name="myForm">
                <input type="hidden" name="id" value="${sessionScope.acc.uId}">
            <div class="page-content page-container" id="page-content">
                <div class="padding">
                    <div class="row container d-flex justify-content-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="card user-card-full">
                                <div class="row m-l-0 m-r-0">
<!--                                    <div class="col-sm-4 bg-c-lite-green user-profile">
                                        <div class="card-block text-center text-white">
                                            <div class="m-b-25">
                                                <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image">
                                            </div>
                                            <h6 class="f-w-600">${sessionScope.acc.lName}</h6>
                                            <a href="">Change</a>
                                            <img href="listproduct" src="Image/edituser.png" alt="" style="width: 50px; height: 50px;" >
                                        </div>
                                    </div>-->
                                    <div class="col-sm-8">
                                        <div class="card-block">
                                            <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Nhập Thông Tin Giao Hàng
</h6>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Họ   </p>
                                                    <input type="text"  name="ho" value="${sessionScope.acc.getlName()}"  class="form-control" readonly>
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Tên</p>
                                                    <input type="text"  name="ten" value="${sessionScope.acc.getfName()}" class="form-control" readonly>
                                                </div>

                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Địa Chỉ</p>
                                                    <input type="text"  name="dia" value="${sessionScope.acc.getAddress()}" class="form-control">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Số Điện Thoại</p>
                                                    <input type="text"  name="so" value="${sessionScope.acc.getPhone()}" class="form-control">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Chú Ý</p>
                                                    <input type="text"  name="note" class="form-control">
                                                </div>
                                         
                                                <div class="col-md-8">
                                                    <button type="submit" class="btn btn-danger change-btn">Xác Nhận</button>
                                                </div>
                                              
                                            </div>
                                            <ul class="social-link list-unstyled m-t-40 m-b-10">
                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

  </form>
        </c:if>
         <c:if test="${acc == null}">
            <form action="pay" method="post" onsubmit="return validateForm()" name="myForm">
                <input type="hidden" name="id" value="${sessionScope.acc.uId}">
            <div class="page-content page-container" id="page-content">
                <div class="padding">
                    <div class="row container d-flex justify-content-center">
                        <div class="col-xl-12 col-md-12">
                            <div class="card user-card-full">
                                <div class="row m-l-0 m-r-0">
<!--                                    <div class="col-sm-4 bg-c-lite-green user-profile">
                                        <div class="card-block text-center text-white">
                                            <div class="m-b-25">
                                                <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image">
                                            </div>
                                            <h6 class="f-w-600">${sessionScope.acc.lName}</h6>
                                            <a href="">Change</a>
                                            <img href="listproduct" src="Image/edituser.png" alt="" style="width: 50px; height: 50px;" >
                                        </div>
                                    </div>-->
                                    <div class="col-sm-8">
                                        <div class="card-block">
                                            <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Nhập Thông Tin Giao Hàng
</h6>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Họ   </p>
                                                    <input type="text"  name="ho" value="${sessionScope.acc.getlName()}"  class="form-control">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Tên</p>
                                                    <input type="text"  name="ten" value="${sessionScope.acc.getfName()}" class="form-control">
                                                </div>

                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Địa Chỉ</p>
                                                    <input type="text"  name="dia" value="${sessionScope.acc.getAddress()}" class="form-control">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Số Điện Thoại</p>
                                                    <input type="text"  name="so" value="${sessionScope.acc.getPhone()}" class="form-control">
                                                </div>
                                                <div class="col-sm-6">
                                                    <p class="m-b-10 f-w-600">Chú Ý</p>
                                                    <input type="text"  name="note" class="form-control">
                                                </div>
                                         
                                                <div class="col-md-8">
                                                    <button type="submit" class="btn btn-danger change-btn">Xác Nhận</button>
                                                </div>
                                              
                                            </div>
                                            <ul class="social-link list-unstyled m-t-40 m-b-10">
                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="facebook" data-abc="true"><i class="mdi mdi-facebook feather icon-facebook facebook" aria-hidden="true"></i></a></li>
                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="twitter" data-abc="true"><i class="mdi mdi-twitter feather icon-twitter twitter" aria-hidden="true"></i></a></li>
                                                <li><a href="#!" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="instagram" data-abc="true"><i class="mdi mdi-instagram feather icon-instagram instagram" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

  </form>
        </c:if>

            
    </body>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>
    
  <script>
    function validateForm() {
        var ho = document.forms["myForm"]["ho"].value;
        var ten = document.forms["myForm"]["ten"].value;
        var dia = document.forms["myForm"]["dia"].value;
        var so = document.forms["myForm"]["so"].value;
        var note = document.forms["myForm"]["note"].value;
      
        var phonePattern = /^\d{10}$/; // Số điện thoại phải có đúng 10 chữ số
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Định dạng email hợp lệ
        if (ho == "" || ten == "" || dia == "" || so == "") {
            alert("Vui lòng điền đầy đủ thông tin.");
            return false;
        }
        if (!phonePattern.test(so)) {
            alert("Số điện thoại không hợp lệ. Vui lòng nhập lại.");
            return false;
        }
        if (!emailPattern.test(email)) {
            alert("Địa chỉ email không hợp lệ. Vui lòng nhập lại.");
            return false;
        }
        return true;
    }
</script>



</html>
