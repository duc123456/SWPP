<%-- 
    Document   : ChangePassword
    Created on : Feb 7, 2023, 3:22:46 PM
    Author     : nhant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title> Edit Pass  |</title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />


    </head>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>

            <!--  ************************* Page Title Starts Here ************************** -->
            <div class="page-nav no-margin row">
                <div class="container">
                    <div class="row">
                        <h2 class="text-start">Profile Page</h2>
                        <ul>
                            <li> <a href="#"><i class="bi bi-house-door"></i> Home</a></li>
                            <li><i class="bi bi-chevron-double-right pe-2"></i> User profile</li>
                        </ul>
                    </div>
                </div>
            </div>


            <!--####################### About US Starts Here ###################-->
            <div class="container-fluid big-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 col-md-10 py-5 mx-auto">
                            <div class="login-card bg-white shadow-md p-5">
                                <h4 class="text-center mb-5">CHANGE PASS</h4>
                                <h3 style="color: red">${requestScope.ms}</h3>

                            <form action="changepass" method="post">

                                <input type="hidden" name="u" value="${sessionScope.acc.username}">

                                <div class="form-row row">

                                    <div class="col-md-4 pt-2">
                                        <label for="">Old pass</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text" required="" name="opass" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row row">

                                    <div class="col-md-4 pt-2">
                                        <label for="">New pass</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text" required="" name="newpass" class="form-control">
                                    </div>
                                </div>
                                 <div class="form-row row">

                                    <div class="col-md-4 pt-2">
                                        <label for="">Confirm new pass</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text" required="" name="confirmpass" class="form-control">
                                    </div>
                                </div>



                                <div class="col-md-8">
                                    <button type="submit" class="btn btn-danger">Confirm Edit</button>
                                </div>
                            </form>

                        </div>
                    </div>
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

<script>
  $(document).ready(function() {
    var pass = $("input[name='newpass']");
    var repass = $("input[name='confirmpass']");
    var error = $("<p class='text-danger'>Password must be at least 8 characters long and contain at least one uppercase letter</p>");
    var match = $("<p class='text-danger'>Password does not match</p>");
    
    pass.after(error);
    error.hide();
    repass.after(match);
    match.hide();
    
    pass.on("keyup", function() {
      if (pass.val().length < 8 || !/[A-Z]/.test(pass.val())) {
        error.show();
      } else {
        error.hide();
      }
    });
    
    repass.on("keyup", function() {
      if (repass.val() !== pass.val()) {
        match.show();
      } else {
        match.hide();
      }
    });
  });
</script>
</html>
