<%-- 
    Document   : signup
    Created on : Jan 12, 2023, 10:10:16 PM
    Author     : nhant
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </head>
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>


            <!--####################### About US Starts Here ###################-->
            <div class="container-fluid big-padding">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-6 col-lg-7 col-md-10 py-5 mx-auto">
                            <div class="login-card bg-white shadow-md p-5">
                                <h4 class="text-center mb-5">PROFILE</h4>
                                <div class="form-row row">
                                    <div class="col-md-4 pt-2">
                                        <label for="">First Name</label>
                                        <span class="fw-bolder float-end">:</span>
                                    </div>
                                    <div class="col-md-8">
                                        <a class="">${sessionScope.acc.fName}</a> 
                                </div>
                            </div>
                            <div class="form-row row">
                                <div class="col-md-4 pt-2">
                                    <label for="">Last Name</label>
                                    <span class="fw-bolder float-end">:</span>
                                </div>
                                <div class="col-md-8">
                                    <a class="">${sessionScope.acc.lName}</a> 
                                </div>
                            </div>
                            <div class="form-row row">
                                <div class="col-md-4 pt-2">
                                    <label for="">Address</label>
                                    <span class="fw-bolder float-end">:</span>
                                </div>
                                <div class="col-md-8">
                                    ${sessionScope.acc.address}
                                </div>
                            </div>               

                            <div class="form-row row">
                                <div class="col-md-4 pt-2">
                                    <label for="">Date of bird</label>
                                    <span class="fw-bolder float-end">:</span>
                                </div>
                                <div class="col-md-8">
                                    ${sessionScope.acc.dob}
                                </div>
                            </div>
                            <div class="form-row row">
                                <div class="col-md-4 pt-2">
                                    <label for="">Gender</label>
                                    <span class="fw-bolder float-end">:</span>
                                </div>
                                <div class="col-md-8">

                                    <c:if test="${sessionScope.acc.gender == true}">
                                        Nam
                                    </c:if>
                                    <c:if test="${sessionScope.acc.gender == false}">
                                        Nu
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-row row">
                                <div class="col-md-4 pt-2">
                                    <label for="">Phone number</label>
                                    <span class="fw-bolder float-end">:</span>
                                </div>
                                <div class="col-md-8">
                                    ${sessionScope.acc.phone}
                                </div>
                            </div>
                            <div class="form-row row">
                                <div class="col-md-4 pt-2">
                                    <label for="">Email</label>
                                    <span class="fw-bolder float-end">:</span>
                                </div>
                                <div class="col-md-8">
                                    ${sessionScope.acc.email}
                                </div>
                            </div>
                            <div class="form-row row">
                                <div class="col-md-4 pt-2">

                                </div>
                                <div class="col-md-8">
                                    <a href="EditProfile.jsp"><span class="float-end pt-2">Change Profile</span></a><br/>
                                    <a href="ChangePassword.jsp"><span class="float-end pt-2">Change Password</span></a> 
                                </div>
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