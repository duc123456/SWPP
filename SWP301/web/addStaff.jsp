<%-- 
    Document   : addStaff
    Created on : Mar 7, 2023, 12:59:46 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Title -->
    <title>Create new account | Graindashboard UI Kit</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="public/img/favicon.ico">

    <!-- Template -->
    <link rel="stylesheet" href="public/graindashboard/css/graindashboard.css">
  </head>

  <body class="">

    <main class="main">

      <div class="content">

			<div class="container-fluid pb-5">

				<div class="row justify-content-md-center">
					<div class="card-wrapper col-12 col-md-4 mt-5">
						<div class="brand text-center mb-3">
							<img style="border-radius:  100%; max-height: 120px;max-width: 120px"class="logo" src="Image/logo2.png" alt="">
						</div>
						<div class="card">
							<div class="card-body">
                                                            <h1 style="color: red;size: 12px">${requestScope.ms}</h1>
								<h4 class="card-title">Tạo tài khoản nhân viên</h4>
                                                                <form action="addstaff">
									<div class="form-group">
										<label for="name">Tài khoản</label>
										<input type="text" class="form-control" id="name" name="username" required="" autofocus="">
									</div>
									<div class="form-group">
										<label for="name">Tên</label>
										<input type="text" class="form-control" id="name" name="fname" required="" autofocus="">
									</div>

									<div class="form-group">
										<label for="email">Địa chỉ E-Mail</label>
										<input id="email" type="email" class="form-control" name="email" required="">
									</div>

									<div class="form-row">
										<div class="form-group col-md-6">
											<label for="password">Mật khẩu
											</label>
											<input id="password" type="password" class="form-control" name="pass" required="">
										</div>
										<div class="form-group col-md-6">
											<label for="password-confirm">Nhập lại mật khẩu
											</label>
											<input id="password-confirm" type="password2" class="form-control" name="repass" required="">
										</div>
									</div>
                                                                    <div class="form-row">
										<div class="form-group col-md-6">
											<label for="password">Nhân viên nhập hàng
											</label>
                                                                                    <input id="password" value="2" type="radio" class="form-control" name="role" required="" style="max-height: 20px;max-width: 20px">
										</div>
										<div class="form-group col-md-6">
											<label for="password-confirm">Nhân viên chốt đơn
											</label>
                                                                                    <input id="password-confirm"  value="3" type="radio" class="form-control" name="role" required="" style="max-height: 20px;max-width: 20px">
										</div>
									</div>
									<div class="form-group no-margin row">
                                                                            <button class="btn btn-primary btn-block col-md-6 regis-btn" style="margin-right: 60px;margin-left: 10px">
											Đăng kí
										</button> 
										<a href="user" class="btn btn-primary btn-block col-md-4">
											Bảng người dùng
										</a>
									</div>
									
								</form>
							</div>
						</div>
						<footer class="footer mt-3">
							<div class="container-fluid">
								<div class="footer-content text-center small">
									<span class="text-muted">&copy; 2019 Graindashboard. All Rights Reserved.</span>
								</div>
							</div>
						</footer>
					</div>
				</div>



			</div>

      </div>
    </main>


	<script src="public/graindashboard/js/graindashboard.js"></script>
    <script src="public/graindashboard/js/graindashboard.vendor.js"></script>
    <script>
        $(document).ready(function () {
            var pass = $("input[name='pass']");
            var repass = $("input[name='repass']");
            var error = $("<p class='text-danger'>Mật khẩu phải hơn 8 kí tự và 1 kí tự viết hoa</p>");
            var match = $("<p class='text-danger'>Mật khẩu không trùng khớp</p>");

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
            var email = $("input[name='email']");
            var error = $("<p class='text-danger'>Please enter a valid email</p>");

            email.after(error);
            error.hide();

            phone.on("keyup", function () {
                if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.val())) {
                    error.show();
                } else {
                    error.hide();
                }
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $('regis-btn').click(function (e) {
                var password = $('input[name="pass"]').val();
                var repassword = $('input[name="repass"]').val();

                if (password.length < 8 || !/[A-Z]/.test(password)) {
                    alert('Mật khẩu phải hơn 8 kí tự và 1 kí tự viết hoa');
                    e.preventDefault();
                } else if (password !== repassword) {
                    alert('mật khẩu không trùng khớp');
                    e.preventDefault();
                }
            }
            });
        });
    </script>
    
  </body>
</html>
