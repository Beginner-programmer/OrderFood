<%--
  Created by IntelliJ IDEA.
  User: Wangbaba
  Date: 2021/10/18
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
    <title>User</title>

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
<body
        <c:if test="${sessionScope.get('upde')!=null}">onload="mess()"</c:if> class="sub_page">
<!--???????????????????????????-->
<div class="modal fade" tabindex="-1" id="smmodal" role="dialog" aria-labelledby="mySmallModalLabel">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <c:if test="${sessionScope.get('upde')==1}">
                    <p style="color:#1c7430;font-size: 25px;margin:auto;text-align: center;">????????????</p>
                </c:if>
                <c:if test="${sessionScope.get('upde')==2}">
                    <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">????????????</p>
                </c:if>
                <c:if test="${sessionScope.get('upde')==3}">
                    <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">????????????</p>
                </c:if>
            </div>
        </div>
    </div>
</div>
    <%--?????????????????????--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
     data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel"><i class="fa fa-low-vision" style="font-size:36px"></i>????????????
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/updatepwd" method="post" id="pwd">
                <div class="modal-body">
                        <%--  ??????id--%>
                    <input type="hidden" name="id" value="${sessionScope.get("user").getId()}">
                        <%--?????????--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">????????????</label>
                        <div class="col-sm-9">
                            <input type="text" name="pwd" class="form-control" title="5-12??????????????????"
                                   placeholder="?????????????????????" pattern="[a-zA-Z0-9]{5,12}">
                        </div>
                    </div>
                        <%--  ?????????--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">????????????</label>
                        <div class="col-sm-9">
                            <input type="text" name="newpwd" class="form-control" title="5-12??????????????????"
                                   placeholder="????????????????????????" pattern="[a-zA-Z0-9]{5,12}">
                        </div>
                    </div>
                    <div style="margin-left: 73%;">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
                        <button type="button" class="btn btn-primary" onclick="subpwd()">??????</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!--?????????????????????-->
<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel"><i class="fa fa-user-secret"
                                                                    style="font-size:36px"></i>??????????????????</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="${pageContext.request.contextPath}/updateuser" method="post" id="sub">
                <div class="modal-body">
                        <%--                        ??????id--%>
                    <input type="hidden" name="id" value="${sessionScope.get("user").getId()}">
                        <%--                        ????????????--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">???????????????</label>
                        <div class="col-sm-9">
                            <input type="text" name="telephone" class="form-control" title="?????????????????????????????????"
                                   placeholder="????????????????????????" pattern="[1][3,4,5,7,8][0-9]{9}">
                        </div>
                    </div>
                        <%--                        ??????--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">?????????</label>
                        <div class="col-sm-9">
                            <input type="text" name="name" class="form-control" placeholder="?????????????????????"
                                   pattern="^[\u4e00-\u9fa5]{1,4}$|^[\dA-Za-z]{1,10}$">
                        </div>
                    </div>
                        <%--                        ??????--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">?????????</label>
                        <div class="col-sm-9" style="margin-top: 1%;">
                            <label class="radio-inline">
                                <input type="radio" name="sex" value="???"> ??????
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" value="???"> ??????
                            </label>
                        </div>
                    </div>
                        <%--                        ??????--%>
                    <div class="form-group row">
                        <label class="col-sm-3 col-form-label">?????????</label>
                        <div class="col-sm-9">
                            <input type="text" name="address" class="form-control" placeholder="?????????????????????"
                                   pattern="^[\u4e00-\u9fa5]{1,15}$">
                        </div>
                    </div>
                </div>
                <div style="margin-left: 73%;">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">??????</button>
                    <button type="button" class="btn btn-primary" onclick="sub()">??????</button>
                </div>
            </form>
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
              USER
            </span>
                </a>

                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                        aria-expanded="false" aria-label="Toggle navigation">
                    <span class=""> </span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav  mx-auto ">
                        <li class="nav-item ">
                            <a class="nav-link" href="${pageContext.request.contextPath}/index">?????? </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/menu">??????</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="${pageContext.request.contextPath}/bill">?????? </a>
                        </li>
                        <c:if test="${sessionScope.get('user').getRid()==1}">
                            <li class="nav-item">
                                <a class="nav-link" href="${pageContext.request.contextPath}/backstage">??????</a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- end header section -->
</div>

<!-- about section -->

<section class="about_section layout_padding">
    <div class="container">
        <div class="row">
                <%--                ????????????--%>
            <div class="col-md-6 ">
                <center>
                    <table class="table table-dark">
                        <thead>
                        <tr>
                            <td colspan="2"><h3 style="text-align: center;"><i class="fa fa-drivers-license-o"
                                                                               style="font-size:36px"></i>????????????</h3>
                            </td>
                        </tr>
                        </thead>
                        <tbody style="text-align: center;">
                        <tr>
                            <td>?????????</td>
                            <td>${sessionScope.get("findu").getUname()}</td>
                        </tr>
                        <tr>

                            <td>????????????</td>
                            <td>${sessionScope.get("findu").getTelephone()}</td>
                        </tr>
                        <tr>
                            <td>??????</td>
                            <td>
                                <c:if test="${sessionScope.get('findu').getName()!=null}">${sessionScope.get('findu').getName()}</c:if>
                                <c:if test="${sessionScope.get('findu').getName()==null}"><i class="fa fa-linux"
                                                                                             style="font-size:24px"></i>?????????????????????????????????</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>??????</td>
                            <td>
                                <c:if test="${sessionScope.get('findu').getSex()!=null}">${sessionScope.get('findu').getSex()}</c:if>
                                <c:if test="${sessionScope.get('findu').getSex()==null}"><i class="fa fa-linux"
                                                                                            style="font-size:24px"></i>?????????????????????????????????</c:if>
                            </td>
                        </tr>
                        <tr>
                            <td>??????</td>
                            <td>
                                <c:if test="${sessionScope.get('findu').getAddress()!=null}">${sessionScope.get('findu').getAddress()}</c:if>
                                <c:if test="${sessionScope.get('findu').getAddress()==null}"><i class="fa fa-linux"
                                                                                                style="font-size:24px"></i>?????????????????????????????????</c:if>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </center>
                <div style="margin-left: 65%;">
                    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#exampleModal">
                        ????????????
                    </button>
                    <button data-toggle="modal" data-target="#staticBackdrop" type="button" class="btn btn-dark">
                        ????????????
                    </button>
                </div>
            </div>
            <div class="col-md-6">
                <img src="${pageContext.request.contextPath}/images/aaa.jpg" style=" border-radius: 8px;">
            </div>
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

    function sub() {
        $("#sub").submit();
    }

    function subpwd() {
        $("#pwd").submit();
    }

</script>
<!-- End Google Map -->
</c:if>
</body>
</html>
