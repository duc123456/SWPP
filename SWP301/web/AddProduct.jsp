<%-- 
    Document   : EditProduct
    Created on : Feb 21, 2023, 4:01:42 PM
    Author     : nhant
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <title>Thêm sản phẩm</title>

         <link rel="shortcut icon" type="image/x-icon" href="assetsEM/img/logotivi.png">

        <link rel="stylesheet" href="assetsEM/css/bootstrap.min.css">

        <link rel="stylesheet" href="assetsEM/css/font-awesome.min.css">

        <link rel="stylesheet" href="assetsEM/css/feathericon.min.css">

        <link rel="stylesheet" href="assetsEM/plugins/morris/morris.css">

        <link rel="stylesheet" href="assetsEM/css/style.css">
    </head>
    <body>

        <div class="main-wrapper">

            <jsp:include page="MenuManagerProduct.jsp"></jsp:include>



            <div class="page-wrapper">
                <div class="content container-fluid">

                    <div class="page-header">
                        <div class="row">
                            <div class="col-sm-12">

                                <ul class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="listProduct">Home</a></li>
                                    <li class="breadcrumb-item active">Thêm sản phẩm</li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Thêm sản phẩm</h4>
                                </div>

                                <div class="card-body">
                                    <form action="addproduct" method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Tên</label>
                                            <div class="col-md-10">
                                                <input name="name" type="text" class="form-control" required="">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Ảnh</label>
                                                <div class="col-md-10">
                                                    <img id="preview" src="#" alt="" width="300" height="auto">
                                                    <input name="file" type="file" class="form-control" required="" onchange="previewImage(event)">
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Giá Nhập</label>
                                                <div class="col-md-10">
                                                    <input name="price" type="text" class="form-control" pattern="[1-9]\d*" required>
                                                </div>
                                            </div>  
                                            
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Giá Bán</label>
                                                <div class="col-md-10">
                                                    <input name="priceout" type="text" class="form-control" pattern="[1-9]\d*" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Màu Sắc</label>
                                                <div class="col-md-10">
                                                    <select name="color" class="form-control form-select">
                                                        <option  value="Ðen">Màu đen</option>
                                                        <option  value="Ðỏ">Màu đỏ</option>

                                                    </select>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Năm Bảo Hành</label>
                                                <div class="col-md-10">
                                                    <input name="insurance" type="text" class="form-control" pattern="[1-9]\d*" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Kích Thước</label>
                                                <div class="col-md-10">
                                                    <input name="size" type="text" class="form-control" pattern="[1-9]\d*" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Số Lượng</label>
                                                <div class="col-md-10">
                                                    <input name="quantity" type="text" class="form-control" pattern="[1-9]\d*" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Giảm Giá</label>
                                                <div class="col-md-10">
                                                    <input name="discount" type="text" class="form-control" pattern="^(0(\.\d+)?|1(\.0+)?)$" required>
                                                </div>
                                            </div>
                                            
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Loại Tivi</label>
                                                <div class="col-md-10">
                                                    <select name="tid" class="form-control form-select">
                                                        <option  value="1">Smart TV</option>
                                                        <option  value="2">LED</option>
                                                        <option  value="3">QLED</option>
                                                        <option  value="4">QLED</option>
                                                        <option  value="5">Android TV</option>
                                                        <option  value="6">Nano Cell</option>
                                                        <option  value="7">TV man hinh cong</option>
                                                        <option  value="8">Tivi Khung Tranh</option>
                                                        <option  value="9">QNED</option>

                                                    </select>
                                                </div>
                                            </div>


                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Hãng Tivi</label>
                                                <div class="col-md-10">
                                                    <select name="catid" class="form-control form-select">

                                                        <option  value="1">Samsung</option>
                                                        <option  value="2">Sharp</option>
                                                        <option  value="3">Casper</option>
                                                        <option  value="4">TCL</option>
                                                        <option  value="5">LG</option>
                                                        <option  value="6">Xiaomi</option>
                                                        <option  value="7">Sony</option>
                                                        <option  value="8">Coocaa</option>
                                                        <option  value="9">FFalcon</option>
                                                        <option  value="10">Coex</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Độ Phân Giải</label>
                                                <div class="col-md-10">
                                                    <div class="radio">
                                                        <label>
                                                            <input name="resolution" value="HD"  type="radio" checked=""> HD
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="resolution" value="4K" > 4K
                                                        </label>
                                                    </div>
                                                    <div class="radio">
                                                        <label>
                                                            <input type="radio" name="resolution" value="Full HD">  Full HD
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group row">
                                                <label class="col-form-label col-md-2">Mô Tả</label>
                                                <div class="col-md-10">
                                                    <textarea name="description" rows="5" cols="5" class="form-control" placeholder="Nhập thông tin mô tả sản phẩm"></textarea>
                                                </div>
                                            </div>
                                            <button class="btn btn-primary" type="submit">Xác Nhận</button>

                                        </div>
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <script>
                function previewImage(event) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        var output = document.getElementById('preview');
                        output.src = reader.result;
                    };
                    reader.readAsDataURL(event.target.files[0]);
                }
            </script>



            <script src="assetsEM/js/jquery-3.6.0.min.js"></script>

            <script src="assetsEM/js/bootstrap.bundle.min.js"></script>

            <script src="assetsEM/plugins/slimscroll/jquery.slimscroll.min.js"></script>

            <script src="assetsEM/js/script.js"></script>
    </body>
</html>