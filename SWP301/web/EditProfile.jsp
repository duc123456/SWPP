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
        <title> Edit Profile  |</title>
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
                                <h4 class="text-center mb-5">EDIT PROFILE</h4>
                                <h3 style="color: red">${requestScope.ms}</h3>

                            <form action="changeprofile" method="post">
                                
                                    <input type="hidden" name="id" value="${sessionScope.acc.uId}">
                                    
                                <div class="form-row row">
                                    
                                    <div class="col-md-4 pt-2">
                                        <label for="">First Name</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text"  name="fname" value="${sessionScope.acc.fName}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <label for="">Last Name</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text"  name="lname" value="${sessionScope.acc.lName}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <label for="">Address</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text"  name="address" value="${sessionScope.acc.address}" class="form-control">
                                    </div>
                                </div>
                             
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <label for="">Date of bird</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="datetime"  name="dob" value="${sessionScope.acc.dob}" class="form-control">
                                    </div>
                                </div>
                               
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <label for="">Phone number</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text"  name="phone"value="${sessionScope.acc.phone}" class="form-control">
                                    </div>
                                </div>
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <label for="">Email</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <input type="text"  name="email" value="${sessionScope.acc.email}" class="form-control">
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

</html>