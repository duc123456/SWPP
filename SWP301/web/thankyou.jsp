<%-- 
    Document   : thankyou
    Created on : Feb 28, 2023, 9:11:22 PM
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
        <title> Thank you</title>
        <link rel="shortcut icon" href="assets/images/fav.png" type="image/x-icon">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
        <link rel="shortcut icon" href="assets/images/fav.jpg">
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css" />
        <style>
.thankyou-wrapper{
  width:100%;
  height:auto;
  margin:auto;
  background:#ffffff; 
  padding:10px 0px 50px;
}
.thankyou-wrapper h1{
  font:100px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#333333;
  padding:0px 10px 10px;
}
.thankyou-wrapper p{
  font:26px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#333333;
  padding:5px 10px 10px;
}
.thankyou-wrapper a{
  font:26px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#ffffff;
  display:block;
  text-decoration:none;
  width:250px;
  background:#E47425;
  margin:10px auto 0px;
  padding:15px 20px 15px;
  border-bottom:5px solid #F96700;
}
.thankyou-wrapper a:hover{
  font:26px Arial, Helvetica, sans-serif;
  text-align:center;
  color:#ffffff;
  display:block;
  text-decoration:none;
  width:250px;
  background:#F96700;
  margin:10px auto 0px;
  padding:15px 20px 15px;
  border-bottom:5px solid #F96700;
}
</style>
    </head>
    
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>
        
        <section class="login-main-wrapper">
      <div class="main-container">
          <div class="login-process">
              <div class="login-main-container">
                  <div class="thankyou-wrapper">
                      <h1><img src="http://montco.happeningmag.com/wp-content/uploads/2014/11/thankyou.png" alt="thanks" /></h1>
                        <p>Cảm ơn bạn đã đặt hàng, bạn có thể theo dõi đơn hàng trong phần thông tin</p>
                        <a style="background-color: #dc3545; border-bottom: 0px" href="listproduct">Quay lại trang chủ</a>
                       
                        <div class="clr"></div>
                    </div>
                    <div class="clr"></div>
                </div>
            </div>
            <div class="clr"></div>
        </div>
    </section>
        <jsp:include page="footer.jsp"></jsp:include>
       
        

</html>
