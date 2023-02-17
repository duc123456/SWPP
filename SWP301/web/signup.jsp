<%-- 
    Document   : signup
    Created on : Jan 12, 2023, 10:10:16 PM
    Author     : nhant
--%>
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
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        
    </head>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>
        
     <!--  ************************* Page Title Starts Here ************************** -->
     <div class="page-nav no-margin row">
            <div class="container">
                <div class="row">
                    <h2 class="text-start">Login Page</h2>
                    <ul>
                        <li> <a href="#"><i class="bi bi-house-door"></i> Home</a></li>
                        <li><i class="bi bi-chevron-double-right pe-2"></i> User Login</li>
                    </ul>
                </div>
            </div>
        </div>
        
        
    <!--####################### About US Starts Here ###################-->
    <div class="container-fluid big-padding">
        <div class="container">
            <form action="register">
            <div class="row">
                <div class="col-xl-6 col-lg-7 col-md-10 py-5 mx-auto">
                    <div class="login-card bg-white shadow-md p-5">
                        <h1 style="color: red;size: 12px">${requestScope.ms}</h1>
                        <h4 class="text-center mb-5">Enter your detail to Signup</h4>
                         <div class="form-row row">
                            
                          
                             <div class="col-md-4 pt-2">
                                <label for="">Your Name</label>
                                <span  class="fw-bolder float-end" >:</span>
                            </div>
                             <div class="col-md-8">
                                <input  name="lname" type="text" placeholder="Enter Last Name" class="form-control">
                            </div>
                        </div>
                        <div class="form-row row">
                            <div class="col-md-4 pt-2">
                                <label for="">Username</label>
                                <span class="fw-bolder float-end">:</span>
                            </div>
                            <div class="col-md-8">
                                <input name="username" type="text" placeholder="Enter Username" class="form-control">
                            </div>
                        </div>
                         
                        
                        
                        <div class="form-row row">
                            <div class="col-md-4 pt-2">
                                <label for="">Mobile number</label>
                                <span class="fw-bolder float-end">:</span>
                            </div>
                            <div class="col-md-8">
                                <input name="phone" type="text" placeholder="Enter Mobile Number" class="form-control">
                            </div>
                        </div>
                        
                        
                         
                        
                         <div class="form-row row">
                            <div class="col-md-4 pt-2">
                                <label for="">Password</label>
                                <span class="fw-bolder float-end">:</span>
                            </div>
                            <div class="col-md-8">
                                <input name="pass" type="text" placeholder="Enter Password" class="form-control">
                            </div>
                        </div>
                         <div class="form-row row">
                            <div class="col-md-4 pt-2">
                                <label for="">Confirm Password</label>
                                <span class="fw-bolder float-end">:</span>
                            </div>
                            <div class="col-md-8">
                                <input name="repass" type="text" placeholder="Enter Password" class="form-control">
                            </div>
                        </div>
                        <div class="form-row row">
                            <div class="col-md-4 pt-2">
                              
                            </div>
                            <div class="col-md-8">
                               <button class="btn btn-danger regis-btn">Register</button>
                              <a href=""><span class="float-end pt-2">forget Password ?</span></a> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                </form>
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
    

<script>
  $(document).ready(function() {
    var pass = $("input[name='pass']");
    var repass = $("input[name='repass']");
    var icon = $("<i class='fa'></i>");
    
    repass.after(icon);
    
    repass.on("keyup", function() {
      if (repass.val() === pass.val()) {
        icon.removeClass().addClass("fa fa-check text-success");
      } else {
        icon.removeClass().addClass("fa fa-times text-danger");
      }
    });
  });
</script>
<script>
  $(document).ready(function() {
    var pass = $("input[name='pass']");
    var repass = $("input[name='repass']");
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

<script>
  $(document).ready(function() {
    var phone = $("input[name='phone']");
    var error = $("<p class='text-danger'>Please enter a valid mobile number</p>");
    
    phone.after(error);
    error.hide();
    
    phone.on("keyup", function() {
      if (!/^\d{10}$/.test(phone.val())) {
        error.show();
      } else {
        error.hide();
      }
    });
  });
</script>
<script>
    $(document).ready(function(){
$('regis-btn').click(function(e){
var password = $('input[name="pass"]').val();
var repassword = $('input[name="repass"]').val();

if(password.length < 8 || !/[A-Z]/.test(password)){
alert('Password must be at least 8 characters long and contain at least one uppercase letter.');
e.preventDefault();
} else if(password !== repassword){
alert('Password and Confirm Password must match.');
e.preventDefault();
}
}
});
});
</script>







</html>