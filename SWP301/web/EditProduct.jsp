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
        <title>Quản lý sản phẩm</title>

        <link rel="shortcut icon" type="image/x-icon" href="assetsEM/img/favicon.png">

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


                        <div class="row">
                            <div class="col-sm-12">
                                <div class="card">
                                    <form action="editproduct" method = "post">
                                    <c:set var="details" value="${requestScope.details}"/>
                                    <div class="card-header">
                                        <h4 class="card-title">Sửa Sản Phẩm</h4>
                                    </div>

                                    <div class="card-body">
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">ID</label>
                                            <div class="col-md-10">
                                                <input type="text" name="pid" value="${details.pId}" class="form-control" readonly="">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Tên</label>
                                            <div class="col-md-10">
                                                <input type="text" name="pname" value="${details.name}" class="form-control">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Ảnh</label>
                                            <div class="col-md-10">
                                                <img id="image-preview" src="Image/${details.imageDf}"  alt="" width="300" height="auto">
                                                <br>
                                                <input id="image-input" type="file" name="image" class="form-control">
                                                
                                                <input id="image-input" type="hidden" name="image" value="${details.imageDf}" class="form-control">
                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giá Nhập</label>
                                            <div class="col-md-10">
                                                <input type="text" name="price" value="${details.priceIn}" class="form-control" pattern="[1-9]\d*" required>
                                                <p class="text-danger" id="price-error"></p>         
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giá Bán</label>
                                            <div class="col-md-10">
                                                <input type="text" name="priceout" value="${details.priceOut}" class="form-control"  pattern="[1-9]\d*" required>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Màu sắc</label>
                                            <div class="col-md-10">

                                                <select name="color" class="form-control form-select">
                                                    <option name="color" value="${details.color}">${details.color}</option>    
                                                    <option  value="Ðen">Màu đen</option>
                                                    <option  value="Ðỏ">Màu đỏ</option>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Bảo hành</label>
                                            <div class="col-md-10">
                                                <input type="text" name="insurance" value="${details.insurance}" class="form-control"  pattern="[1-9]\d*">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Kích thước</label>
                                            <div class="col-md-10">
                                                <input type="text" name="size" value="${details.size}" class="form-control"  pattern="[1-9]\d*"> 
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Số lượng</label>
                                            <div class="col-md-10">
                                                <input type="number" name="quantity" value="${details.quantity}" class="form-control" min="0" step="1"  pattern="[1-9]\d*" required>

                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Giảm giá</label>
                                            <div class="col-md-10">
                                                <input type="text" name="discount" value="${details.discount}" class="form-control"  pattern="^(0(\.\d+)?|1(\.0+)?)$" onblur="validateDiscount()">
                                                <div id="discount-error" style="color: red;"></div>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Loai Tivi</label>
                                            <div class="col-md-10">
                                                <select  name="tid" class="form-control form-select">
                                                    <option value="${details.type.tId}" checked>${details.type.tName}</option>
                                                    <c:forEach items="${typec}" var="ty">

                                                        <option  value="${ty.tId}">${ty.tName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Hãng Tivi</label>
                                            <div class="col-md-10">
                                                <select  name="catid" class="form-control form-select">
                                                    <option value="${details.cat.cid}" checked>${details.cat.cName}</option>
                                                    <c:forEach items="${listCC}" var="o">
                                                        <option  value="${o.cid}">${o.cName}</option>
                                                    </c:forEach>

                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Độ phân giải</label>
                                            <div class="col-md-10">
                                                <div class="radio">
                                                    <label>
                                                        <input name="resolution" value="HD"  type="radio" checked> HD
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="resolution" value="4K" > 4K
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="resolution" value="Full HD" >Full HD
                                                    </label>
                                                </div>

                                            </div>
                                        </div>


                                        <div class="form-group row">
                                            <label class="col-form-label col-md-2">Mô tả</label>
                                            <div class="col-md-10">
                                                <textarea rows="5" cols="5" value=""  name="description"  class="form-control">${details.description}</textarea>
                                            </div>
                                        </div>
                                        <button class="btn btn-primary" type="submit">Xác nhận</button>
                                    </div>

                                </form>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>

        <script>
            // Lắng nghe sự kiện khi người dùng chọn file
            document.getElementById('image-input').addEventListener('change', function () {
                // Tạo đối tượng FileReader để đọc tệp ảnh được chọn
                var reader = new FileReader();

                // Lắng nghe sự kiện khi FileReader đã đọc xong tệp ảnh
                reader.addEventListener('load', function () {
                    // Đặt ảnh xem trước với dữ liệu được đọc từ FileReader
                    document.getElementById('image-preview').src = reader.result;
                });

                // Đọc tệp ảnh được chọn
                reader.readAsDataURL(this.files[0]);
            });
        </script>

        <script>
            function validateDiscount() {
                var discountInput = document.getElementsByName("discount")[0];
                var discountValue = parseFloat(discountInput.value);
                var discountError = document.getElementById("discount-error");
                if (discountValue < 0 || discountValue > 1 || isNaN(discountValue)) {
                    discountError.innerHTML = "Giá trị giảm giá không hợp lệ. Vui lòng nhập giá trị từ 0 đến 1.";
                } else {
                    discountError.innerHTML = "";
                }
            }
        </script>

        <script>
            var priceInput = document.getElementsByName("price")[0];
            var priceError = document.getElementById("price-error");

            priceInput.addEventListener("input", function () {
                if (!priceInput.checkValidity()) {
                    priceError.textContent = "Giá nhập phải là số và lớn hơn 0";
                } else {
                    priceError.textContent = "";
                }
            });
        </script>

        <script>
            function validateForm() {
                var price = document.getElementsByName("priceout")[0].value;
                if (!/^[1-9]\d*$/.test(price)) {
                    alert("Price must be a positive integer!");
                    return false;
                }
                return true;
            }
        </script>


        <script>
            function validateForm() {
                var price = document.getElementsByName("quantity")[0].value;
                if (!/^[1-9]\d*$/.test(price)) {
                    alert("Quantity must be a positive integer!");
                    return false;
                }
                return true;
            }
        </script>
        <script>
            function validateForm() {
                var price = document.getElementsByName("size")[0].value;
                if (!/^[1-9]\d*$/.test(price)) {
                    alert("size must be a positive integer!");
                    return false;
                }
                return true;
            }
        </script>



        <script src="assetsEM/js/jquery-3.6.0.min.js"></script>

        <script src="assetsEM/js/bootstrap.bundle.min.js"></script>

        <script src="assetsEM/plugins/slimscroll/jquery.slimscroll.min.js"></script>

        <script src="assetsEM/js/script.js"></script>
    </body>
</html>