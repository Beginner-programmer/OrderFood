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

    <title>Menu</title>

    <!-- bootstrap core css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>

    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css"/>
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
    <link href="${pageContext.request.contextPath}/css/menu.css" rel="stylesheet"/>
</head>
<c:if test="${sessionScope.get('user')==null}">
    <body onload="tiao()">
    <center>
        <%for (int i = 0; i < 5; i++) {%>
        <div class="alert alert-danger">
            <strong>??????</strong>
        </div>
        <div class="alert alert-warning">
            <strong>????????????????????????</strong>
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
    <body class="sub_page" onload="shopcar()">
    <!--????????????????????????-->
    <!--???????????????????????????-->
    <c:if test="${sessionScope.get('mess')==1}">
        <div class="modal fade" tabindex="-1" id="smmodal" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <p style="color: green;    font-size: 26px;font-family: cursive; font-weight: bolder;margin:auto;text-align: center;">
                            ???????????????????????????</p>
                        <p style="color: green;font-size: 14px; font-weight: bolder;margin:auto;text-align: center;">
                            ????????????????????????????????????</p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <!--?????????????????????-->
    <c:if test="${sessionScope.get('mess')==2}">
        <div class="modal fade" tabindex="-1" id="smmodal" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <p style="color: red;    font-size: 26px;font-family: cursive; font-weight: bolder;margin:auto;text-align: center;">
                            ????????????????????????</p>
                        <p style="color: red;font-size: 14px; font-weight: bolder;margin:auto;text-align: center;">
                            ?????????????????????????????????????????????????????????</p>
                    </div>
                </div>
            </div>
        </div>
    </c:if>

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
              ORDERFOOD
            </span>
                    </a>

                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class=""> </span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav  mx-auto ">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/index">?????? </a>
                            </li>
                            <li class="nav-item active">
                                <a class="nav-link" href="${pageContext.request.contextPath}/menu">??????<span
                                        class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/bill">??????</a>
                            </li>
                            <c:if test="${sessionScope.get('user').getRid()==1}">
                                <li class="nav-item">
                                    <a class="nav-link" href="${pageContext.request.contextPath}/backstage">??????</a>
                                </li>
                            </c:if>
                        </ul>
                        <div class="user_option">
                                <%-- ??????--%>
                            <form action="${pageContext.request.contextPath}/menu" method="post" style="margin-top: 18px;">
                                <input type="text" placeholder="??????????????????????????????..." name="search"
                                       style="width: 83%;outline-style: none ;font-size: small;border-radius: 10px;">
                                <button class="user_link" style="border: none;background-color: transparent;outline: none;  ">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>
                                <%-- ?????????--%>
                            <a href="${pageContext.request.contextPath}/shop" class="user_link">
                                <i class="fa fa-shopping-cart" data-toggle="modal" data-target="#staticBackdrop"></i>
                            </a>
                                <%-- ??????--%>
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

    <!-- food section -->

    <section class="food_section layout_padding">
        <div class="container">
            <div class="heading_container heading_center">
                <h2>
                    ??? ??? ??? ???
                </h2>
            </div>

            <ul class="filters_menu">
                    <%--           ??????????????????--%>
                <li data-filter="*"
                    <c:if test="${sessionScope.get('actid')==0||sessionScope.get('actid')==null}">class="active"</c:if>>
                    <a
                            <c:if test="${sessionScope.get('actid')==0||sessionScope.get('actid')==null}">style="color: #ffffff" </c:if>
                            style="color: black;text-decoration: none"
                            href="${pageContext.request.contextPath}/menu?typeid=0">
                        ??????
                    </a>
                </li>
                    <%--                ??????????????????--%>
                <c:forEach var="foodf" items="${sessionScope.get('foodtype')}">
                    <li
                            <c:if test="${foodf.getId()==sessionScope.get('actid')}">class="active"</c:if>
                            data-filter="${foodf.getTyname()}">
                        <a
                                <c:if test="${foodf.getId()==sessionScope.get('actid')}">style="color: #ffffff" </c:if>
                                style="text-decoration: none;color:black"
                                href="${pageContext.request.contextPath}/menu?typeid=${foodf.getId()}">
                                ${foodf.getTyname()}
                        </a>
                    </li>
                </c:forEach>
            </ul>

                <%--            ??????????????????--%>
            <div class="filters-content">
                <div class="row grid">
                    <c:forEach var="food" items="${sessionScope.get('food')}">
                        <div class="col-sm-6 col-lg-4 all pizza">
                            <div class="box">
                                <div>
                                    <div class="img-box">
                                        <img src="${pageContext.request.contextPath}/${food.getPicture()}"
                                             alt="??????????????????">
                                    </div>
                                    <div class="detail-box">
                                        <h5>
                                                ${food.getFoodname()}
                                        </h5>
                                        <p>
                                                ${food.getFoodinf()}
                                        </p>
                                        <div class="options">
                                            <h6>
                                                ???${food.getPrice()}
                                            </h6>
                                            <c:if test="${food.getState()==2}">
                                                <a href="${pageContext.request.contextPath}/addshop?uname=${sessionScope.get("user").getUname()}&foodname=${food.getFoodname()}&foodnum=1&price=${food.getPrice()}"
                                                   title="??????????????????" style="color: black">
                                                    <i class="fa fa-cart-plus" style="font-size:24px"></i>
                                                </a>
                                            </c:if>
                                            <c:if test="${food.getState()==1}">
                                                <span style="font-size: x-large;font-family: cursive;">?????????</span>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </section>
    <!-- end food section -->

    <!-- footer section -->
    <footer class="footer_section">
        <div class="container">
            <div class="row">
                <div class="col-md-4 footer-col">
                    <div class="footer_contact">
                        <h4>
                            ??? ??? ??? ???
                        </h4>
                        <div class="contact_link_box">
                            <a href="">
                                <i class="fa fa-map-marker" aria-hidden="true"></i>
                                <span>
                  ??? ??? ???
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
                            ??? ??? ??? ???
                        </a>
                        <p>
                            ?????????????????????????????????????????????????????????????????????
                            ??????????????????????????????????????????????????????
                            ????????????????????????????????????????????????????????????????????????????????????????????????????????????
                            ????????????????????????
                        </p>
                    </div>
                </div>
                <div class="col-md-4 footer-col">
                    <h4>
                        ??? ??? ??? ???
                    </h4>
                    <p>
                        ??? ??? ??? ???
                    </p>
                    <p>
                        10:00 Am -10:00 Pm
                    </p>
                </div>
            </div>
        </div>
    </footer>
    <script>
        function shopcar() {
            $("#smmodal").modal('show');
        }
    </script>
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
    <!-- End Google Map -->
    </body>
</c:if>
</html>
