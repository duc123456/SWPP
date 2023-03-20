<%-- 
    Document   : login
    Created on : Jan 7, 2023, 9:02:05 PM
    Author     : nhant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Trang đăng nhập </title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
    </head>
    <style>
       
    </style>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>

            <!--  ************************* Page Title Starts Here ************************** -->
            <div class="page-nav no-margin row">
                
                <div class="container">
                    <div class="row">
                        <h3 style="color: red">${requestScope.ms}</h3>
                        <h2 class="text-start">ĐĂNG NHẬP</h2>
                        <ul>
                            <li> <a href="#"><i class="bi bi-house-door"></i>Trang chủ</a></li>
                            <li><i class="bi bi-chevron-double-right pe-2"></i>ĐĂNG NHẬP</li>
                        </ul>
                    </div>
                </div>
            </div>


            <!--####################### About US Starts Here ###################-->
            <div class="container-fluid big-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 col-md-10 py-5 mx-auto">
                            <form class="login-card bg-white shadow-md p-5" action="login" method="post">

                                <h4 class="text-center mb-5">Nhập thông tin đăng nhập</h4>
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <label class="float-end" for="">Tài khoản</label>
                                                                         
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text" name="user" placeholder="Nhập tài khoản" class="form-control" required="">
                                    </div>
                                </div>
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <a  class="float-end" for="">Mật khẩu</a>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="password" name="pass" placeholder="Nhập mật khẩu" class="form-control" required="">
                                    </div>
                                </div>
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">

                                    </div>
                                    <div class="col-md-8">
                                        <button type="submit" value="Login" class="btn btn-danger">Đăng Nhập</button>
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:9999/SWP391/logingg&response_type=code&client_id=55055519665-ah0bae7b1vdvc36fdd0c78tl3c6v0cpf.apps.googleusercontent.com&approval_prompt=force">Login GG</a>

                                        <a href="forgotPassword.jsp"><span class="float-end pt-2">Quên mật khẩu?</span></a> 
                                    </div>
                                </div>
                            </form>
                        </div>
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

</html>
