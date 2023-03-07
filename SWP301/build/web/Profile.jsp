<%-- 
    Document   : signup
    Created on : Jan 12, 2023, 10:10:16 PM
    Author     : nhant
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

table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

th {
  background-color: #dc3545;
  color: white;
  font-weight: bold;
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
    <bod>
        <jsp:include page="menu.jsp"></jsp:include>
        <div class="page-content page-container" id="page-content">
            <div class="padding row">
                <div class="col-md-1"></div>
                <div class="col-md-10 container d-flex justify-content-center">
                    <div></div>
                    <div class="col-xl-12 col-md-12">
                        <div class="card user-card-full">
                            <div class="row m-l-0 m-r-0">
                                <div class="col-sm-4 bg-c-lite-green user-profile">
                                    <div class="card-block text-center text-white">
                                        <div class="m-b-25">
                                        <jsp:useBean id="d" class="dal.DAO"></jsp:useBean>  
                                        <img src="uploadDir/${d.getUserImage(sessionScope.acc.uId)}" class="img-radius" style="border-radius: 100%;max-height: 150px;min-height: 50px;max-width: 150px">
                                        </div>
                                        <h6 class="f-w-600"  style="font-size:30px; color:white">${sessionScope.acc.lName}</h6>
                                        <form action="changeavarta" method="post" enctype="multipart/form-data" class="row">
                                            <input type="file" name="file" class="col-md-12" />
                                                    <div class="row">
                                                <div class="col-md-4"></div>
                                                <div class="col-md-4"><button type="submit" id="myButton" class="btn btn-danger" style="background-color: white; color: #dc3545">Lưu</button></div>
                                                <div class="col-md-4"></div>

                                            </div>
                                            </form>
      
                                    </div>
                                        
                                        
                                </div>
                                <div class="col-sm-8">
                                    <div class="card-block">
                                        <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Thông tin</h6>
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Họ</p>
                                                <h1 class="text-muted f-w-400">${sessionScope.acc.fName}</h1    >
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Tên</p>
                                                <h1 class="text-muted f-w-400">${sessionScope.acc.lName}</h1>
                                            </div>

                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Email</p>
                                                <h1 class="text-muted f-w-400" style="font-size:20px">${sessionScope.acc.email}</h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Số điện thoại</p>
                                                <h1 class="text-muted f-w-400">  ${sessionScope.acc.phone}</h1>
                                            </div>
                                        </div>
                                        <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600"></h6>
                                        <div class="row">
                                           
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Địa chỉ</p>
                                                <h1 class="text-muted f-w-400">${sessionScope.acc.address}</h1>
                                            </div>
                                            <div class="col-sm-6">
                                                <p class="m-b-10 f-w-600">Ngày sinh</p>
                                                <h1 class="text-muted f-w-400">${sessionScope.acc.dob.substring(0,10)}</h1>
                                            </div>
                                            <a href="EditProfile.jsp"><span class="float-end pt-2">Thay đổi thông tin</span></a><br/>
                                            <a href="ChangePassword.jsp"><span class="float-end pt-2">Đổi mật khẩu</span></a> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                                          
            </div>
                                          
                                           
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
        const myButton = document.getElementById('myButton');
const myTable = document.getElementById('myTable');

myButton.addEventListener('click', () => {
  myTable.style.display = 'table';
});
    </script>
    

</html>