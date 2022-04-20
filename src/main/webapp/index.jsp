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
    <title>Index</title>
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
        function tiao(){
            setTimeout(function(){window.location.href="${pageContext.request.contextPath}/login.jsp"},1500);
        }
    </script>
    </body>
</c:if>
<c:if test="${sessionScope.get('user')!=null}">
    <div class="hero_area">
        <div class="bg-box">
            <img src="${pageContext.request.contextPath}/images/hero-bg.jpg" alt="">
        </div>
        <!-- header section strats -->
        <header class="header_section">
            <div class="container">
                <nav class="navbar navbar-expand-lg custom_nav-container ">
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/index">
            <span>
              Hello，${sessionScope.get("user").getUname()}
            </span>
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav  mx-auto ">
                            <li class="nav-item active">
                                <a class="nav-link" href="${pageContext.request.contextPath}/index">首页<span
                                        class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/menu">菜单</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/bill">订单</a>
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
                                    <!--用户-->
                            <a href="${pageContext.request.contextPath}/user" class="user_link">
                                <i class="fa fa-user" aria-hidden="true"></i>
                            </a>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <!-- end header section -->
        <!-- slider section -->
        <section class="slider_section ">
            <div id="customCarousel1" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-7 col-lg-6 ">
                                    <div class="detail-box">
                                        <h1>
                                            今 日 推 荐
                                        </h1>
                                        <p>
                                            这是关于一个今日推荐的文本文件，以下皆是废话Doloremque, itaque aperiam facilis rerum,
                                            commodi, temporibus sapiente ad mollitia laborum quam quisquam esse
                                            error
                                            unde.
                                            Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos
                                            nihil
                                            ducimus
                                            libero ipsam.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item ">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-7 col-lg-6 ">
                                    <div class="detail-box">
                                        <h1>
                                            今 日 限 定
                                        </h1>
                                        <p>
                                            这是关于一个今日限定的文本文件，以下皆是废话Doloremque, itaque aperiam facilis rerum,
                                            commodi, temporibus sapiente ad mollitia laborum quam quisquam esse
                                            error
                                            unde.
                                            Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos
                                            nihil
                                            ducimus
                                            libero ipsam.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container ">
                            <div class="row">
                                <div class="col-md-7 col-lg-6 ">
                                    <div class="detail-box">
                                        <h1>
                                            今 日 优 惠
                                        </h1>
                                        <p>
                                            这是关于一个今日优惠的文本文件，以下皆是废话Doloremque, itaque aperiam facilis rerum,
                                            commodi, temporibus sapiente ad mollitia laborum quam quisquam esse
                                            error
                                            unde.
                                            Tempora ex doloremque, labore, sunt repellat dolore, iste magni quos
                                            nihil
                                            ducimus
                                            libero ipsam.
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <ol class="carousel-indicators">
                        <li data-target="#customCarousel1" data-slide-to="0" class="active"></li>
                        <li data-target="#customCarousel1" data-slide-to="1"></li>
                        <li data-target="#customCarousel1" data-slide-to="2"></li>
                    </ol>
                </div>
            </div>

        </section>
        <!-- end slider section -->
    </div>

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
                            <a href="https://www.amap.com/">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>
                  在 你 心
                </span>
                            </a>
                            <a href="">
                                <i class="fa fa-phone" aria-hidden="true"></i>
                                <span>
                  TEL +86 15718027318
                </span>
                            </a>
                            <a href="https://qm.qq.com/cgi-bin/qm/qr?k=B8N4qOHkI04J76xUWpqpNjKzjc0zLA_h&noverify=0">
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
                    <p>
                        望 霸 霸 的 小 店
                    </p>
                </div>
            </div>
        </div>
    </footer>
</c:if>
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
<!---<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap">
</script>--->
<!-- End Google Map -->
</div>

</html>
