<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<html>
    <head>
        <meta charset='utf-8'>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <title>Snippet - BBBootstrap</title>
        <link
            href='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css'
            rel='stylesheet'>
        <link
            href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'
            rel='stylesheet'>
        <script type='text/javascript'
        src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>
        <style>
            .placeicon {
                font-family: fontawesome
            }

            .custom-control-label::before {
                background-color: #dc3545;
                border: #dee2e6
            }
        </style>
    </head>
    <body oncontextmenu='return false' class='snippet-body bg-info'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-social/5.1.1/bootstrap-social.css">
        <div>
            <!-- Container containing all contents -->
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-9 col-lg-7 col-xl-6 mt-5">
                        <!-- White Container -->
                        <div class="container bg-white rounded mt-2 mb-2 px-0">
                            <!-- Main Heading -->
                            <div class="row justify-content-center align-items-center pt-3">
                                <h1>
                                    <strong>Đặt lại mật khẩu</strong>
                                    <h3 style="color: red">${requestScope.ms}</h3>
                                </h1>
                            </div>
                            <div class="pt-3 pb-3">
                                <form class="form-horizontal" action="newPassword" method="POST">
                                    <!-- User Name Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="text" name="password" placeholder="&#xf084; &nbsp; Mật khẩu mới"
                                                   class="form-control border-info placeicon" required="">
                                        </div>
                                    </div>
                                    <!-- Password Input -->
                                    <div class="form-group row justify-content-center px-3">
                                        <div class="col-9 px-0">
                                            <input type="text" name="confPassword"
                                                   placeholder="&#xf084; &nbsp; Xác nhận mật khẩu mới"
                                                   class="form-control border-info placeicon"  required="">
                                        </div>
                                    </div>

                                    <!-- Log in Button -->
                                    <div class="form-group row justify-content-center">
                                        <div class="col-3 px-3 mt-3">
                                            <input type="submit" value="Xác nhận"
                                                   class="btn btn-block btn-info">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!-- Alternative Login -->
                            <div class="mx-0 px-0 bg-light">

                                <!-- Horizontal Line -->
                                <div class="px-4 pt-5">
                                    <hr>
                                </div>
                                <!-- Register Now -->
                                <div class="pt-2">
                                    <div class="row justify-content-center">
                                        <h5>
                                            Không có tài khoản?<span><a href="#"
                                                                        class="text-danger">Đăng ký ngay!</a></span>
                                        </h5>
                                    </div>
                                    <div
                                        class="row justify-content-center align-items-center pt-4 pb-5">
                                        <div class="col-4">

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type='text/javascript'
        src='https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js'></script>

        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/plugins/scroll-fixed/jquery-scrolltofixed-min.js"></script>
        <script src="assets/plugins/testimonial/js/owl.carousel.min.js"></script>
        <script src="assets/js/script.js"></script>

        <script>
            $(document).ready(function () {
                var pass = $("input[name='password']");
                var repass = $("input[name='confPassword']");
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
                var pass = $("input[name='password']");
                var repass = $("input[name='confPassword']");
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
    </body>
</html>