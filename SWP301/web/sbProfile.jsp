<%-- 
    Document   : sbProfile
    Created on : Mar 14, 2023, 3:16:53 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #current_page{
    border-left: solid 4px #dc3545;
    color: #dc3545;
}
        </style>
    </head>
    <body>
        <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>
        <div class="body_left">
                <!-- body left top (dashboard)-->
                <div class="body_left-dashboard">
                    <div class="body_left-dashboard_title">THÔNG TIN</div>
                    <a href="hisOrder.jsp" class="body_left-dashboard_child">
                        <div id="hover_icon">
                            
                            Đơn hàng
                        </div>
                        <span>${d.getAllOrderByUID(acc.uId).size()}</span>
                    </a>
                </div>
                <!-- body left bot (acc setting)-->
                <div class="body_left-setting">
                    <div class="body_left-dashboard_title">TÀI KHOẢN</div>
                    <a href="profilee.jsp" class="body_left-dashboard_child" id="current_page">
                        <div id="hover_icon">
                            
                            Trang cá nhân
                        </div>
                        <span>1</span>
                    </a>
       
                </div>
            </div>
    </body>
</html>
