<%-- 
    Document   : Dash
    Created on : Feb 28, 2023, 1:16:29 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Title -->
    <title>Dashboard | Graindashboard UI Kit</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <!-- Favicon -->
    <link rel="shortcut icon" href="public/img/favicon.ico">


    <!-- DEMO CHARTS -->
    <link rel="stylesheet" href="public/demo/chartist.css">
    <link rel="stylesheet" href="public/demo/chartist-plugin-tooltip.css">

    <!-- Template -->
    <link rel="stylesheet" href="public/graindashboard/css/graindashboard.css">
    <style>
        .custom-dropdown {
  position: relative;
  display: inline-block;
  vertical-align: middle;
  margin: 10px; /* demo only */
}

.custom-dropdown select {
  background-color: #377dff;
  color: #fff;
  font-size: inherit;
  padding: .5em;
  padding-right: 2.5em; 
  border: 0;
  margin: 0;
  border-radius: 3px;
  text-indent: 0.01px;
  text-overflow: '';
  -webkit-appearance: button; /* hide default arrow in chrome OSX */
}

.custom-dropdown::before,
.custom-dropdown::after {
  content: "";
  position: absolute;
  pointer-events: none;
}

.custom-dropdown::after { /*  Custom dropdown arrow */
  content: "\25BC";
  height: 1em;
  font-size: .625em;
  line-height: 1;
  right: 1.2em;
  top: 50%;
  margin-top: -.5em;
}

.custom-dropdown::before { /*  Custom dropdown arrow cover */
  width: 2em;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 0 3px 3px 0;
}

.custom-dropdown select[disabled] {
  color: rgba(0,0,0,.3);
}

.custom-dropdown select[disabled]::after {
  color: rgba(0,0,0,.1);
}

.custom-dropdown::before {
  background-color: rgba(0,0,0,.15);
}

.custom-dropdown::after {
  color: rgba(0,0,0,.4);
}
    </style>

</head>

<body class="has-sidebar has-fixed-sidebar-and-header">
<!-- Header -->
<jsp:include page="menudash.jsp"></jsp:include>
<!-- End Header -->

