<%--
  Created by IntelliJ IDEA.
  User: Wangbaba
  Date: 2021/10/18
  Time: 16:50
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
    <title>Backstage</title>
    <meta name="save" content="history">

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
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layui.css">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css">
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
        function tiao() {
            setTimeout(function () {
                window.location.href = "${pageContext.request.contextPath}/login.jsp"
            }, 1500);
        }
    </script>
    </body>
</c:if>
<c:if test="${sessionScope.get('user')!=null}">
<c:if test="${sessionScope.get('user').getRid()==1}">
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo layui-hide-xs layui-bg-black">
            Hello,管理员${sessionScope.get("user").getUname()}</div>
        <!-- 头部区域（可配合layui 已有的水平导航） -->
        <ul class="layui-nav layui-layout-left" style="behavior:url(#default#savehistory)">
            <!-- 移动端显示 -->
            <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-header-event="menuLeft">
                <i class="layui-icon layui-icon-spread-left"></i>
            </li>

            <li class="layui-nav-item layui-hide-xs"><a href="${pageContext.request.contextPath}/index">首 页</a>
            </li>
            <li class="layui-nav-item layui-hide-xs"><a href="${pageContext.request.contextPath}/menu">菜 单</a>
            </li>
            <li class="layui-nav-item layui-hide-xs"><a href="${pageContext.request.contextPath}/bill">订 单</a>
            </li>
            <li class="layui-nav-item layui-hide-xs"><a href="${pageContext.request.contextPath}/user">个 人</a>
            </li>
        </ul>

    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;" onclick="backmanage()">后台操作</a>
                </li>
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:;" onclick="usermanage()">查看用户</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" onclick="menumanage()">菜单管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;" onclick="billmanage()">查看订单</a>
                </li>
            </ul>
        </div>
    </div>
    <div class="layui-body">
        <iframe id="inif" src="${pageContext.request.contextPath}/back.jsp"
                style="height: 100%;width: 100%;frameborder:0;"></iframe>
    </div>

    <div class="layui-footer">

    </div>
</div>

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
<!-- 引入 layui.js -->
<script src="${pageContext.request.contextPath}/js/layui.js"></script>
<script src="./layui/layui.js"></script>
<script>
    //JS
    layui.use(['element', 'layer', 'util'], function () {
        var element = layui.element
            , layer = layui.layer
            , util = layui.util
            , $ = layui.$;

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function (othis) {
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            , menuRight: function () {
                layer.open({
                    type: 1
                    , content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    , area: ['260px', '100%']
                    , offset: 'rt' //右上角
                    , anim: 5
                    , shadeClose: true
                });
            }
        });

    });

    function backmanage(){
        $("#inif").attr("src", "${pageContext.request.contextPath}/back.jsp");
    }
    function usermanage() {
        $("#inif").attr("src", "${pageContext.request.contextPath}/backUser.jsp");
    }

    function menumanage() {
        $("#inif").attr("src", "${pageContext.request.contextPath}/backFood.jsp");
    }

    function billmanage() {
        $("#inif").attr("src", "${pageContext.request.contextPath}/backBill.jsp");
    }
</script>
</c:if>
</c:if>
</body>
</html>
