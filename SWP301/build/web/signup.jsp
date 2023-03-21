<%-- 
    Document   : signup
    Created on : Jan 12, 2023, 10:10:16 PM
    Author     : nhant
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Đăng kí tài khoản</title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <style>
            .text-danger{
                margin-top: -20px;
                padding-bottom: 10px;
            }
        </style>
    </head>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>

            <!--  ************************* Page Title Starts Here ************************** -->
            <div class="page-nav no-margin row">
                <div class="container">
                    <div class="row">
                        <h2 class="text-start">Đăng kí</h2>
                        <ul>
                            <li> <a href="listproduct"><i class="bi bi-house-door"></i>Trang chủ</a></li>
                            <li><i class="bi bi-chevron-double-right pe-2"></i>Đăng Kí</li>
                        </ul>

                        <!--####################### About US Starts Here ###################-->
                        <div class="container-fluid big-padding">
                            <div class="container">
                                <form action="register">
                                    <div class="row">
                                        <div class="col-xl-8 col-lg-7 col-md-10 py-5 mx-auto">
                                            <div class="login-card bg-white shadow-md p-5">
                                                <h1 style="color: red;size: 12px">${requestScope.ms}</h1>
                                            <h4 class="text-center mb-4">Nhập thông tin đăng kí</h4>
                                            <div class="form-row row">
                                                <div class="col-md-4 pt-2">
                                                    <label for="">Tên</label>                        
                                                </div>
                                                <div class="col-md-8">
                                                    <input  name="lname" type="text" placeholder="Nhập tên" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-row row">
                                                <div class="col-md-4 pt-2">
                                                    <label for="">Tài khoản</label>

                                                </div>
                                                <div class="col-md-8">
                                                    <input name="username" type="text" placeholder="Nhập tài khoản" class="form-control" required="">
                                                </div>
                                            </div>

                                            <div class="form-row row">
                                                <div class="col-md-4 pt-2">
                                                    <label for="">Số điện thoại</label>

                                                </div>
                                                <div class="col-md-8">
                                                    <input name="phone" type="text" placeholder="Nhập số điện thoại" class="form-control">
                                                </div>
                                            </div>
                                            <div class="form-row row">
                                                <div class="col-md-4 pt-2">
                                                    <label for="">Mật khẩu</label>

                                                </div>
                                                <div class="col-md-8">
                                                    <input name="pass" type="text" placeholder="Nhập mật khẩu" class="form-control" required="">
                                                </div>
                                            </div>
                                            <div class="form-row row">
                                                <div class="col-md-4 pt-2">
                                                    <label for="">Nhập lại mật khẩu</label>

                                                </div>
                                                <div class="col-md-8">
                                                    <input name="repass" type="text" placeholder="Nhập lại mật khẩu" class="form-control" required="">
                                                </div>
                                            </div>
                                            <div class="form-row row">
                                                <div class="col-md-4 pt-2">

                                                </div>
                                                <div class="col-md-8">
                                                    <button class="btn btn-danger regis-btn">Đăng kí</button>
                                                    <a href="forgotPassword.jsp"><span class="float-end pt-2">Quên mật khẩu?</span></a> 
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </bod>
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
    <script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
    <script src="assets/js/script.js"></script>


    <script>
        $(document).ready(function () {
            var pass = $("input[name='pass']");
            var repass = $("input[name='repass']");
            var icon = $("<i class='fa'></i>");

            repass.after(icon);

            repass.on("keyup", function () {
                if (repass.val() === pass.val()) {
                    icon.removeClass().addClass("fa fa-check text-success");
                } else {
                    icon.removeClass().addClass("fa fa-times text-danger");
                }
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            var pass = $("input[name='pass']");
            var repass = $("input[name='repass']");
            var error = $("<p class='text-danger'>Mật khẩu phải dài ít nhất 8 ký tự và chứa ít nhất một chữ cái viết hoa.</p>");
            var match = $("<p class='text-danger'>Mật khẩu không khớp</p>");

            pass.after(error);
            error.hide();
            repass.after(match);
            match.hide();

            pass.on("keyup", function () {
                if (pass.val().length < 8 || !/[A-Z]/.test(pass.val())) {
                    error.show();
                } else {
                    error.hide();
                }
            });

            repass.on("keyup", function () {
                if (repass.val() !== pass.val()) {
                    match.show();
                } else {
                    match.hide();
                }
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            var phone = $("input[name='phone']");
            var error = $("<p class='text-danger'>Số điện thoại phải có 10 số</p>");

            phone.after(error);
            error.hide();

            phone.on("keyup", function () {
                if (!/^\d{10}$/.test(phone.val())) {
                    error.show();
                } else {
                    error.hide();
                }
            });
        });
    </script>
    
    <script>
        $(document).ready(function () {
            $('.regis-btn').click(function (e) {
                var password = $('input[name="pass"]').val();
                var repassword = $('input[name="repass"]').val();

                if (password.length < 8 || !/[A-Z]/.test(password)) {
                    alert('Mật khẩu phải dài ít nhất 8 ký tự và chứa ít nhất một chữ cái viết hoa.');
                    e.preventDefault();
                } else if (password !== repassword) {
                    alert('Mật khẩu và Xác nhận mật khẩu phải khớp nhau.');
                    e.preventDefault();
                }
            }
            });
        });
    </script>




</html>