<%--
  Created by IntelliJ IDEA.
  User: Wangbaba
  Date: 2021/11/23
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.png" type="">
    <link rel="stylesheet" href="https://cdn.staticfile.org/font-awesome/4.7.0/css/font-awesome.css"/>
    <title>Shop</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.css"/>
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
    <body <c:if test="${sessionScope.get('addmsg')!=null}">onload="mess()"</c:if>>
        <%--信息提示模态框--%>
    <div class="modal fade" tabindex="-1" id="smmodal" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <c:if test="${sessionScope.get('addmsg')==1}">
                        <p style="color:#1c7430;font-size: 25px;margin:auto;text-align: center;">下单成功</p>
                    </c:if>
                    <c:if test="${sessionScope.get('addmsg')==2}">
                        <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">下单失败</p>
                    </c:if>
                    <c:if test="${sessionScope.get('addmsg')==3}">
                        <p style="color: #bd2130;font-size: 25px;margin:auto;text-align: center;">购物车为空</p>
                    </c:if>
                    <%session.removeAttribute("addmsg");%>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <nav class="navbar navbar-light bg-light">
            <a class="navbar-brand" href="#">
                <i class="fa fa-cart-arrow-down" style="font-size:48px;color:tomato"></i>
                <span style="color: tomato;font-size: larger;font-weight: bold;">欢迎进入购物车</span>
            </a>
        </nav>
        <center>
            <table class="table">
                <thead>
                <tr>
                    <td scope="col" style="font-family: fantasy;text-align: center;">#</td>
                    <td scope="col" style="text-align: center;"><i class="fa fa-cutlery"></i>&nbsp;美食</td>
                    <td scope="col" style="text-align: center;"><i class="fa fa-rmb"></i>&nbsp;点餐人</td>
                    <td scope="col" style="text-align: center;"><i class="fa fa-rmb"></i>&nbsp;单价</td>
                    <td scope="col" style="text-align: center;"><i class="fa fa-rmb"></i>&nbsp;价格</td>
                    <td scope="col" style="text-align: center;"><i class="fa fa-calculator"></i>&nbsp;数量</td>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="all" items="${sessionScope.get('Allshop')}" varStatus="xu">
                    <tr>
                        <th style="text-align: center;">${xu.index+1}</th>
                        <td style="text-align: center;">${all.getFoodname()}</td>
                        <td style="text-align: center;">${all.getUname()}</td>
                        <td style="text-align: center;">￥${all.getPrice()}</td>
                        <td style="text-align: center;">￥${all.getSumprice()}</td>
                        <td style="text-align: center;">
                            <form action="${pageContext.request.contextPath}/shop" method="post"
                                  id="inform${xu.index}"/>
                            <input type="hidden" name="foodname" value="${all.getFoodname()}">
                            <input type="hidden" name="price" value="${all.getPrice()}">
                            <div class="btn-group btn-group-toggle" data-toggle="buttons"
                                 style="-webkit-transform: scale(0.8);">
                                <label class="btn btn-secondary active" style="background-color: #545b62;"
                                       onclick="del('${xu.index}')">
                                    <input type="radio" name="options"> -
                                </label>
                                <input type="text" name="num" id="num${xu.index}" value="${all.getFoodnum()}"
                                       style="    width: 35px;text-align: center;background-color: darkgray"
                                       readonly>
                                <label class="btn btn-secondary" style="background-color: #545b62;"
                                       onclick="add('${xu.index}')">
                                    <input type="radio" name="options"> +
                                </label>
                            </div>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </center>
        <h1 style="font-family: fantasy;font-variant-numeric: oldstyle-nums;">￥${sessionScope.get("zj")}</h1>

        <div style="float:right;">
            <a href="${pageContext.request.contextPath}/menu" type="button" class="btn btn-outline-warning"
               style="color: #b18500;">离开</a>
            <a href="${pageContext.request.contextPath}/addorder" type="button" class="btn btn-outline-info"
               style="color: #108294;">下单</a>
        </div>
    </div>

    <script>
        //按钮减减
        function del(x) {
            var num = $("#num" + x).attr("value");
            if (num <= 0) {
                alert("已从购物车删除")
            } else {
                num--;
                $("#num" + x).attr("value", num);
                $("#inform" + x).submit();
            }
        }

        //按钮加加
        function add(x) {
            var num = $("#num" + x).attr("value");
            num++;
            $("#num" + x).attr("value", num);
            $("#inform" + x).submit();
        }

        //信息提示
        function mess() {
            $("#smmodal").modal('show');
        }
    </script>
    <!-- jQery -->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"></script>
    <!-- bootstrap js -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    </body>
</c:if>
</html>
