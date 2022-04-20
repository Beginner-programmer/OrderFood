<%--
  Created by IntelliJ IDEA.
  User: Wangbaba
  Date: 2021/10/18
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <!-- Basic -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <!-- Site Metas -->
    <meta name="keywords" content=""/>
    <meta name="description" content=""/>
    <meta name="author" content=""/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
    <title>Bill</title>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>

    <!--owl slider stylesheet -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/owl.carousel.min.css"/>
    <!-- nice select  -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/nice-select.min.css"/>
    <!-- font awesome style -->
    <link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet"/>

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet"/>
    <!-- responsive style -->
    <link href="${pageContext.request.contextPath}/css/responsive.css" rel="stylesheet"/>
</head>
<body class="sub_page">
<c:if test="${sessionScope.get('user')==null}">
<body onload="tiao()">
<center>
    <%for (int i = 0; i < 5; i++) {%>
    <div class="alert alert-danger">
        <strong>警告</strong>
    </div>
    <div class="alert alert-warning">
        <strong>请先完成登录操作</strong>
    </div>
    <%}%>
</center>
<script>
    function tiao() {
        setTimeout(function () {
            window.location.href = "${pageContext.request.contextPath}/login.jsp"
        }, 1500);
    }
</script>
</body>
</c:if>
<c:if test="${sessionScope.get('user')!=null}">
<body <c:if test="${sessionScope.get('paymsg')!=null}">onload="mess()"</c:if>>
<%--信息提示模态框--%>
<div class="modal fade" tabindex="-1" id="smmodal" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <c:if test="${sessionScope.get('paymsg')==1}">
                    <p style="color:#1c7430;font-size: 25px;margin:auto;text-align: center;">支付成功</p>
                </c:if>
                <c:if test="${sessionScope.get('paymsg')==2}">
                    <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">支付失败</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<div class="hero_area">
    <div class="bg-box">
        <img src="${pageContext.request.contextPath}/images/hero-bg.jpg" alt="">
    </div>
    <!-- header section strats -->
    <header class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg custom_nav-container ">
                <a class="navbar-brand" href="index.jsp">
    <span>
    BILL
    </span>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto ">
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/index">首页 </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/menu">菜单</a>
                        </li>

                        <li class="nav-item active">
                            <a class="nav-link" href="${pageContext.request.contextPath}/bill">订单 <span
                                    class="sr-only">(current)</span></a>
                        </li>
                        <c:if test="${sessionScope.get('user').getRid()==1}">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/backstage">后台</a>
                            </li>
                        </c:if>
                    </ul>
                    <div class="user_option">
                            <%-- 购物车--%>
                        <a href="${pageContext.request.contextPath}/shop" class="user_link">
                            <i class="fa fa-shopping-cart" data-toggle="modal" data-target="#staticBackdrop"></i>
                        </a>
                            <%-- 用户--%>
                        <a href="${pageContext.request.contextPath}/user" class="user_link">
                            <i class="fa fa-user" aria-hidden="true"></i>
                        </a>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <!-- end header section -->
</div>

<!-- about section -->