<main class="main">
    <!-- Sidebar Nav -->
   <jsp:include page="sidebarDash.jsp"></jsp:include>
   <jsp:useBean class="dal.DAO" id="d"></jsp:useBean>
    <!-- End Sidebar Nav -->

    <div class="content">
        <div class="py-4 px-3 px-md-4">

            <div class="mb-3 mb-md-4 d-flex justify-content-between">
                <div class="h3 mb-0">Dashboard</div>
            </div>
            <form action="dash">
                <input type="date" name="from" value="${requestScope.from}"/>
                <input type="date" name="to"value="${requestScope.to}" />
                <input type="submit" value="Tìm">
            </form>

            <div class="row">
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Tổng tiền hàng nhập</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="media align-items-center px-3 px-md-4 mb-3 mb-md-4">
                                <div class="media-body">
                                    <h4 class="h3 lh-1 mb-2"><fmt:formatNumber value="${requestScope.stock}" pattern="#,##0 'VND'" /></h4>
                                   <!--   <p class="small text-muted mb-0">
                                        +$5,213.38 <span class="text-success mx-1">+10.23%</span> This Month
                                    </p>comment --> 
                                </div>
                            </div>

                            <div class="js-area-chart chart--points-invisible chart--labels-hidden position-relative"
                                 data-series='[
                                 
                             [
                             <c:set value="${requestScope.PlList}" var="s"></c:set>
                                {"meta":"${s[0].product.name}","value":"${s[0].quantity}"},
                             <c:forEach begin="0" end="${requestScope.size}" var="i">
                                 {"meta":"${s[i].product.name}","value":"${s[i].quantity}"},
                                 
                                 <c:if test="${i == size }">
                                    {"meta":"${s[i].product.name}","value":"${s[i].quantity}"} 
                                 </c:if>
                             </c:forEach>
                               
                               
                             ]
                           ]'
                                 data-height="115"
                                 data-high="1000"
                                 data-chart-padding='{"top": 5}'
                                 data-is-hide-area="true"
                                 data-line-colors='["#8069f2"]'
                                 data-line-dasharrays='[0,0]'
                                 data-line-width='["2px","2px"]'
                                 data-is-line-smooth='[false]'
                                 data-fill-opacity="1"
                                 data-fill-colors='["#8069f2"]'
                                 data-stroke-dash-array-axis-y="4"
                                 data-is-show-tooltips="true"
                                 data-tooltip-custom-class="chart-tooltip chart-tooltip--sections-blocked chart-tooltip__meta--text-muted small text-white text-nowrap p-2"
                                 data-tooltip-currency="In Stock "
                                 data-is-show-points="true"
                                 data-point-custom-class='chart__point--donut chart__point--border-xs border-primary rounded-circle'
                                 data-point-dimensions='{"width":15,"height":15}'></div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Doanh thu bán hàng</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="media align-items-center px-3 px-md-4 mb-3 mb-md-4">
                                <div class="media-body">
                                    <c:set value="${0}" var="i"></c:set>
                                    <c:forEach items="${requestScope.order}" var="o">
                                        <c:set value="${i+o.getTotalPrice()}" var="i"></c:set>
                                    </c:forEach>
                                    <h4 class="h3 lh-1 mb-2"><fmt:formatNumber value="${i}" pattern="#,##0 'VND'" /></h4>
                                    <!--<p class="small text-muted mb-0">
                                        +$570.5 <span class="text-success mx-1">+2.31%</span> This Month
                                    </p> -->
                                </div>
                            </div>

                            <div class="js-area-chart chart--points-invisible chart--labels-hidden position-relative"
                                 data-series='[
                             [ 
                             
                               {"meta":"Orders","value":"1000000"},
                               {"meta":"Orders","value":"30000000"},
                               {"meta":"Orders","value":"50000000"}
                             ]
                           ]'
                                 data-height="115"
                                 data-high="80000000"
                                 data-is-line-smooth='[false]'
                                 data-line-width='["1px"]'
                                 data-line-colors='["#8069f2"]'
                                 data-fill-opacity=".3"
                                 data-is-fill-colors-gradient="true"
                                 data-fill-colors='[
                             ["rgba(128,105,242,.7)","rgba(255,255,255,.6)"]
                           ]'
                                 data-is-show-tooltips="true"
                                 data-is-tooltips-append-to-body="true"
                                 data-tooltip-custom-class="chart-tooltip chart-tooltip--sections-blocked chart-tooltip__meta--text-muted small text-white p-2"
                                 data-tooltip-currency="Qty "
                                 data-is-show-points="true"
                                 data-point-custom-class='chart__point--donut chart__point--border-xxs border-primary rounded-circle'
                                 data-point-dimensions='{"width":8,"height":8}'></div>

                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                      
                    
                     <div class="card h-100">
                        <div class="card-header">
                            <h5 class="h6 text-uppercase font-weight-semi-bold mb-0">Recent Transactions</h5>
                        </div>
                        <div class="card-body p-0">
                            <c:forEach items="${requestScope.listmost}" var="l">
                                <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">${l.getProduct().getName()}</span>

                                        <span class="mr-1">${l.getProduct().getPriceOut()*(l.getAmount())}</span>
                                        <i class="gd-arrow-left text-success mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        x${l.getAmount()}
                                    </div>
                                </div>

                                ${l.getProduct().getCat().getcName()}
                            </div>
                                
                            </c:forEach>
                            
                            
                            
                            

                        </div>
                    </div>
                    
                    <!-- End Card -->
                </div>
       

            </div>
                                    <div class="row">
                                    <div class="col-md-12">
                    <!-- Card -->
                    <div class="card mb-3 mb-md-4">
                        <div>
                                <form action="dash">
                                    <span class="custom-dropdown big" style="background-color: #377dff; margin: 0px">
                                        <select name="year" onchange="this.form.submit()" style="min-height: 30px">
                                            <option value="">Tất cả</option>
                                            <c:forEach begin="2020" end="${requestScope.yearnow}" var="i">
                                                <option ${(requestScope.year == i) ?'selected':''} value="${i}" >${i}</option>
                                            </c:forEach>
                                    </select></span>
                            </form>
                            </div>

                            
                        <div id="walletsContent" class="card-body tab-content">
                            <div class="tab-pane fade show active" id="bitcoin" role="tabpanel">
                                
                                
                                

                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
                           [
                           {"meta":"31/1","value":"${d.getAllOrderForchart(1,requestScope.year)}"},
                             {"meta":"28/2","value":"${d.getAllOrderForchart(2,requestScope.year)}"},
                             {"meta":"31/3","value":"${d.getAllOrderForchart(3,requestScope.year)}"},
                             {"meta":"30/4","value":"${d.getAllOrderForchart(4,requestScope.year)}"},
                             {"meta":"31/5","value":"${d.getAllOrderForchart(5,requestScope.year)}"},
                             {"meta":"30/6","value":"${d.getAllOrderForchart(6,requestScope.year)}"},
                             {"meta":"31/7","value":"${d.getAllOrderForchart(7,requestScope.year)}"},
                             {"meta":"31/8","value":"${d.getAllOrderForchart(8,requestScope.year)}"},
                             {"meta":"30/9","value":"${d.getAllOrderForchart(9,requestScope.year)}"},
                             {"meta":"31/10","value":"${d.getAllOrderForchart(10,requestScope.year)}"},
                             {"meta":"30/11","value":"${d.getAllOrderForchart(11,requestScope.year)}"},
                             {"meta":"31/12","value":"${d.getAllOrderForchart(12,requestScope.year)}"}    
                             
                            
                                 
                           ]
                         ]'
                                     data-labels='["January","February","March","April","May","June","July","August","September","October","November","December"]'
                                     data-labels-qty="12"
                                     data-labels-start-from="1"
                                     data-prefix=""
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="300000"
                                     data-low="0"
                                     data-offset-x="30"
                                     data-offset-y="60"
                                     data-is-line-smooth='[false]'
                                     data-line-width='["1px"]'
                                     data-line-colors='["#8069f2"]'
                                     data-fill-opacity="1"
                                     data-fill-colors='["#ecebfa"]'
                                     data-text-size-x="14px"
                                     data-text-color-x="#4a4e69"
                                     data-text-offset-top-x="10"
                                     data-text-align-axis-x="center"
                                     data-text-size-y="14px"
                                     data-text-color-y="#868e96"
                                     data-is-show-tooltips="true"
                                     data-is-tooltip-divided="true"
                                     data-tooltip-custom-class="chart-tooltip--divided chart-tooltip__value--bg-black chart-tooltip__meta--bg-primary small text-white"
                                     data-tooltip-currency="Triệu"
                                     data-is-show-points="true"
                                     data-point-custom-class='chart__point--donut chart__point--has-line-helper chart__point--border-xxs border-primary rounded-circle'
                                     data-point-dimensions='{"width":8,"height":8}'></div>
                            </div>

                            <div class="tab-pane fade" id="bitcoinCash" role="tabpanel">
                                <div class="row text-center">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            $8,038<sup class="h5">.00</sup>
                                        </div>
                                        <small class="text-muted">Total Sales</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>$105<sup class="h5">.84</sup>
                                        </div>
                                        <small class="text-muted">Today Sales (USD)</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-danger">-</span>2.38<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">Net Profit (%)</small>
                                    </div>
                                </div>

                               
                    <!-- End Card -->
                </div>
                             </div>
                             </div>
                             </div>
                             </div>
           

            

            <div class="row">
                <c:if test="${requestScope.from==null}" >
                    
                    <a href="export">Xuất excel</a>
                </c:if>
                <c:if test="${requestScope.from!=null}" >
                    
                    <a href="export?from=${requestScope.from}&&to=${requestScope.to}">Xuất excel từ ${requestScope.from} ngày đến ${requestScope.to} ngày</a>
                </c:if>
                <div class="col-12">
                    <div class="card mb-3 mb-md-4">
                        <div class="card-header">
                            <h5 class="font-weight-semi-bold mb-0">Order gần đây</h5>
                        </div>

                        <div class="card-body pt-0">
                            <div class="table-responsive-xl">
                                <table class="table text-nowrap mb-0">
                                    <thead>
                                    <tr>
                                        <th class="font-weight-semi-bold border-top-0 py-2">#</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Khách hàng</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Ngày đặt hàng</th>
                                        
                                        <th class="font-weight-semi-bold border-top-0 py-2">Số điện thoại</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Khoản thu</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Tình trạng</th>
                                        <th class="font-weight-semi-bold border-top-0 py-2">Ngày cập nhật</th>
                                        
                                        
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${requestScope.orderList}" var="o">
                                        <tr>
                                        <td class="py-3">149531</td>
                                        <td class="py-3">
                                            <c:if test="${o.getUser()==null}">
                                            <div>${o.getGuest().getlName()} ${o.getGuest().getfName()}</div>
                                        </c:if>
                                            <c:if test="${o.getUser()!=null}">
                                                <div>${o.getUser().getlName()} ${o.getUser().getfName()}</div>
                                        </c:if>
                                            
                                            
                                        </td>
                                        <td class="py-3">${o.date.substring(0,10)}</td>
                                        <c:if test="${o.getUser()==null}">
                                            <td>${o.getGuest().getPhone()}</td>
                                        </c:if>
                                            <c:if test="${o.getUser()!=null}">
                                                <td>${o.getUser().getPhone()}</td>
                                        </c:if>
                                        
                                        <td class="py-3">${o.totalPrice}</td>
                                        <c:if test="${d.getODLogByOID(o.oId).statusId == 1}">
                                        <td class="py-3">
                                            <span class="badge badge-pill badge-secondary" alt="">Chờ xác nhận</span>
                                        </td>
                                        </c:if>
                                        <c:if test="${d.getODLogByOID(o.oId).statusId == 2}">
                                        <td class="py-3">
                                            <span class="badge badge-pill badge-primary">Ðã xác nhận</span>
                                        </td>
                                        </c:if>
                                        <c:if test="${d.getODLogByOID(o.oId).statusId == 3}">
                                        <td class="py-3">
                                            <span class="badge badge-pill badge-success" alt="">Đã nhận hàng</span>
                                        </td>
                                        </c:if>
                                        <c:if test="${d.getODLogByOID(o.oId).statusId == 4}">
                                        <td class="py-3">
                                            <span class="badge badge-pill badge-danger">Đã hủy</span>
                                        </td>
                                        </c:if>
                                        <td class="py-3">${d.getODLogByOID(o.oId).date}</td>
            
                                    </c:forEach>
                                    
                                    
                                
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>

        <!-- Footer -->
        <footer class="small p-3 px-md-4 mt-auto">
            <div class="row justify-content-between">
                <div class="col-lg text-center text-lg-left mb-3 mb-lg-0">
                    <ul class="list-dot list-inline mb-0">
                        <li class="list-dot-item list-dot-item-not list-inline-item mr-lg-2"><a class="link-dark" href="#">FAQ</a></li>
                        <li class="list-dot-item list-inline-item mr-lg-2"><a class="link-dark" href="#">Support</a></li>
                        <li class="list-dot-item list-inline-item mr-lg-2"><a class="link-dark" href="#">Contact us</a></li>
                    </ul>
                </div>

                <div class="col-lg text-center mb-3 mb-lg-0">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-twitter-alt"></i></a></li>
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-facebook"></i></a></li>
                        <li class="list-inline-item mx-2"><a class="link-muted" href="#"><i class="gd-github"></i></a></li>
                    </ul>
                </div>

                <div class="col-lg text-center text-lg-right">
                    &copy; 2019 Graindashboard. All Rights Reserved.
                </div>
            </div>
        </footer>
        <!-- End Footer -->
    </div>
</main>


<script src="public/graindashboard/js/graindashboard.js"></script>
<script src="public/graindashboard/js/graindashboard.vendor.js"></script>

<!-- DEMO CHARTS -->
<script src="public/demo/resizeSensor.js"></script>
<script src="public/demo/chartist.js"></script>
<script src="public/demo/chartist-plugin-tooltip.js"></script>
<script src="public/demo/gd.chartist-area.js"></script>
<script src="public/demo/gd.chartist-bar.js"></script>
<script src="public/demo/gd.chartist-donut.js"></script>
<script>
    $.GDCore.components.GDChartistArea.init('.js-area-chart');
    $.GDCore.components.GDChartistBar.init('.js-bar-chart');
    $.GDCore.components.GDChartistDonut.init('.js-donut-chart');
</script>
<script>
    const toggleBtn = document.getElementById('toggle-btn');
const myTable = document.getElementById('my-table');

toggleBtn.addEventListener('click', () => {
  if (myTable.style.display === 'none') {
    myTable.style.display = 'block';
  } else {
    myTable.style.display = 'none';
  }
});
</script>
</body>
</html>
