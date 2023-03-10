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
                                        <c:set value="${i+o.totalPrice}" var="i"></c:set>
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
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Marketing</h5>
                        </div>
                        <div class="card-body pt-0">
                            <h4 class="h2 lh-1 mb-2">+15,870.98 USD</h4>

                            <p class="mb-3 mb-md-4">Total Income</p>

                            <div class="d-flex align-items-center">
                                <div>
                                    <strong class="d-block mb-3">Conversion Rate</strong>

                                    <div class="d-flex align-items-center text-muted mb-2">
                                        <span class="indicator indicator-lg indicator-primary rounded-circle mr-2"></span>
                                        <small>AdWords</small>
                                    </div>

                                    <div class="d-flex align-items-center text-muted">
                                        <span class="indicator indicator-lg bg-semi-lighter rounded-circle mr-2"></span>
                                        <small>Facebook</small>
                                    </div>
                                </div>

                                <div class="js-donut-chart position-relative d-flex ml-auto" style="width: 120px; height: 120px;"
                                     data-series='[
                               {"meta":"AdWords - ","value":78},
                               {"meta":"Facebook - ","value":22}
                             ]'
                                     data-border-width="8"
                                     data-start-angle="0"
                                     data-fill-colors='["#8069f2","#eeeef1"]'
                                     data-is-show-tooltips="true"
                                     data-tooltip-currency="%"
                                     data-is-tooltip-currency-reverse="true"
                                     data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle chart-tooltip--centered chart-tooltip--black small text-white text-nowrap px-2 py-1"></div>
                            </div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-primary rounded-circle mr-3">
                            <i class="gd-bar-chart icon-text d-inline-block text-primary"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1">75%</h4>
                            <h6 class="mb-0">Conversion Rate</h6>
                        </div>
                        <i class="gd-arrow-up icon-text d-flex text-success ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-secondary rounded-circle mr-3">
                            <i class="gd-wallet icon-text d-inline-block text-secondary"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1">$18,000.00</h4>
                            <h6 class="mb-0">Total Sales</h6>
                        </div>
                        <i class="gd-arrow-down icon-text d-flex text-danger ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-xl-4">
                    <!-- Widget -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div class="icon icon-lg bg-soft-warning rounded-circle mr-3">
                            <i class="gd-money icon-text d-inline-block text-warning"></i>
                        </div>
                        <div>
                            <h4 class="lh-1 mb-1">$10,000.00</h4>
                            <h6 class="mb-0">Net Revenue</h6>
                        </div>
                        <i class="gd-arrow-up icon-text d-flex text-success ml-auto"></i>
                    </div>
                    <!-- End Widget -->
                </div>

            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Card -->
                    <div class="card mb-3 mb-md-4">
                        <div class="card-header border-bottom p-0">
                            <ul id="wallets" class="nav nav-v2 nav-primary nav-justified d-block d-xl-flex w-100" role="tablist">
                                <li class="nav-item border-bottom border-xl-bottom-0">
                                    <a class="nav-link d-flex align-items-center py-2 px-3 p-xl-4 active" href="#bitcoin" role="tab" aria-selected="true"
                                       data-toggle="tab">
                                        <span>New York</span>
                                        <small class="text-muted ml-auto">$12,012.96</small>
                                    </a>
                                </li>
                                <li class="nav-item border-bottom border-xl-bottom-0 border-xl-left">
                                    <a class="nav-link d-flex align-items-center py-2 px-3 p-xl-4" href="#bitcoinCash" role="tab" aria-selected="false"
                                       data-toggle="tab">
                                        <span>London</span>
                                        <small class="text-muted ml-auto">$8,038.00</small>
                                    </a>
                                </li>
                                <li class="nav-item border-bottom border-xl-bottom-0 border-xl-left">
                                    <a class="nav-link d-flex align-items-center py-2 px-3 p-xl-4" href="#etherium" role="tab" aria-selected="false"
                                       data-toggle="tab">
                                        <span>Tokyo</span>
                                        <small class="text-muted ml-auto">$19,234.23</small>
                                    </a>
                                </li>
                                <li class="nav-item border-xl-left">
                                    <a class="nav-link d-flex align-items-center py-2 px-3 p-xl-4" href="#litecoin" role="tab" aria-selected="false"
                                       data-toggle="tab">
                                        <span>Singapore</span>
                                        <small class="text-muted ml-auto">$23,844.44</small>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div id="walletsContent" class="card-body tab-content">
                            <div class="tab-pane fade show active" id="bitcoin" role="tabpanel">
                                <div class="row text-center">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            $12,012<sup class="h5">.96</sup>
                                        </div>
                                        <small class="text-muted">Total Sales</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>$1,059<sup class="h5">.83</sup>
                                        </div>
                                        <small class="text-muted">Today Sales (USD)</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>5.32<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">Net Profit (%)</small>
                                    </div>
                                </div>

                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
                           [
                             {"meta":"6/01/2019 9:00 PM","value":"1200"},
                             {"meta":"6/02/2019 9:00 PM","value":"800"},
                             {"meta":"6/03/2019 9:00 PM","value":"900"},
                             {"meta":"6/04/2019 9:00 PM","value":"1600"},
                             {"meta":"6/05/2019 9:00 PM","value":"1700"},
                             {"meta":"6/06/2019 9:00 PM","value":"1400"},
                             {"meta":"6/07/2019 9:00 PM","value":"1500"},
                             {"meta":"6/08/2019 9:00 PM","value":"1350"},
                             {"meta":"6/09/2019 9:00 PM","value":"1200"},
                             {"meta":"6/10/2019 9:00 PM","value":"1100"},
                             {"meta":"6/11/2019 9:00 PM","value":"700"},
                             {"meta":"6/12/2019 9:00 PM","value":"800"},
                             {"meta":"6/13/2019 9:00 PM","value":"2100"},
                             {"meta":"6/14/2019 9:00 PM","value":"1900"},
                             {"meta":"6/15/2019 9:00 PM","value":"1800"},
                             {"meta":"6/16/2019 9:00 PM","value":"2100"},
                             {"meta":"6/17/2019 9:00 PM","value":"1800"},
                             {"meta":"6/18/2019 9:00 PM","value":"1600"},
                             {"meta":"6/19/2019 9:00 PM","value":"1200"},
                             {"meta":"6/20/2019 9:00 PM","value":"1400"},
                             {"meta":"6/21/2019 9:00 PM","value":"1500"},
                             {"meta":"6/22/2019 9:00 PM","value":"1700"},
                             {"meta":"6/23/2019 9:00 PM","value":"1600"},
                             {"meta":"6/24/2019 9:00 PM","value":"1800"},
                             {"meta":"6/25/2019 9:00 PM","value":"1850"},
                             {"meta":"6/26/2019 9:00 PM","value":"1900"},
                             {"meta":"6/27/2019 9:00 PM","value":"1950"},
                             {"meta":"6/28/2019 9:00 PM","value":"2100"},
                             {"meta":"6/29/2019 9:00 PM","value":"2200"},
                             {"meta":"6/30/2019 9:00 PM","value":"2300"}
                           ]
                         ]'
                                     data-labels='["June 01","June 02","June 03","June 04","June 05","June 06","June 07","June 08","June 09","June 10","June 11","June 12","June 13","June 14","June 15","June 16","June 17","June 18","June 19","June 20","June 21","June 22","June 23","June 24","June 25","June 26","June 27","June 28","June 29","June 30"]'
                                     data-labels-qty="6"
                                     data-labels-start-from="1"
                                     data-prefix="$"
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="3000"
                                     data-low="500"
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
                                     data-tooltip-currency="USD "
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

                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
                           [
                             {"meta":"6/01/2019 9:00 PM","value":"900"},
                             {"meta":"6/02/2019 9:00 PM","value":"800"},
                             {"meta":"6/03/2019 9:00 PM","value":"1000"},
                             {"meta":"6/04/2019 9:00 PM","value":"1100"},
                             {"meta":"6/05/2019 9:00 PM","value":"1200"},
                             {"meta":"6/06/2019 9:00 PM","value":"1250"},
                             {"meta":"6/07/2019 9:00 PM","value":"1300"},
                             {"meta":"6/08/2019 9:00 PM","value":"1350"},
                             {"meta":"6/09/2019 9:00 PM","value":"1200"},
                             {"meta":"6/10/2019 9:00 PM","value":"1100"},
                             {"meta":"6/11/2019 9:00 PM","value":"1050"},
                             {"meta":"6/12/2019 9:00 PM","value":"1150"},
                             {"meta":"6/13/2019 9:00 PM","value":"1300"},
                             {"meta":"6/14/2019 9:00 PM","value":"1400"},
                             {"meta":"6/15/2019 9:00 PM","value":"1300"},
                             {"meta":"6/16/2019 9:00 PM","value":"1200"},
                             {"meta":"6/17/2019 9:00 PM","value":"1600"},
                             {"meta":"6/18/2019 9:00 PM","value":"1300"},
                             {"meta":"6/19/2019 9:00 PM","value":"1200"},
                             {"meta":"6/20/2019 9:00 PM","value":"1400"},
                             {"meta":"6/21/2019 9:00 PM","value":"1500"},
                             {"meta":"6/22/2019 9:00 PM","value":"1550"},
                             {"meta":"6/23/2019 9:00 PM","value":"1600"},
                             {"meta":"6/24/2019 9:00 PM","value":"1650"},
                             {"meta":"6/25/2019 9:00 PM","value":"1850"},
                             {"meta":"6/26/2019 9:00 PM","value":"1700"},
                             {"meta":"6/27/2019 9:00 PM","value":"1950"},
                             {"meta":"6/28/2019 9:00 PM","value":"1800"},
                             {"meta":"6/29/2019 9:00 PM","value":"1900"},
                             {"meta":"6/30/2019 9:00 PM","value":"1950"}
                           ]
                         ]'
                                     data-labels='["June 01","June 02","June 03","June 04","June 05","June 06","June 07","June 08","June 09","June 10","June 11","June 12","June 13","June 14","June 15","June 16","June 17","June 18","June 19","June 20","June 21","June 22","June 23","June 24","June 25","June 26","June 27","June 28","June 29","June 30"]'
                                     data-labels-qty="6"
                                     data-labels-start-from="1"
                                     data-prefix="$"
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="3000"
                                     data-low="500"
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
                                     data-tooltip-currency="USD "
                                     data-is-show-points="true"
                                     data-point-custom-class='chart__point--donut chart__point--has-line-helper chart__point--border-xxs border-primary rounded-circle'
                                     data-point-dimensions='{"width":8,"height":8}'></div>
                            </div>

                            <div class="tab-pane fade" id="etherium" role="tabpanel">
                                <div class="row text-center">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            $19,234<sup class="h5">.23</sup>
                                        </div>
                                        <small class="text-muted">Total Sales</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>$2,732<sup class="h5">.24</sup>
                                        </div>
                                        <small class="text-muted">Today Sales (USD)</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>15.78<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">Net Profit (%)</small>
                                    </div>
                                </div>

                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
                           [
                             {"meta":"6/01/2019 9:00 PM","value":"1400"},
                             {"meta":"6/02/2019 9:00 PM","value":"1500"},
                             {"meta":"6/03/2019 9:00 PM","value":"1600"},
                             {"meta":"6/04/2019 9:00 PM","value":"1650"},
                             {"meta":"6/05/2019 9:00 PM","value":"1550"},
                             {"meta":"6/06/2019 9:00 PM","value":"1400"},
                             {"meta":"6/07/2019 9:00 PM","value":"1450"},
                             {"meta":"6/08/2019 9:00 PM","value":"1650"},
                             {"meta":"6/09/2019 9:00 PM","value":"1700"},
                             {"meta":"6/10/2019 9:00 PM","value":"1750"},
                             {"meta":"6/11/2019 9:00 PM","value":"2300"},
                             {"meta":"6/12/2019 9:00 PM","value":"2350"},
                             {"meta":"6/13/2019 9:00 PM","value":"2400"},
                             {"meta":"6/14/2019 9:00 PM","value":"2450"},
                             {"meta":"6/15/2019 9:00 PM","value":"2250"},
                             {"meta":"6/16/2019 9:00 PM","value":"2200"},
                             {"meta":"6/17/2019 9:00 PM","value":"2100"},
                             {"meta":"6/18/2019 9:00 PM","value":"2150"},
                             {"meta":"6/19/2019 9:00 PM","value":"2250"},
                             {"meta":"6/20/2019 9:00 PM","value":"2300"},
                             {"meta":"6/21/2019 9:00 PM","value":"2350"},
                             {"meta":"6/22/2019 9:00 PM","value":"2400"},
                             {"meta":"6/23/2019 9:00 PM","value":"2450"},
                             {"meta":"6/24/2019 9:00 PM","value":"2350"},
                             {"meta":"6/25/2019 9:00 PM","value":"2500"},
                             {"meta":"6/26/2019 9:00 PM","value":"2550"},
                             {"meta":"6/27/2019 9:00 PM","value":"2700"},
                             {"meta":"6/28/2019 9:00 PM","value":"2900"},
                             {"meta":"6/29/2019 9:00 PM","value":"2750"},
                             {"meta":"6/30/2019 9:00 PM","value":"3500"}
                           ]
                         ]'
                                     data-labels='["June 01","June 02","June 03","June 04","June 05","June 06","June 07","June 08","June 09","June 10","June 11","June 12","June 13","June 14","June 15","June 16","June 17","June 18","June 19","June 20","June 21","June 22","June 23","June 24","June 25","June 26","June 27","June 28","June 29","June 30"]'
                                     data-labels-qty="6"
                                     data-labels-start-from="1"
                                     data-prefix="$"
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="4000"
                                     data-low="500"
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
                                     data-tooltip-currency="USD "
                                     data-is-show-points="true"
                                     data-point-custom-class='chart__point--donut chart__point--has-line-helper chart__point--border-xxs border-primary rounded-circle'
                                     data-point-dimensions='{"width":8,"height":8}'></div>
                            </div>

                            <div class="tab-pane fade" id="litecoin" role="tabpanel">
                                <div class="row text-center mb-4 mb-md-5">
                                    <div class="col-6 col-md-4 mb-3 mb-md-0">
                                        <div class="h3 mb-0">
                                            $23,844<sup class="h5">.44</sup>
                                        </div>
                                        <small class="text-muted">Total Sales</small>
                                    </div>

                                    <div class="col-6 col-md-4 mb-3 mb-md-0 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>$952<sup class="h5">.43</sup>
                                        </div>
                                        <small class="text-muted">Today Sales (USD)</small>
                                    </div>

                                    <div class="col-12 col-md-4 border-left">
                                        <div class="h3 mb-0">
                                            <span class="text-success">+</span>10.25<sup class="h5">%</sup>
                                        </div>
                                        <small class="text-muted">Net Profit (%)</small>
                                    </div>
                                </div>

                                <div class="js-area-chart chart chart--axis-x--nowrap chart--points-invisible position-relative mh-15_6 safari-overflow-hidden pt-4 pt-md-5 pb-1"
                                     data-series='[
                           [
                             {"meta":"6/01/2019 9:00 PM","value":"2100"},
                             {"meta":"6/02/2019 9:00 PM","value":"2200"},
                             {"meta":"6/03/2019 9:00 PM","value":"2300"},
                             {"meta":"6/04/2019 9:00 PM","value":"1900"},
                             {"meta":"6/05/2019 9:00 PM","value":"1850"},
                             {"meta":"6/06/2019 9:00 PM","value":"2150"},
                             {"meta":"6/07/2019 9:00 PM","value":"2200"},
                             {"meta":"6/08/2019 9:00 PM","value":"2250"},
                             {"meta":"6/09/2019 9:00 PM","value":"2800"},
                             {"meta":"6/10/2019 9:00 PM","value":"2900"},
                             {"meta":"6/11/2019 9:00 PM","value":"3000"},
                             {"meta":"6/12/2019 9:00 PM","value":"2500"},
                             {"meta":"6/13/2019 9:00 PM","value":"2550"},
                             {"meta":"6/14/2019 9:00 PM","value":"2600"},
                             {"meta":"6/15/2019 9:00 PM","value":"2700"},
                             {"meta":"6/16/2019 9:00 PM","value":"2800"},
                             {"meta":"6/17/2019 9:00 PM","value":"2950"},
                             {"meta":"6/18/2019 9:00 PM","value":"3200"},
                             {"meta":"6/19/2019 9:00 PM","value":"3100"},
                             {"meta":"6/20/2019 9:00 PM","value":"2700"},
                             {"meta":"6/21/2019 9:00 PM","value":"3300"},
                             {"meta":"6/22/2019 9:00 PM","value":"3350"},
                             {"meta":"6/23/2019 9:00 PM","value":"3400"},
                             {"meta":"6/24/2019 9:00 PM","value":"3450"},
                             {"meta":"6/25/2019 9:00 PM","value":"3200"},
                             {"meta":"6/26/2019 9:00 PM","value":"3350"},
                             {"meta":"6/27/2019 9:00 PM","value":"3450"},
                             {"meta":"6/28/2019 9:00 PM","value":"3600"},
                             {"meta":"6/29/2019 9:00 PM","value":"3650"},
                             {"meta":"6/30/2019 9:00 PM","value":"3700"}
                           ]
                         ]'
                                     data-labels='["June 01","June 02","June 03","June 04","June 05","June 06","June 07","June 08","June 09","June 10","June 11","June 12","June 13","June 14","June 15","June 16","June 17","June 18","June 19","June 20","June 21","June 22","June 23","June 24","June 25","June 26","June 27","June 28","June 29","June 30"]'
                                     data-labels-qty="6"
                                     data-labels-start-from="1"
                                     data-prefix="$"
                                     data-height="250"
                                     data-mobile-height="75"
                                     data-high="4000"
                                     data-low="1000"
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
                                     data-tooltip-currency="USD "
                                     data-is-show-points="true"
                                     data-point-custom-class='chart__point--donut chart__point--has-line-helper chart__point--border-xxs border-primary rounded-circle'
                                     data-point-dimensions='{"width":8,"height":8}'></div>
                            </div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Balance</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="border-bottom p-3 p-md-4 mt-3 pb-md-6">
                                <div class="js-bar-chart position-relative" style="height: 160px;"
                                     data-series="[
                               [160,160,160,160,160,160,160,160,160,160,160,160],
                               [92,97,124,137,97,124,46,97,90,97,111,90],
                               [69,47,69,53,45,94,34,31,68,73,83,68]
                             ]"
                                     data-height="160"
                                     data-high="160"
                                     data-low="0"
                                     data-distance="20"
                                     data-stroke-width="5"
                                     data-stroke-color='["#e0f6fc","#a0eee7","#8069f2"]'
                                     data-is-stack-bars="true"
                                     data-is-show-axis-x="false"
                                     data-is-show-axis-y="false"
                                     data-is-show-label-axis-x="false"
                                     data-is-show-label-axis-y="false"
                                     data-is-stroke-rounded="true"
                                     data-is-show-tooltips="true"
                                     data-postfix="%"
                                     data-tooltip-custom-class="chart-tooltip chart-tooltip--black small text-white px-2 py-1"></div>
                            </div>

                            <div class="border-bottom media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Expenses</span>
                                    <span class="ml-auto">$393.15</span>
                                </div>

                                <i class="gd-arrow-down icon-text icon-text-xs d-flex text-danger ml-auto"></i>
                            </div>

                            <div class="media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Profit</span>
                                    <span class="ml-auto">$7,040.87</span>
                                </div>

                                <i class="gd-arrow-up icon-text icon-text-xs d-flex text-success ml-auto"></i>
                            </div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header d-flex">
                            <h5 class="h6 font-weight-semi-bold text-uppercase mb-0">Available Balance</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="border-bottom text-center p-3 p-md-4 pb-md-6">
                                <div class="js-donut-chart position-relative d-flex mx-auto mb-3 mb-md-4" style="width: 130px; height: 130px;"
                                     data-series="[65,35]"
                                     data-border-width="12"
                                     data-slice-margin="2"
                                     data-start-angle="0"
                                     data-fill-colors='["#8069f2","#0cdcB9"]'
                                     data-is-show-tooltips="true"
                                     data-tooltip-currency="%"
                                     data-is-tooltip-currency-reverse="true"
                                     data-tooltip-custom-class="chart-tooltip chart-tooltip--triangle-right chart-tooltip--black small text-white px-2 py-1 mt-5 ml-n5"></div>

                                <div class="small text-muted">Total Balance ≈ 32,754.56 USD</div>
                            </div>

                            <div class="border-bottom media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Cash</span>
                                    <span class="ml-auto">$13,380.25</span>
                                </div>

                                <i class="gd-arrow-up icon-text icon-text-xs d-flex text-success ml-auto"></i>
                            </div>

                            <div class="media align-items-center p-3">
                                <div class="media-body d-flex align-items-center mr-2">
                                    <span>Bank Account</span>
                                    <span class="ml-auto">$19,432.80</span>
                                </div>

                                <i class="gd-arrow-up icon-text icon-text-xs d-flex text-success ml-auto"></i>
                            </div>
                        </div>
                    </div>
                    <!-- End Card -->
                </div>
                <div class="col-lg-6 col-xl-4 mb-3 mb-lg-4">
                    <!-- Card -->
                    <div class="card h-100">
                        <div class="card-header">
                            <h5 class="h6 text-uppercase font-weight-semi-bold mb-0">Recent Transactions</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">TOK</span>

                                        <span class="mr-1">$3,320.98</span>
                                        <i class="gd-arrow-left text-success mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        3h ago
                                    </div>
                                </div>

                                Balance update
                            </div>
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">NYC</span>

                                        <span class="mr-1">$4,320.98</span>
                                        <i class="gd-arrow-left text-success mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        5h ago
                                    </div>
                                </div>

                                Balance update
                            </div>
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">NYC</span>

                                        <span class="mr-1">$3,320.98</span>
                                        <i class="gd-arrow-right text-danger mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        7h ago
                                    </div>
                                </div>
                                Marketing Expenses
                            </div>
                            <div class="border-top p-3 px-md-4 mx-0">
                                <div class="row justify-content-between small mb-2">
                                    <div class="col">
                                        <span class="text-primary mr-3">NYC</span>

                                        <span class="mr-1">$1,320.98</span>
                                        <i class="gd-arrow-left text-success mr-3"></i>
                                    </div>

                                    <div class="col-auto text-muted">
                                        12h ago
                                    </div>
                                </div>

                                Balance update
                            </div>

                        </div>
                    </div>
                    <!-- End Card -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div>
                            <h5 class="lh-1 mb-0">Orers</h5>
                            <small>125 (+5)</small>
                        </div>
                        <div class="js-area-chart chart--points-invisible chart--labels-hidden py-1 ml-auto"
                             data-series='[
                           [
                            {"value":"25"},
                            {"value":"35"},
                            {"value":"10"},
                            {"value":"40"},
                            {"value":"20"}
                           ]
                         ]'
                             data-width="100"
                             data-height="40"
                             data-high="40"
                             data-is-line-smooth='["simple"]'
                             data-line-width='["1px"]'
                             data-line-colors='["#0cdcB9"]'
                             data-fill-opacity=".3"
                             data-is-fill-colors-gradient="true"
                             data-fill-colors='[
                           ["rgba(28,240,221,.6)","rgba(255,255,255,.6)"]
                         ]'
                             data-is-show-tooltips="true"
                             data-is-tooltips-append-to-body="true"
                             data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle d-flex align-items-center small text-white p-2 mt-5 ml-5"
                             data-tooltip-badge-markup='<span class="indicator indicator-sm bg-secondary rounded-circle mr-1"></span>'
                             data-is-show-points="true"
                             data-point-custom-class='chart__point--hidden'
                             data-point-dimensions='{"width":8,"height":8}'></div>
                    </div>
                    <!-- End Card -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div>
                            <h5 class="lh-1 mb-0">Visitors</h5>
                            <small>1,450 (+325)</small>
                        </div>
                        <div class="js-area-chart chart--points-invisible chart--labels-hidden py-2 ml-auto"
                             data-series='[
                           [
                             {"value":"40"},
                             {"value":"40"},
                             {"value":"40"},
                             {"value":"25"},
                             {"value":"30"},
                             {"value":"35"},
                             {"value":"50"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"30"},
                             {"value":"30"},
                             {"value":"40"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"55"},
                             {"value":"50"},
                             {"value":"45"},
                             {"value":"60"},
                             {"value":"70"},
                             {"value":"80"}
                           ]
                         ]'
                             data-width="100"
                             data-height="40"
                             data-high="100"
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
                             data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle d-flex align-items-center small text-white p-2 mt-5 ml-5"
                             data-tooltip-badge-markup='<span class="indicator indicator-sm bg-primary rounded-circle mr-1"></span>'
                             data-is-show-points="true"
                             data-point-custom-class='chart__point--hidden'
                             data-point-dimensions='{"width":8,"height":8}'></div>
                    </div>
                    <!-- End Card -->
                </div>

                <div class="col-md-6 col-xl-4 mb-3 mb-md-4">
                    <!-- Card -->
                    <div class="card flex-row align-items-center p-3 p-md-4">
                        <div>
                            <h5 class="lh-1 mb-0">Customers</h5>
                            <small>320 (+20)</small>
                        </div>
                        <div class="js-area-chart chart--points-invisible chart--labels-hidden py-2 ml-auto"
                             data-series='[
                           [
                             {"value":"35"},
                             {"value":"20"},
                             {"value":"10"},
                             {"value":"20"},
                             {"value":"20"},
                             {"value":"0"},
                             {"value":"10"},
                             {"value":"0"},
                             {"value":"10"},
                             {"value":"10"},
                             {"value":"15"},
                             {"value":"35"},
                             {"value":"15"},
                             {"value":"20"},
                             {"value":"35"},
                             {"value":"35"},
                             {"value":"40"},
                             {"value":"42"}
                           ]
                         ]'
                             data-is-hide-area="true"
                             data-width="123"
                             data-height="42"
                             data-high="42"
                             data-is-line-smooth='[false]'
                             data-line-width='["2px"]'
                             data-line-colors='["#8069f2"]'
                             data-is-show-tooltips="true"
                             data-is-tooltips-append-to-body="true"
                             data-tooltip-custom-class="chart-tooltip chart-tooltip--none-triangle d-flex align-items-center small text-white p-2 mt-5 ml-5"
                             data-tooltip-badge-markup='<span class="indicator indicator-sm bg-primary rounded-circle mr-1"></span>'
                             data-is-show-points="true"
                             data-point-custom-class='chart__point--hidden'
                             data-point-dimensions='{"width":8,"height":8}'></div>
                    </div>
                    <!-- End Card -->
                </div>

            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card mb-3 mb-md-4">
                        <div class="card-header">
                            <h5 class="font-weight-semi-bold mb-0">Recent Orders</h5>
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
                                            <div>${o.getUser().getlName()}</div>
                                            
                                        </td>
                                        <td class="py-3">${o.date.substring(0,10)}</td>
                                        <td class="py-3">${o.phone}</td>
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