<section class="about_section layout_padding">
    <div class="container ">
        <div class="row">
            <div class="col-md-6 ">
                <div class="img-box">
                    <img src="images/about-img.png" alt="">
                </div>
            </div>
            <c:if test="${sessionScope.get('uor')==null}">
                <div class="col-md-6">
                    <center>
                        <h1><i class="fa fa-frown-o" style="font-size:36px"></i>您当前还没有下单哦!</h1>
                    </center>
                </div>
            </c:if>
            <c:if test="${sessionScope.get('uor')!=null}">
                <div class="col-md-6">
                    <table class="table table-dark" style="text-align: center">
                        <thead class="thead-dark">
                        <tr>
                            <th colspan="2"><h3>订单</h3></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>编号</td>
                            <td>${sessionScope.get('uor').getOrderid()}</td>
                        </tr>
                        <tr>
                            <td>下单时间</td>
                            <td>${sessionScope.get('uor').getOrdertime()}</td>
                        </tr>
                        <tr>
                            <td>下单人</td>
                            <td>${sessionScope.get('uor').getOrdername()}</td>
                        </tr>
                        <tr>
                            <td>价格</td>
                            <td>￥${sessionScope.get('uor').getOrderprice()}</td>
                        </tr>
                        <tr>
                            <td>支付状态</td>
                            <td>
                                <c:if test="${sessionScope.get('uor').getPaystate()==1}">未支付</c:if>
                                <c:if test="${sessionScope.get('uor').getPaystate()==2}">已支付</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>订单状态</td>
                            <td>
                                <c:if test="${sessionScope.get('uor').getPrderstate()==1}">未完成</c:if>
                                <c:if test="${sessionScope.get('uor').getPrderstate()==2}">已完成</c:if>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <%int state = 2;%>
                    <div>
                        <a href="${pageContext.request.contextPath}/pay?paystate=<%=state%>&prderstate=<%=state%>&orderid=${sessionScope.get('uor').getOrderid()}"
                           type="button" class="btn btn-outline-info"
                           style="margin-left: 89%;;color: #108294;">支付</a></div>
                </div>
            </c:if>
        </div>
        <div style="margin-top: 7%;">
            <c:if test="${sessionScope.get('uorder')==null}"></c:if>
            <c:if test="${sessionScope.get('uorder')!=null}">
                <center>
                        <%-- 历史订单--%>
                    <table class="table table-dark" style="word-break:break-all;">
                        <thead>
                        <tr>
                            <td colspan="7"><h3 style="text-align: center"><i class="fa fa-paste"
                                                                              style="font-size:36px"></i>历史订单</h3>
                            </td>
                        </tr>
                        </thead>
                        <thead style="text-align: center;">
                        <tr>
                            <td>订单编号</td>
                            <td>下单时间</td>
                            <td>下单人</td>
                            <td>价格</td>
                            <td>支付状态</td>
                            <td>支付时间</td>
                            <td>订单状态</td>
                        </tr>
                        </thead>
                        <tbody style="text-align: center">
                        <c:forEach var="uorder" items="${sessionScope.get('uorder')}">
                            <tr>
                                <td>${uorder.getOrderid()}</td>
                                <td>${uorder.getOrdertime()}</td>
                                <td>${uorder.getOrdername()}</td>
                                <td>${uorder.getOrderprice()}</td>
                                <td>
                                    <c:if test="${uorder.getPaystate()==1}">未支付</c:if>
                                    <c:if test="${uorder.getPaystate()==2}">已支付</c:if>
                                </td>
                                <td>${uorder.getPaytime()}</td>
                                <td>
                                    <c:if test="${uorder.getPrderstate()==1}">未完成</c:if>
                                    <c:if test="${uorder.getPrderstate()==2}">已完成</c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </center>
            </c:if>
        </div>
    </div>
</section>

<!-- end about section -->

<!-- footer section -->
<footer class="footer_section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 footer-col">
                <div class="footer_contact">
                    <h4>
                        餐 厅 地 址
                    </h4>
                    <div class="contact_link_box">
                        <a href="">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <span>
                  在 你 心
                </span>
                        </a>
                        <a href="">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <span>
                  Call +86 15718027318
                </span>
                        </a>
                        <a href="">
                            <i class="fa fa-envelope" aria-hidden="true"></i>
                            <span>
                  2581009220@qq.com
                </span>
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-4 footer-col">
                <div class="footer_detail">
                    <a href="" class="footer-logo">
                        望 仔 餐 厅
                    </a>
                    <p>
                        追溯到遥远的从前，我们就听说过「民以食为天」。
                        再到现在，「舌尖上的中国」家喻户晓。
                        我们寄托在美食上的不仅仅是味蕾的享受，有时候更多的反而是味道带来的记忆。
                        望仔餐厅欢迎您！
                    </p>
                </div>
            </div>
            <div class="col-md-4 footer-col">
                <h4>
                    开 店 时 间
                </h4>
                <p>
                    每 日 营 业
                </p>
                <p>
                    10:00 Am -10:00 Pm
                </p>
            </div>
        </div>
    </div>
</footer>
<!-- footer section -->

<!-- jQery -->
<script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
<!-- popper js -->
<script src="${pageContext.request.contextPath}/js/popper.min.js">
</script>
<!-- bootstrap js -->
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<!-- owl slider -->
<script src="${pageContext.request.contextPath}/js/owl.carousel.min.js">
</script>
<!-- isotope js -->
<script src="${pageContext.request.contextPath}/js/isotope.pkgd.min.js"></script>
<!-- nice select -->
<script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
<!-- custom js -->
<script src="${pageContext.request.contextPath}/js/custom.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
</script>
<script>
    function mess() {
        $("#smmodal").modal('show');
    }
</script>
<!-- End Google Map -->
</body>
</c:if>
</html>
