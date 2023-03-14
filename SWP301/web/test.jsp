<%-- 
    Document   : test
    Created on : Mar 13, 2023, 10:27:23 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trang theo dõi đơn hàng</title>
        <style>
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
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
    
        <h1>Chi tiết đơn hàng #123456789</h1>
        <table>
            <thead>
                <tr>
                    <th>Tên sản phẩm</th>
                    <th>Số lượng</th>
                    <th>Giá cả</th>
                    <th>Tổng cộng</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Áo phông nam cao cấp</td>
                    <td>2</td>
                    <td>200.000đ</td>
                    <td>400.000đ</td>
                </tr>
                <tr>
                    <td>Quần jean nam xanh đen</td>
                    <td>1</td>
                    <td>450.000đ</td>
                    <td>450.000đ</td>
                </tr>
                <tr>
                    <td>Giày thể thao nam trắng</td>
                    <td>1</td>
                    <td>800.000đ</td>
                    <td>800.000đ</td>
                </tr>
            </tbody>
        </table>
        <p>Tổng cộng: 1.650.000đ</p>
        <p>Ngày đặt hàng: 10/03/2023</p>
        <p>Trạng thái đơn hàng: Đã giao hàng</p>
    </body>
</html>
